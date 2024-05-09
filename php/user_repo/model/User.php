<?php declare (strict_types=1);

class User implements JsonSerializable
{
    private string $id;
    private string $username;
    private string $email;

    #[\ReturnTypeWillChange]
    public function jsonSerialize() {
        return get_object_vars($this);
    }

    public function getId(): string {
        return $this->id;
    }

    public function setId(string $id): void {
        $this->id = $id;
    }

    public function getUsername(): string {
        return $this->username;
    }

    public function setUsername(string $username): void {
        $this->username = $username;
    }

    public function getEmail(): string {
        return $this->email;
    }

    public function setEmail(string $email): void {
        $this->email = $email;
    }
}