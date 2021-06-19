<?php
include_once 'connection.php';
$object = new Connection();
$connection = $object->Connect();

$titolo = (isset($_POST['titolo'])) ? $_POST['titolo'] : '';
$descrizione = (isset($_POST['descrizione'])) ? $_POST['descrizione'] : '';
$categoria = (isset($_POST['categoria'])) ? $_POST['categoria'] : '';
$datascadenza = (isset($_POST['datascadenza'])) ? $_POST['datascadenza'] : '';
$importofinanziamento = (isset($_POST['importofinanziamento'])) ? $_POST['importofinanziamento'] : '';
$proposto = (isset($_POST['proposto'])) ? $_POST['proposto'] : '';
$immagine = (isset($_POST['immagine'])) ? $_POST['immagine'] : '';

$queryinserimentoimmagine = "INSERT INTO immagine(Contenuto) VALUES ('$immagine')";
$resultimmagine = $connection->prepare($queryinserimentoimmagine);
$resultimmagine->execute();
$last_id = $connection->lastInsertId();
if ($last_id == 0) {
    echo "Errore Inserimento Immagine";
} else {
    $querycreazioneprogetto = "INSERT INTO progetto(Descrizione, Titolo, CodImmagine_FK, Importo_Finanziamento, CodOrganizzazione_FK, Data_Scadenza, CodCategoria_FK)
        SELECT '$descrizione','$titolo','$last_id','$importofinanziamento','$proposto','$datascadenza','$categoria'
        WHERE NOT EXISTS (
            SELECT Titolo FROM progetto WHERE Titolo = 'Titolo' AND CodOrganizzazione_FK = 'CodOrganizzazione_FK' AND Descrizione ='Descrizione'
        ) LIMIT 1;";

    $resultprogetto = $connection->prepare($querycreazioneprogetto);
    $resultprogetto->execute();

    $last_id = $connection->lastInsertId();
    if (!$querycreazioneprogetto) {
        echo "\nPDO::errorInfo():\n";
        print_r($connection->errorInfo());
    }

    if ($last_id == 0) {
        echo "Progetto già Creato";
    }

}

$connection = null;