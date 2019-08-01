<?php

use yii\db\Migration;

/**
 * Class m190730_230158_create_users
 */
class m190730_230158_create_users extends Migration
{
    public $table = 'user';

    // Use up()/down() to run migration code without a transaction.
    public function up()
    {
        $this->createTable($this->table, [
            'id'       => $this->primaryKey(),
            'username'    => $this->string(16)->notNull()->unique(),
            'password' => $this->string(),
            'authKey'  => $this->string(32)->notNull()->unique(),

            'firstName' => $this->string(32),
            'lastName'  => $this->string(32),
            'email'     => $this->string(32)->unique(),
            'role_id'   => $this->integer(),

//            'created_at' => 'timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP',
//            'updated_at' => 'timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0)',

            ///wrong. Need to change
            'created_at' => $this->integer(),
            'updated_at' => $this->integer(),
        ]);
    }

    public function down()
    {
        $this->dropTable($this->table);
    }
}
