<?php

class Connection
{
    public static function Connect()
    {
        define('server', 'localhost');
        define('db', 'crowdfunding');
        define('username', 'admin');
        define('password', 'admin_2020@');
        $options = array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8');
        try {
            $connection = new PDO("mysql:host=" . server . ";dbname=" . db, username, password, $options);
            return $connection;
        } catch (Exception $e) {
            die("Connection failed: " . $e->getMessage());
        }
    }

}

?>