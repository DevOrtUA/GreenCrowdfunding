<!doctype html>
<html lang="en">
<head>
    <link rel="shortcut icon" href="#"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Login</title>

    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../styles.css">
    <link rel="stylesheet" href="../plugins/sweetalert2/sweetalert2.min.css">
</head>

<body>

<div class="container-login">
    <div class="wrap-login">
        <form class="login-form validate-form" id="formLogin" action="" method="post">
            <span class="login-form-title">LOGIN ADMIN</span>

            <div class="wrap-input100" data-validate="invalid user">
                <input class="input100" type="text" id="username" name="username" placeholder="Username">
                <span class="focus-effect"></span>
            </div>

            <div class="wrap-input100" data-validate="Password incorrecto">
                <input class="input100" type="password" id="password" name="password" placeholder="Password">
                <span class="focus-effect"></span>
            </div>
            <div class="container-login-form-btn">
                <div class="wrap-login-form-btn">
                    <div class="login-form-bgbtn"></div>
                    <button type="submit" name="submit" class="login-form-btn">Login</button>
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
