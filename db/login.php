<?php
session_start();

include_once 'connection.php';
$object = new Connection();
$connection = $object->Connect();

$username = (isset($_POST['username'])) ? $_POST['username'] : '';
$password = (isset($_POST['password'])) ? $_POST['password'] : '';

$pass = md5($password);

$query = "SELECT users.roleid, roles.description AS role FROM users JOIN roles ON users.roleid = roles.roleid WHERE username='$username' AND password='$pass' ";
$result = $connection->prepare($query);
$result->execute();

if (!$query) {
    echo "\nPDO::errorInfo():\n";
    print_r($connection->errorInfo());
}

if ($result->rowCount() >= 1) {
    $data = $result->fetchAll(PDO::FETCH_ASSOC);
    $_SESSION["s_username"] = $username;
    $_SESSION["s_roleid"] = $data[0]["roleid"];
    $_SESSION["s_role"] = $data[0]["role"];
} else {
    $_SESSION["s_username"] = null;
    $data = null;
}

print json_encode($data);
$conexion = null;

//username:admin pass:12345
//username:demo pass:demo
