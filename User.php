<?php
/**
 * Created by PhpStorm.
 * User: andorsarig
 * Date: 30.07.2018
 * Time: 13:58
 */

class User
{
    private $name;
    private $email;

    public function __construct(string $name, string $email)
    {
        $this->name = $name;
        $this->email = $email;
    }

    public function getName() {
        return $this->name;
    }

    public function getEmail()
    {
        return $this->email;
    }
}