<?php
include_once 'connection.php';
$object = new Connection();
$connection = $object->Connect();

$nome = (isset($_POST['nome'])) ? $_POST['nome'] : '';
$cognome = (isset($_POST['cognome'])) ? $_POST['cognome'] : '';
$stato = (isset($_POST['stato'])) ? $_POST['stato'] : '';
$datanascita = (isset($_POST['datanascita'])) ? $_POST['datanascita'] : '';
$email = (isset($_POST['email'])) ? $_POST['email'] : '';
$telefono = (isset($_POST['telefono'])) ? $_POST['telefono'] : '';
$codicefiscale = (isset($_POST['codicefiscale'])) ? $_POST['codicefiscale'] : '';
$password = (isset($_POST['password'])) ? $_POST['password'] : '';
$pass = md5($password);

//codice ruolo donatore = 1
$coddonatore = 1;

$query = "INSERT INTO donatore (Nome, Cognome, CodStato_FK, Data_Nascita, Email, Telefono, Codice_Fiscale, Password, CodRuolo_FK) 
SELECT '$nome','$cognome','$stato','$datanascita','$email','$telefono','$codicefiscale','$pass',$coddonatore
WHERE NOT EXISTS (
    SELECT email FROM donatore WHERE email = '$email'
) LIMIT 1;";

$result = $connection->prepare($query);
$result->execute();

$last_id = $connection->lastInsertId();
if (!$query) {
    echo "\nPDO::errorInfo():\n";
    print_r($connection->errorInfo());
}

if ($last_id == 0) {
    echo "Donatore già Registrato";
}

$connection = null;
