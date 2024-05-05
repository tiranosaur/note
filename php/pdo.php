<?php

$host = "mysql8";
$dbname = "docker";
$username = "root";
$password = "tiger";
$db = new stdClass();

try {
    $db = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $query = "SELECT * FROM users WHERE id BETWEEN 90 AND 100";
    $stmt = $db->query($query);
    $authors = $stmt->fetchAll();
    foreach ($authors as $author) {
        echo $author["email"] . "<br>";
    }

    $query = "SELECT * FROM users WHERE id = :id";
    $stmt = $db->prepare($query);
    $stmt->execute(["id" => 100]);
    $author = $stmt->fetchObject();
    print_r($author ? $author : "not found");


    $insertQuery = "INSERT INTO users (id, name, email) VALUES (:id, :name, :email)";
    $stmt = $db->prepare($insertQuery);
    $stmt->execute(array("id" => 1, ':name' => 'John Doe', ':email' => 'john@example.com'));

    $updateQuery = "UPDATE users SET email = :email WHERE id = :id";
    $stmt = $db->prepare($updateQuery);
    $stmt->execute(array(':email' => 'XXX@example.com', ':id' => 1));

    $deleteQuery = "DELETE FROM users WHERE id = :id";
    $stmt = $db->prepare($deleteQuery);
    $stmt->execute(array(':id' => 1));
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
} finally {
    $db = null;
}
