<?php declare(strict_types=1);

namespace App\Service;

class MainService
{
    public function getHello(): string {
        return "Welcome to my app! pal";
    }

    public function getHelloArray(): array {
        return [
            "status" => "OK",
            "message" => "Welcome to my app! pal",
        ];
    }
}