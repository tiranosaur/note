6

In my recent project, I handled these requirement in that way.. First of All Database Table Structure/Migration

User Table
class CreateUserTable extends Migration {

    public function up() {
        Schema::create('user', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->string('email')->unique();
            $table->string('password', 60);
            $table->boolean('status')->default(0);
            $table->boolean('is_admin')->default(0);
            $table->boolean('notify')->default(0);
            $table->rememberToken();
            $table->timestamps();
        });
    }

    public function down() {
        Schema::drop('user');
    }

}
Role Table
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateRoleTable extends Migration {
    public function up()
    {
        Schema::create('role', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name')->unique();
            $table->string('display_name')->nullable();
            $table->string('description')->nullable();
            $table->boolean('status')->default(0);
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::drop('role');
    }

}
Role And User Relation Table
class CreateRoleUserTable extends Migration {
    public function up() {
        // Create table for associating roles to users (Many-to-Many)
        Schema::create('role_user', function (Blueprint $table) {
            $table->integer('user_id')->unsigned();
            $table->integer('role_id')->unsigned();

            $table->foreign('user_id')->references('id')->on('user')
                ->onUpdate('cascade')->onDelete('cascade');
            $table->foreign('role_id')->references('id')->on('role')
                ->onUpdate('cascade')->onDelete('cascade');

            $table->primary(['user_id', 'role_id']);
        });
    }

    public function down() {
        Schema::drop('role_user');
    }

}
After these table you have to handle permission by assigning to specific Role.

Permission
class Permission extends Migration {

    public function up() {
        Schema::create('permission', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name')->unique();
            $table->string('pattern');
            $table->string('target');
            $table->string('module');
            $table->string('display_name')->nullable();
            $table->boolean('status')->default(0);
            $table->timestamps();
        });
    }

    public function down() {
        Schema::drop('permission');
    }

}
Permission and Role Table Relation
class PermissionRole extends Migration {
    public function up() {
        // Create table for associating roles to permission (Many-to-Many)
        Schema::create('permission_role', function (Blueprint $table) {
            $table->integer('permission_id')->unsigned();
            $table->integer('role_id')->unsigned();

            $table->foreign('permission_id')->references('id')->on('permission')
                ->onUpdate('cascade')->onDelete('cascade');
            $table->foreign('role_id')->references('id')->on('role')
                ->onUpdate('cascade')->onDelete('cascade');

            $table->primary(['permission_id', 'role_id']);
        });
    }

    public function down() {
        Schema::drop('permission_role');
    }

}
And Finally our model would look alike:

User Model
namespace App;

use Illuminate\Auth\Authenticatable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Auth\Passwords\CanResetPassword;
use Illuminate\Contracts\Auth\Authenticatable as AuthenticatableContract;
use Illuminate\Contracts\Auth\CanResetPassword as CanResetPasswordContract;

class User extends Model implements AuthenticatableContract, CanResetPasswordContract {

    use Authenticatable, CanResetPassword;
    protected $table = 'user';
    protected $fillable = ['name', 'email', 'password', 'is_admin'];
    protected $hidden = ['password', 'remember_token'];

    public function scopeActive($query) {
        return $query->whereStatus('1');
    }
    public function scopeAdmin($query) {
        return $query->whereIsAdmin('1');
    }
    public function scopeNotify($query) {
        return $query->whereNotify('1');
    }

    public function roles() {
        return $this->belongsToMany('App\Role', 'role_user', 'user_id', 'role_id');
    }

    public function attachRole($role) {
        if (is_object($role)) {
            $role = $role->getKey();
        }
        if (is_array($role)) {
            $role = $role['id'];
        }
        $this->roles()->attach($role);
    }

    public function detachRole($role) {
        if (is_object($role)) {
            $role = $role->getKey();
        }
        if (is_array($role)) {
            $role = $role['id'];
        }
        $this->roles()->detach($role);
    }

    public function attachRoles($roles) {
        foreach ($roles as $role) {
            $this->attachRole($role);
        }
    }

    public function detachRoles($roles) {
        foreach ($roles as $role) {
            $this->detachRole($role);
        }
    }

    public function isSuperUser() {
        return (bool)$this->is_admin;
    }

    public function hasAccess($permissions, $all = true) {
        if ($this->isSuperUser()) {
            return true;
        }
        return $this->hasPermission($permissions, $all);
    }

    public function hasPermission($permissions) {
        $mergedPermissions = $this->getMergedPermissions();
        //dd($mergedPermissions);
        if (!is_array($permissions)) {
            $permissions = (array)$permissions;
        }

        foreach ($permissions as $permission) {
            $matched = false;
            // We will set a flag now for whether this permission was
            // matched at all.
            $founded_perms = find_in($mergedPermissions, "name", $permission);
            if (!empty($founded_perms)) {
                $matched = true;
            }

        }

        if ($matched === false) {
            return false;
        }

        return true;
    }

    public function getMergedPermissions() {
        $permissions = array();
        foreach ($this->getRoles() as $group) {
            $permissions = array_merge($permissions, $group->permissions()->get()->toArray());
        }
        return $permissions;
    }

    public function getRoles() {
        $roles = [];
        if ($this->roles()) {
            $roles = $this->roles()->get();
        }
        return $roles;
    }
}
Role Model
namespace App;

use Illuminate\Database\Eloquent\Model;

class Role extends Model {
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'role';
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['name', 'display_name', 'description'];

    public function scopeActive($query) {
        return $query->whereStatus('1');
    }

    /**
     * Many-to-Many relations with User.
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function users() {
        return $this->belongsToMany('App\User');
    }

    public function permissions() {
        return $this->belongsToMany("App\Permission");
    }

}
Permission Model
namespace App;

use Illuminate\Database\Eloquent\Model;

class Permission extends Model {
    protected $table = 'permission';
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['name', 'pattern', 'target', 'module', 'display_name', 'status'];

    public static function displayable() {
        $prepared_array = [];
        $temp = self::orderBy('module')->get()->toArray();
        foreach ($temp as $sin) {
            $prepared_array[$sin['module']][] = $sin;
        }
        return $prepared_array;
    }
    public function scopeActive($query) {
        return $query->whereStatus('1');
    }

    public function roles() {
        return $this->belongsToMany("App\Role");
    }
}
