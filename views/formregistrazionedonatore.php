<!doctype html>
<html lang="en">
<head>
    <link rel="shortcut icon" href="#"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Registrazione Donatore</title>

    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../styles.css">
    <link rel="stylesheet" href="../plugins/sweetalert2/sweetalert2.min.css">
</head>

<body>
<?php
include_once '../db/connection.php';
    $object = new Connection();
    $connection = $object->Connect();
    $query = "SELECT CodStato, Nome_Stato FROM stato";
    $resultSet = $connection->prepare($query);
    $resultSet->execute();
?>

<div class="container-login">
    <div class="wrap-login">
        <form class="login-form validate-form" id="formRegistrazione" action="" method="post">
            <span class="login-form-title">Registrazione Donatore</span>

            <div class="wrap-input100" data-validate="nome incorretta">
                <input class="input100" type="text" id="nome" name="nome" placeholder="Nome" required>
                <span class="focus-effect"></span>
            </div>

            <div class="wrap-input100" data-validate="user incorretta">
                <input class="input100" type="text" id="cognome" name="cognome" placeholder="Cognome" required>
                <span class="focus-effect"></span>
            </div>

            <div class="wrap-input100" data-validate="stato incorretta">
                <label for="stato">Stato:</label>
                <select class="input100" id="stato" name="stato">
                    <?php
                    while ($row = $resultSet->fetch()) {
                        ?>
                        <option value="<?php echo $row[0]; ?>"><?php echo $row[1]; ?></option>
                        <?php
                    }
                    ?>
                </select>
                <span class="focus-effect"></span>
            </div>

            <div class="wrap-input100" data-validate="data di nascita incorretta">
                <input class="input100" type="date" id="datanascita" name="datanascita"/>
            </div>

            <div class="wrap-input100" data-validate="Email incorretta">
                <input class="input100" type="email" id="email" name="email" placeholder="Email" required/>
                <span class="focus-effect"></span>
            </div>

            <div class="wrap-input100" data-validate="Telefono incorretto">
                <input class="input100" type="tel" id="telefono" name="telefono" placeholder="Telefono" required/>
                <span class="focus-effect"></span>
            </div>
            <div class="wrap-input100" data-validate="Codice Fiscale incorretto">
                <input class="input100" type="tel" id="codicefiscale" name="codicefiscale" placeholder="Codice Fiscale"
                       required/>
                <span class="focus-effect"></span>
            </div>

            <div class="wrap-input100" data-validate="password incorretta">
                <input class="input100" type="password" id="password" name="password" placeholder="Password">
                <span class="focus-effect"></span>
            </div>

            <div class="container-login-form-btn">
                <div class="wrap-login-form-btn">
                    <div class="login-form-bgbtn"></div>
                    <button type="submit" name="submit" class="login-form-btn">Registrazione</button>
                </div>
            </div>
            <br>
            <div>
                <a class="text-center" href="..">Torna nella Home</a>
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
