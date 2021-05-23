<?php
session_start();

if ($_SESSION["s_username"] === null) {
    header("Location: ../index.php");
}else{
    if($_SESSION["s_roleid"]!=1){
        header("Location: pag_error.php");
    }
}

?>
<!doctype html>
<html lang="en">
<head>
    <link rel="shortcut icon" href="#"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Login</title>

    <link rel="stylesheet" href="../bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="../styles.css">
    <link rel="stylesheet" href="../plugins/sweetalert2/sweetalert2.min.css">
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <div class="jumbotron">

                <h1 class="display-4 text-center">Welcome</h1>
                <h2 class="text-center">User: <span
                            class="badge badge-success"><?php echo $_SESSION["s_username"]; ?></span></h2>
                <p class="lead text-center">login successful</p>
                <hr class="mv-4">
                <a class="btn btn-danger btn-lg" href="../db/logout.php" role="button">logout</a>
            </div>
        </div>
    </div>
</div>
<script src="../jquery/jquery-3.6.0.min.js"></script>
<script src="../bootstrap/js/bootstrap.min.js"></script>
<script src="../popper/popper.min.js"></script>

<script src="../plugins/sweetalert2/sweetalert2.all.min.js"></script>
<script src="../code.js"></script>
</body>
</html>