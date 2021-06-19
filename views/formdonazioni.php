<!doctype html>
<html lang="en">
<head>
    <link rel="shortcut icon" href="#"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Donazione Progetto</title>

    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../styles.css">
    <link rel="stylesheet" href="../plugins/sweetalert2/sweetalert2.min.css">
</head>

<body>
<?php
include_once '../db/connection.php';
session_start();
$object = new Connection();
$connection = $object->Connect();
$userid = isset($_SESSION["s_userid"]);
$idprogetto = $_GET["idprogetto"];
//Informazione Progetto
$queryprogetto = "SELECT Titolo, Data_Scadenza, categoria.Descrizione as categoria, CodProgetto FROM progetto JOIN categoria on categoria.CodCategoria = progetto.CodCategoria_FK WHERE CodProgetto = $idprogetto";
$resultprogetto = $connection->prepare($queryprogetto);
$resultprogetto->execute();
while ($row = $resultprogetto->fetch()) {
    $TitoloProgetto =$row[0];
    $DatascadenzaProgetto =$row[1];
    $CategoriaProgetto =$row[2];
    $CodProgetto =$row[3];
}

//Informazioni Donatore
$query = "SELECT Nome, Cognome, Codice_Fiscale,CodDonatore FROM donatore WHERE CodDonatore = $userid";
$result = $connection->prepare($query);
$result->execute();

while ($row = $result->fetch()) {
    $Nome =$row[0];
    $Cognome =$row[1];
    $CodiceFiscale =$row[2];
    $CodDonatore =$row[3];
}
$connection = null;
?>

<div class="container-login">
    <div class="wrap-login">
        <form class="login-form validate-form" id="formDonazione" action="" method="post">
            <h3 class="text-black-50 text-center">Info Donatore</h3><br>

            <input type="number" id="iddonatore" name="iddonatore" value="<?php echo $CodDonatore; ?>" hidden disabled>

            <div class="wrap-input100">
                Nome:
                <input class="input100" type="text" id="nome" name="nome" value="<?php echo $Nome; ?>" disabled>
                <span class="focus-effect"></span>
            </div>

            <div class="wrap-input100">
                Cognome:
                <input class="input100" type="text" id="cognome" name="cognome" value="<?php echo $Cognome; ?>" disabled>
                <span class="focus-effect"></span>
            </div>

            <div class="wrap-input100">
                Codice Fiscale:
                <input class="input100" type="tel" id="codicefiscale" name="codicefiscale" value="<?php echo $CodiceFiscale; ?>" disabled/>
                <span class="focus-effect"></span>
            </div>

            <h6 class="text-black-50 text-center">Pagamento "Working in progress"</h6><br>

            <div class="wrap-input100" data-validate="tipo di pagamento incorretto">
                <label for="tipopagamento">Tipo di Pagamento:</label>
                <select class="input100" id="tipopagamento" name="tipopagamento">
                    <option value="Carta di Credito">Carta di Credito</option>
                    <option value="Bonifico">Bonifico</option>
                </select>
                <span class="focus-effect"></span>
            </div>

            <div class="wrap-input100" data-validate="importo incorretto">
                <input class="input100" type="number" id="importo" name="importo" placeholder="Importo" min="1" required>
                <span class="focus-effect"></span>
            </div>

            <h3 class="text-black-50 text-center">Info Progetto</h3><br>

            <input type="number" id="idprogetto" name="idprogetto" value="<?php echo $CodProgetto; ?>" hidden disabled>

            <div class="wrap-input100">
                Titolo:
                <input class="input100" type="text" id="titolo" name="titolo" value="<?php echo $TitoloProgetto; ?>" disabled>
                <span class="focus-effect"></span>
            </div>

            <div class="wrap-input100">
                Categoria:
                <input class="input100" type="text" id="categoria" name="categoria" value="<?php echo $CategoriaProgetto; ?>" disabled>
                <span class="focus-effect"></span>
            </div>

            <div class="wrap-input100">
                Data di Scadenza:
                <input class="input100" type="date" id="datascadenza" name="datascadenza" value="<?php echo $DatascadenzaProgetto; ?>" disabled/>
            </div>

            <div class="container-login-form-btn">
                <div class="wrap-login-form-btn">
                    <div class="login-form-bgbtn"></div>
                    <button type="submit" name="submit" class="login-form-btn">Dona</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
<script src="../jquery/jquery-3.6.0.min.js"></script>
<script src="../bootstrap/js/bootstrap.min.js"></script>
<script src="../popper/popper.min.js"></script>
<script src="../plugins/sweetalert2/sweetalert2.all.min.js"></script>
<script src="../code.js"></script>

</html>

