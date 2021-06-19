<?php
include_once '../db/connection.php';
session_start();
$object = new Connection();
$connection = $object->Connect();

$codprogetto = $_GET["codprogetto"];
//Informazione Progetto
$queryprogetto = "SELECT Titolo, Data_Scadenza, categoria.Descrizione as categoria, CodProgetto FROM progetto JOIN categoria on categoria.CodCategoria = progetto.CodCategoria_FK WHERE CodProgetto = '$codprogetto'";
$resultprogetto = $connection->prepare($queryprogetto);
$resultprogetto->execute();
while ($row = $resultprogetto->fetch()) {
    $TitoloProgetto = $row[0];
    $DatascadenzaProgetto = $row[1];
    $CategoriaProgetto = $row[2];
    $CodProgetto = $row[3];
}
$connection = null;
?>

<!doctype html>
<html lang="en">
<head>
    <link rel="shortcut icon" href="#"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Eliminazione Progetto</title>

    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../styles.css">
    <link rel="stylesheet" href="../plugins/sweetalert2/sweetalert2.min.css">

</head>

<body>

<div class="container-login">
    <div class="wrap-login">
        <form class="login-form validate-form" id="formEliminazioneProgettoAdmin" action="" method="post">

            <h3 class="text-black-50 text-center">Info Progetto</h3><br>

            <input type="number" id="idprogettoeliminazione" name="idprogettoeliminazione"
                   value="<?php echo $CodProgetto; ?>" hidden disabled>

            <div class="wrap-input100">
                Titolo:
                <input class="input100" type="text" id="titoloeliminazione" name="titoloeliminazione"
                       value="<?php echo $TitoloProgetto; ?>" disabled>
                <span class="focus-effect"></span>
            </div>

            <div class="wrap-input100">
                Categoria:
                <input class="input100" type="text" id="categoriaeliminazione" name="categoriaeliminazione"
                       value="<?php echo $CategoriaProgetto; ?>" disabled>
                <span class="focus-effect"></span>
            </div>

            <div class="wrap-input100">
                Data di Scadenza:
                <input class="input100" type="date" id="datascadenzaeliminazione" name="datascadenzaeliminazione"
                       value="<?php echo $DatascadenzaProgetto; ?>" disabled/>
            </div>
            <div class="container-login-form-btn">
                <div class="wrap-login-form-btn">
                    <div class="login-form-bgbtn"></div>
                    <button type="submit" name="submit" class="login-form-btn">Elimina Progetto</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script src="../popper/popper.min.js"></script>
<script src="../plugins/sweetalert2/sweetalert2.all.min.js"></script>
<script src="../jquery/jquery-3.6.0.min.js"></script>
<script src="../code.js"></script>
</body>

</html>

