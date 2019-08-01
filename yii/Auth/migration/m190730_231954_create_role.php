<?php

use yii\db\Migration;

/**
 * Class m190730_231954_create_role
 */
class m190730_231954_create_role extends Migration
{
    public $table = 'role';
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {
        $this->createTable($this->table,[
            'id'       => $this->primaryKey(),
            'name' => $this->string(32)->notNull()->unique(),
            'description' => $this->string(255)
        ]);

        $this->insert($this->table, [
           'name'=>'admin',
           'description'=>'full permission. like god'
        ]);
        $this->insert($this->table, [
           'name'=>'guest',
           'description'=>'minimal permission. only show'
        ]);
    }

    public function down()
    {
        $this->dropTable($this->table);
    }

}
