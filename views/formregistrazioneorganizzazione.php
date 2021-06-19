<!doctype html>
<html lang="en">
<head>
    <link rel="shortcut icon" href="#"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Registrazione Organizzazione</title>

    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../styles.css">
    <link rel="stylesheet" href="../plugins/sweetalert2/sweetalert2.min.css">
</head>

<body>

<div class="container-login">
    <div class="wrap-login">
        <form class="login-form validate-form" id="formRegistrazioneOrganizzazione" action="" method="post">
            <span class="login-form-title">Registrazione Organizzazione</span>

            <div class="wrap-input100" data-validate="nome Organizzazione incorretta">
                <input class="input100" type="text" id="nomeorganizzazione" name="nomeorganizzazione" placeholder="Nome Organizzazione" required>
                <span class="focus-effect"></span>
            </div>

            <div class="wrap-input100" data-validate="descrizione incorretta">
                <input class="input100" type="text" id="descrizione" name="descrizione" placeholder="Descrizione" required>
                <span class="focus-effect"></span>
            </div>

            <div class="wrap-input100" data-validate="Email incorretta">
                <input class="input100" type="email" id="email" name="email" placeholder="Email" required/>
                <span class="focus-effect"></span>
            </div>

            <div class="wrap-input100" data-validate="Telefono incorretto">
                <input class="input100" type="tel" id="telefono" name="telefono" placeholder="Telefono" required/>
                <span class="focus-effect"></span>
            </div>
            <div class="wrap-input100" data-validate="Partira Iva incorretto">
                <input class="input100" type="text" id="partitaiva" name="partitaiva" placeholder="Partira Iva" required/>
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
