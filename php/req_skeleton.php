<?php
$name = 'Romanoff';
try {
    $DB = new DB();

    $sql = $DB->pdo->prepare("SELECT * FROM `table` WHERE `name` = :name;");
    $sql->execute(array('name' => $name));
    $res = $sql->fetchAll();
    $res = json_encode(array('result' => $res));
    echo htmlspecialchars($res);
} catch (Exception $exception) {
    echo json_encode(array('status' => 'error' . $exception->getMessage()));
    die();
}