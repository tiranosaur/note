<?php

namespace App\Http\Controllers;

use App\Http\Model\Role;
use App\User;
use Illuminate\Http\Request;

/**
 * Class UserController
 * @package App\Http\Controllers
 */
class UserController extends Controller
{
    /**
     *
     */
    public function index()
    {
        $users = User::all();
        return view('user.index', ['users' => $users]);
    }

    /**
     *
     */
    public function create()
    {
    }

    /**
     * @param Request $request
     */
    public function store(Request $request)
    {
    }

    /**
     * @param User $user
     */
    public function show(User $user)
    {
    }

    /**
     * @param User $user
     */
    public function edit(User $user)
    {
        $roles = Role::all();
        $userRoles = [];
        foreach ($user->roles as $item) {
            array_push($userRoles, $item->name);
        }
        return view('user.edit', ['user' => $user, 'roles' => $roles, 'userRoles' => $userRoles]);
    }

    /**
     * @param Request $request
     * @param User $user
     */
    public function update(Request $request, User $user)
    {
        $roles = Role::all();
        $userRoles = User::getRoles($user);
        foreach ($roles as $item){
            try{
                empty($request->{$item->name}) ? $user->roles()->detach($item->id) : $user->roles()->attach($item->id);
            }catch (\Exception $e){
                $aa = 1;
            }
        }
        return $this->index();
    }

    /**
     * @param User $user
     */
    public function destroy(User $user)
    {
    }
}
