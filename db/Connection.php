<?php

class Connection
{
    public static function Connect()
    {
        define('server', 'eu-cdbr-west-01.cleardb.net');
        define('db', 'crowdfunding');
        define('username', 'b2f98f70fdf170');
        define('password', '51daa4fe1e2b6ea ');
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
