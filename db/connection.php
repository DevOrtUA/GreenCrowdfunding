<?php

class connection
{
    public static function Connect()
    {
        define('server', 'localhost');
        define('db', 'crowdfundingv2');
        define('username', 'root');
        define('password', '');
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