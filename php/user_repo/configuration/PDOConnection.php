<?php

namespace app\configuration;

require_once "trait/Singleton.php";

use app\traits\Singleton;
use PDO;

class PDOConnection
{
    use Singleton;

    private static PDO $pdo;

    private function __construct() {
        $host = 'mysql8';
        $username = 'root';
        $password = 'tiger';
        $dbName = 'docker';

        try {
            self::$pdo = new PDO("mysql:host={$host};dbname={$dbName}", $username, $password);
            self::$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            echo "Error: " . $e->getMessage();
        }
    }

    public function getPdo(): PDO {
        return self::$pdo;
    }

    function __destruct() {
        self::$pdo == null;
    }
}