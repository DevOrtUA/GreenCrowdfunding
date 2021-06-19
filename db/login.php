<?php
session_start();

include_once 'connection.php';
$object = new Connection();
$connection = $object->Connect();

$username = (isset($_POST['username'])) ? $_POST['username'] : '';
$password = (isset($_POST['password'])) ? $_POST['password'] : '';

$pass = md5($password);

$query = "SELECT CodUtente, Nome, ruolo.CodRuolo, ruolo.Descrizione as Ruolo FROM utente JOIN ruolo on ruolo.CodRuolo = utente.CodRuolo_FK WHERE Nome='$username' AND Password='$pass' ";
$result = $connection->prepare($query);
$result->execute();

if (!$query) {
    echo "\nPDO::errorInfo():\n";
    print_r($connection->errorInfo());
}

if ($result->rowCount() >= 1) {
    $data = $result->fetchAll(PDO::FETCH_ASSOC);
    $_SESSION["s_username"] = $data[0]["Nome"];
    $_SESSION["s_roleid"] = $data[0]["CodRuolo"];
    $_SESSION["s_role"] = $data[0]["Ruolo"];
} else {
    $_SESSION["s_username"] = null;
    $data = null;
}

print json_encode($data);
$connection = null;
