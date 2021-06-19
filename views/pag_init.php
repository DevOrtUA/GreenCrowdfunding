<?php
include_once '../db/connection.php';
session_start();

if ($_SESSION["s_username"] === null) {
    header("Location: ../index.php");
} else {
    if ($_SESSION["s_roleid"] != 0) {
        header("Location: pag_error.php");
    }
}


$object = new Connection();
$connection = $object->Connect();
$query = "SELECT CodProgetto, Titolo, Data_Scadenza FROM progetto WHERE deleted = 0 AND Data_Scadenza >= CURRENT_DATE";
$resultSet = $connection->prepare($query);
$resultSet->execute();

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
    <script type="text/Javascript">
        function OpenPopupWindowCreazione() {
            var url = "../views/formcreazioneprogetto.php";
            donazione = window.open(url, 'creazioneprogetto', 'left=20,top=20,width=500,height=1200,toolbar=1,resizable=0');
            donazione.focus()
        }

        function OpenPopupWindowEliminazione() {
            var codprogetto = document.getElementById("Codprogetto").value;
            var url = "../views/formeliminazioneprogetto.php?codprogetto=" + codprogetto;
            console.log(codprogetto);
            eliminazione = window.open(url, 'eliminazioneprogetto', 'left=20,top=20,width=500,height=1200,toolbar=1,resizable=0');
            eliminazione.focus()
        }

        function OpenPopupWindowAggiornamento() {
            var url = "../views/formaggiornamentoprogetto.php";
            // donazione = window.open(url, 'aggiornamentoprogetto', 'left=20,top=20,width=500,height=1200,toolbar=1,resizable=0');
            // donazione.focus()
        }
    </script>
</head>
<body>

<nav class="navbar navbar-expand-lg">
    <a class="navbar-brand" href="../index.html">Crowdfunding</a>
    <button class="navbar-toggler menu-toggle" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        <span></span>
        <span></span>
        <span></span>
    </button>

    <div class="navbar-collapse justify-content-end collapse show" id="navbarNav">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="../index.html">Home <span class="sr-only">(current)</span></a>
            </li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="navbar-brand">
                <?php
                echo $_SESSION["s_username"];
                echo '</li>';
                echo '</ul>';
                echo '<a class="btn btn-danger btn-lg" href="../db/logout.php" role="button">logout</a>';
                ?>
    </div>
</nav>


<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <div class="jumbotron">

                <h1 class="display-4 text-center">Welcome</h1>
                <h2 class="text-center">User: <span
                            class="badge badge-success"><?php echo $_SESSION["s_username"]; ?></span></h2>
                <p class="lead text-center">login successful</p>
                <hr class="mv-4">

                <div class="col-sm-9">
                    <button class="btn-block btn-primary" onclick="OpenPopupWindowCreazione();">Creazione Progetto
                    </button>
                </div>
                <br>

                <div class="col-sm-9">
                    <form class="login-form validate-form" id="formEliminazioneProgetto" action="" method="post">
                        <div class="wrap-input100">
                            <label for="Codprogetto">Elenco Progetti:</label>
                            <select class="input100" id="Codprogetto" name="Codprogetto">
                                <?php
                                while ($row = $resultSet->fetch()) {
                                    ?>
                                    <option value="<?php echo $row[0]; ?>"><?php echo "Titolo: ",$row[1]," Scadenza:",$row[2]; ?></option>
                                    <?php
                                }
                                ?>
                            </select>
                            <span class="focus-effect"></span>
                        </div>
                        <button class="btn-block btn-primary" onclick="OpenPopupWindowEliminazione();">Eliminazione
                            Progetto
                        </button>
                    </form>
                </div>
                <br>
                <div class="col-sm-9">
                    <button class="btn-block btn-primary" onclick="OpenPopupWindowAggiornamento();">Aggiornamento Progetto "working
                        in progress"
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="../jquery/jquery-3.6.0.min.js"></script>
<script src="../bootstrap/js/bootstrap.min.js"></script>

<script src="../plugins/sweetalert2/sweetalert2.all.min.js"></script>
<script src="../code.js"></script>
</body>
</html>