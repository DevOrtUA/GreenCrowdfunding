<?php
include_once 'connection.php';
session_start();

$id = $_GET["codprogetto"];

$object = new Connection();
$connection = $object->Connect();
$query = "SELECT p.CodProgetto, p.Descrizione, p.Titolo, i.Contenuto , p.Importo_Finanziamento, p.Data_Scadenza, c.Descrizione, SUM(d.Importo) as TotaleDonazione, o.Nome as nomeorganizzazione, o.Descrizione as descrizioneorganizzazione, o.Partita_Iva as partitaivaorganizzazione, o.Telefono as telefonoorganizzazione, o.Email as emailorganizzazione
            FROM progetto p 
            JOIN categoria c on c.CodCategoria = p.CodCategoria_FK 
            JOIN immagine i on i.CodImmagine = p.CodImmagine_FK
            JOIN organizzazione o on o.CodOrganizzazione = p.CodOrganizzazione_FK
            LEFT JOIN donazione d on d.CodProgetto_FK = p.CodProgetto
            WHERE p.Data_Scadenza >= CURRENT_DATE AND p.CodProgetto = $id
            GROUP BY p.CodProgetto";
$resultSet = $connection->prepare($query);
$resultSet->execute();
while ($row = $resultSet->fetch()) {
    $codiceprogetto = $row[0];
    $descrizione = $row[1];
    $titolo = $row[2];
    $immagine = $row[3];
    $obbietivo = $row[4];
    $datascadenza = $row[5];
    $categoria = $row[6];
    $donazionitotali = $row[7];
    $nomeorganizzazione = $row[8];
    $descrizioneorganizzazione = $row[9];
    $partitaivaorganizzazione = $row[10];
    $telefonodescrizioneorganizzazione = $row[11];
    $emailorganizzazione = $row[12];
    $totalepercentuale = round($donazionitotali / $obbietivo * 100,2);
}
?>

<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
    <link href="../styles.css" rel="stylesheet">
    <script src="../jquery/jquery-3.6.0.min.js"></script>
    <script type = "text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
    <title>Detaglio Progetto</title>
    <script type="text/Javascript">
        function OpenPopupWindow()
        {
            var url = "../views/formdonazioni.php?idprogetto=<?php echo $id?>";
            donazione = window.open(url ,'donazione','left=20,top=20,width=500,height=1200,toolbar=1,resizable=0');
            donazione.focus()
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
        <ul class="nav navbar-nav navbar-right" id="nav">
            <?php
            if (!isset($_SESSION["s_roleid"]) || isset($_SESSION["s_roleid"]) === null) {
                echo '
                    <li><a href="../views/login_donatore.php" class="btn btn-primary"><span>Login</span></a></li>
                    <li><a href="../views/formregistrazionedonatore.php" class="btn btn-primary"><span>Registrazione</span></a></li>
                ';
            } else {
                echo '
                <a class="btn btn-danger btn-lg" href="../db/logout.php" role="button">logout</a>
                ';
            }
            ?>
        </ul>
    </div>
</nav>

<section class="hero py-4">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 ">
                <div class="hero-post shadow">
                    <img class="img-fluid" src="<?php echo $immagine; ?>" alt="">
                    <div class="hero-post-badges">
                        <a class="p-2" href="#"><i class="fa fa-calendar-o" aria-hidden="true">Scadenza <?php echo $datascadenza; ?></i></a>
                    </div>
                    <div class="row p-3">
                        <div class="col-sm-10">
                            <h1 class="text-center"><?php echo $titolo; ?></h1>
                        </div>
                    </div>
                </div>
            </div>
            <aside class="col-md-4 shadow">

                <h4 class="aside-heading mt-4 text-center">Categoria</h4>
                <div class="badge w-100">
                    <p class="badge-info">
                        <?php echo $categoria; ?>
                    </p>
                </div>
                <h2 class="aside-heading mt-4 text-center text-uppercase">Dati Organizatore</h2>
                <article class="row">
                    <div class="col-sm-9 shadow">
                        <h5 class="small p-2">Nome: <?php echo $nomeorganizzazione; ?></h5>
                        <h5 class="small p-2">Descrizione: <?php echo $descrizioneorganizzazione; ?></h5>
                        <h5 class="small p-2">Partita Iva: <?php echo $partitaivaorganizzazione; ?></h5>
                        <h5 class="small p-2">Telefono: <?php echo $telefonodescrizioneorganizzazione; ?></h5>
                        <h5 class="small p-2">Email: <?php echo $emailorganizzazione; ?></h5>
                    </div>
                    <div class="card-body text-black-50">
                        <div class="third-content ml-auto mr-4 mb-2">
                            <p class="text-uppercase text-muted">Obbietivo Finanziamento</p>
                            <h4 class="font-weight-bold position-relative">$<?php echo $obbietivo; ?></h4>
                        </div>
                        <div class="progress md-progress">
                            <div class="progress-bar bg-primary" role="progressbar" style="width: <?php
                            echo $totalepercentuale; ?>%;" aria-valuenow="25" aria-valuemin="0"
                                 aria-valuemax="100"><?php echo $totalepercentuale; ?>%
                            </div>
                        </div>
                        <div class="third-content ml-auto mr-4 mb-2">
                            <p class="text-muted">Totale Donazione: $<?php echo $donazionitotali; ?></p>
                        </div>

                    </div>
                    <?php
                    //roleid = 1 donatore
                    if (isset($_SESSION["s_roleid"]) && $_SESSION["s_roleid"] == 1) {
                        echo '<div class="col-sm-9">
                                    <button class="btn-block btn-primary" onclick="OpenPopupWindow();">Donare</button>
                              </div>
                        ';
                    }
                    ?>
                </article>
            </aside>
        </div>
    </div>
</section>
<section class="hero py-4">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 shadow content">
                <div class="p-content p-4"><?php echo $descrizione; ?></div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
