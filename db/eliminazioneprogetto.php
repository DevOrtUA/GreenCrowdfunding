<?php
session_start();

include_once 'connection.php';
$object = new Connection();
$connection = $object->Connect();

$CodProgetto = (isset($_POST['codprogetto'])) ? $_POST['codprogetto'] : '';

$query = "UPDATE progetto SET deleted = 1 WHERE CodProgetto = $CodProgetto";
$result = $connection->prepare($query);
$result->execute();

if (!$query) {
    echo "\nPDO::errorInfo():\n";
    print_r($connection->errorInfo());
}

$connection = null;
