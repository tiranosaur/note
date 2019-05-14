<?php
/**
 * Created by PhpStorm.
 * User: User
 * Date: 14.05.2019
 * Time: 2:59
 */

class DB
{

    public $DB = 0;
    public function __construct()
    {
        $host = 'localhost';
        $dbname = 'aghold';
        $username = 'root';
        $password = '';
        try {
            $this->DB = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
//            echo "Connected to $dbname at $host successfully.";
        } catch (PDOException $pe) {
            die("Could not connect to the database $dbname :" . $pe->getMessage());
        }
    }

    function select($sql, $fetchType='PDO::FETCH_ASSOC'){
        try{
            $rows = $this->DB->query($sql)->fetchAll();
            $arr = [];
            foreach ($rows as $row){
                array_push($arr, $row);
            }
            return $arr;
        }catch (Exception $exception){
            echo json_encode(array('status' => 'error'.$exception->getMessage()));
            die();
        }
    }
}