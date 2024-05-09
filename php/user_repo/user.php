<?php
require_once __DIR__ . "/repository/UserRepository.php";
require_once __DIR__ . "/model/User.php";

use app\repository\UserRepository;

$repository = UserRepository::getInstance();
$count = $repository->count();
$users = $repository->findAll(10, $count - 10);
echo json_encode($users);