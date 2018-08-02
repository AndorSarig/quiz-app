<?php
/**
 * Created by PhpStorm.
 * User: andorsarig
 * Date: 02.08.2018
 * Time: 12:36
 */

class Connection
{
    private $database;

    public function __construct()
    {
        $this->database = new PDO('mysql:host=localhost;port=3306;dbname=quiz-app', 'root', 'password');
    }

    public function getPDO() {
        return $this->database;
    }
}