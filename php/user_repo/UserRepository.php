<?php declare(strict_types=1);

namespace app\repository;
require_once "trait/Singleton.php";
require_once "configuration/PDOConnection.php";
require_once "model/User.php";

use app\configuration\PDOConnection;
use app\traits\Singleton;
use PDO;
use User;

class UserRepository
{
    use Singleton;

    public function count(): int {
        $pdo = PDOConnection::getInstance()->getPdo();
        $stmt = $pdo->prepare("SELECT COUNT(*) count FROM users");
        $stmt->execute();
        return $stmt->fetchObject()->count;
    }

    public function findAll(int $limit = 10, int $offset = 0): array {
        $pdo = PDOConnection::getInstance()->getPdo();

        $stmt = $pdo->prepare("SELECT * FROM users LIMIT :limit OFFSET :offset");
        $stmt->bindParam(':limit', $limit, PDO::PARAM_INT);
        $stmt->bindParam(':offset', $offset, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_CLASS, User::class);
    }

    public function findById($id) {
        $pdo = PDOConnection::getInstance()->getPdo();
        $stmt = $pdo->prepare("SELECT * FROM users WHERE id = :id");
        $stmt->execute(["id" => (int)$id]);
        return $stmt->fetchObject(User::class);
    }
}
