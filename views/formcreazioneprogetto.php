<!doctype html>
<html lang="en">
<head>
    <link rel="shortcut icon" href="#"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Creazione Progetto</title>

    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../styles.css">
    <link rel="stylesheet" href="../plugins/sweetalert2/sweetalert2.min.css">
</head>

<body>
<?php
include_once '../db/connection.php';
$object = new Connection();
$connection = $object->Connect();

//GET CATEGORIE
$querycategorie = "SELECT CodCategoria, Descrizione FROM categoria";
$resultCategorie = $connection->prepare($querycategorie);
$resultCategorie->execute();

//GET ORGANIZZAZIONI
$queryorganizzazione = "SELECT CodOrganizzazione, Nome FROM organizzazione";
$resultOrganizzazione = $connection->prepare($queryorganizzazione);
$resultOrganizzazione->execute();
?>

<div class="container-login">
    <div class="wrap-login">
        <form class="login-form validate-form" id="formCreazioneProgetto" action="" method="post">
            <span class="login-form-title">Eliminazione Progetto</span>

            <div class="wrap-input100" data-validate="nome incorretta">
                <input class="input100" type="text" id="titolo" name="titolo" placeholder="Titolo" required>
                <span class="focus-effect"></span>
            </div>

            <div class="wrap-input100" data-validate="descrizione incorretta">
                <input class="input100" type="text" id="descrizione" name="descrizione" placeholder="Descrizione" required>
                <span class="focus-effect"></span>
            </div>

            <div class="wrap-input100" data-validate="stato incorretta">
                <label for="categoria">Categoria:</label>
                <select class="input100" id="categoria" name="categoria">
                    <?php
                    while ($rowCategorie = $resultCategorie->fetch()) {
                        ?>
                        <option value="<?php echo $rowCategorie[0]; ?>"><?php echo $rowCategorie[1]; ?></option>
                        <?php
                    }
                    ?>
                </select>
                <span class="focus-effect"></span>
            </div>

            <div class="wrap-input100" data-validate="stato incorretta">
                <label for="proposto">Proposto da:</label>
                <select class="input100" id="proposto" name="proposto">
                    <?php
                    while ($rowOrganizzazione = $resultOrganizzazione->fetch()) {
                        ?>
                        <option value="<?php echo $rowOrganizzazione[0]; ?>"><?php echo $rowOrganizzazione[1]; ?></option>
                        <?php
                    }
                    ?>
                </select>
                <span class="focus-effect"></span>
            </div>

            <div class="wrap-input100" data-validate="data di scadenza incorretta">
                <label for="datascadenza">Data di scadenza</label>
                <input class="input100" type="date" id="datascadenza" name="datascadenza"/>
            </div>

            <div class="wrap-input100" data-validate="Importo incorretto">
                <input class="input100" type="number" id="importofinanziamento" name="importofinanziamento" placeholder="Importo da Finanziare" required/>
                <span class="focus-effect"></span>
            </div>

            <div class="wrap-input100" data-validate="Link incorretta">
                <input class="input100" type="url" id="immagine" name="immagine" placeholder="Link immagine" required>
                <span class="focus-effect"></span>
            </div>

            <div class="container-login-form-btn">
                <div class="wrap-login-form-btn">
                    <div class="login-form-bgbtn"></div>
                    <button type="submit" name="submit" class="login-form-btn">Registrazione</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script src="../jquery/jquery-3.6.0.min.js"></script>
<script src="../bootstrap/js/bootstrap.min.js"></script>
<script src="../popper/popper.min.js"></script>

<script src="../plugins/sweetalert2/sweetalert2.all.min.js"></script>
<script src="../code.js"></script>
</body>

</html>
