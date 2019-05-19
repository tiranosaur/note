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

    function select($sql, $fetchType = 'PDO::FETCH_ASSOC')
    {
        try {
            $rows = $this->DB->query($sql)->fetchAll();
            $arr = [];
            foreach ($rows as $row) {
                array_push($arr, $row);
            }
            return $arr;
        } catch (Exception $exception) {
            echo json_encode(array('status' => 'error' . $exception->getMessage()));
            die();
        }
    }

    public function paginationRange($table, $numPage, $pagination, $range = 5)
    {
        $count = $this->pdo->query("SELECT id FROM $table")->fetchAll();
        $countPage = ceil(count($count) / $pagination);
        $halfRange = $range % 2 == 0 ? $range / 2 : ($range - 1) / 2;
        if ($countPage < $range) return ['start' => 1, 'page' => $numPage, 'end' => $countPage, 'last' => $countPage];
        else if ($numPage - $halfRange < 1) return ['start' => 1, 'page' => $numPage, 'end' => $range, 'last' => $countPage];
        else if ($numPage + $halfRange > $countPage) return ['start' => $countPage - $range + 1, 'page' => $numPage, 'end' => $countPage, 'last' => $countPage];
        else return ['start' => $numPage - $halfRange, 'page' => $numPage, 'end' => $numPage + $halfRange, 'last' => $countPage];
    }

    public function paginationRangeWithCount($count, $numPage, $pagination, $range = 5)
    {
        $countPage = ceil($count / $pagination);
        $halfRange = $range % 2 == 0 ? $range / 2 : ($range - 1) / 2;
        if ($countPage < $range) return ['start' => 1, 'page' => $numPage, 'end' => $countPage, 'last' => $countPage];
        else if ($numPage - $halfRange < 1) return ['start' => 1, 'page' => $numPage, 'end' => $range, 'last' => $countPage];
        else if ($numPage + $halfRange > $countPage) return ['start' => $countPage - $range + 1, 'page' => $numPage, 'end' => $countPage, 'last' => $countPage];
        else return ['start' => $numPage - $halfRange, 'page' => $numPage, 'end' => $numPage + $halfRange, 'last' => $countPage];
    }
}