<?php
include_once 'connection.php';
$object = new Connection();
$connection = $object->Connect();

$nomeorganizzazione = (isset($_POST['nomeorganizzazione'])) ? $_POST['nomeorganizzazione'] : '';
$descrizione = (isset($_POST['descrizione'])) ? $_POST['descrizione'] : '';
$email = (isset($_POST['email'])) ? $_POST['email'] : '';
$telefono = (isset($_POST['telefono'])) ? $_POST['telefono'] : '';
$partitaiva = (isset($_POST['partitaiva'])) ? $_POST['partitaiva'] : '';

$query = "INSERT INTO organizzazione(Nome, Descrizione, Partita_Iva, Email, Telefono) 
SELECT '$nomeorganizzazione','$descrizione','$partitaiva','$email','$telefono'
WHERE NOT EXISTS (
    SELECT Partita_Iva FROM organizzazione WHERE Partita_Iva = '$partitaiva'
) LIMIT 1;";

$result = $connection->prepare($query);
$result->execute();

$last_id = $connection->lastInsertId();
if (!$query) {
    echo "\nPDO::errorInfo():\n";
    print_r($connection->errorInfo());
}

if ($last_id == 0) {
    echo "Organizzazione già Registrata";
}

$connection = null;
