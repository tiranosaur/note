<?php

class Converter
{
    public static function toObject(array $array, $object) {
        $class = get_class($object);
        $methods = get_class_methods($class);
        if (count($methods) > 0) {
            return self::toObjectByMethod($array, $object);
        } else {
            return self::toObjectByFields($array, $object);
        }
    }

    public static function toObjectByMethod(array $array, $object) {
        $class = get_class($object);
        $methods = get_class_methods($class);
        foreach ($methods as $method) {
            preg_match(' /^(set)(.*?)$/i', $method, $results);
            $pre = $results[1] ?? '';
            $k = $results[2] ?? '';
            $k = strtolower(substr($k, 0, 1)) . substr($k, 1);
            if ($pre == 'set' && !empty($array[$k])) {
                $object->$method($array[$k]);
            }
        }
        return $object;
    }

    public static function toObjectByFields(array $array, $object) {
        $class = get_class($object);
        $fields = get_class_vars($class);
        foreach ($fields as $key => $value) {
            $object->{$key} = $array[$key];
        }
        return $object;
    }
}


$arr = json_decode('{"firstName":"James","lastName":"Smith","sex":true,"age":32,"number":5678568567}', true);
$user = Converter::toObject($arr, new User());
$person = Converter::toObject($arr, new Person());

echo "<pre>";
print_r($arr);
print_r($user);
print_r($person);
echo "</pre>";

class User
{
    public string $firstName;
    public string $lastName;
    public bool $sex;
    public int $age;
    public int $number;
}

class Person
{
    private string $firstName;
    private string $lastName;
    private bool $sex;
    private int $age;
    private int $number;

    public function getFirstName(): string {
        return $this->firstName;
    }

    public function setFirstName(string $firstName): void {
        $this->firstName = $firstName;
    }

    public function getLastName(): string {
        return $this->lastName;
    }

    public function setLastName(string $lastName): void {
        $this->lastName = $lastName;
    }

    public function isSex(): bool {
        return $this->sex;
    }

    public function setSex(bool $sex): void {
        $this->sex = $sex;
    }

    public function getAge(): int {
        return $this->age;
    }

    public function setAge(int $age): void {
        $this->age = $age;
    }

    public function getNumber(): int {
        return $this->number;
    }

    public function setNumber(int $number): void {
        $this->number = $number;
    }
}
