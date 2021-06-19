<?php
session_start();

include_once 'connection.php';
$object = new Connection();
$connection = $object->Connect();

$CodDonatore = (isset($_POST['iddonatore'])) ? $_POST['iddonatore'] : '';
$CodProgetto = (isset($_POST['codprogetto'])) ? $_POST['codprogetto'] : '';
$Tipopagamento = (isset($_POST['tipopagamento'])) ? ($_POST["tipopagamento"]) : '';
$Importo = (isset($_POST['importo'])) ? $_POST['importo'] : '';
$DataPagamento = date('Y-m-d');

$query = "INSERT INTO donazione(CodDonatore_FK, CodProgetto_FK, `Tipo_Pagamento`, Importo, Data_Pagamento) VALUES ($CodDonatore,$CodProgetto,'$Tipopagamento',$Importo,'$DataPagamento')";
$result = $connection->prepare($query);
$result->execute();

if (!$query) {
    echo "\nPDO::errorInfo():\n";
    print_r($connection->errorInfo());
}

$connection = null;
