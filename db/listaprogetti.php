<!doctype html>
<html lang="en">

<head>
    <title>List Autos</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
    <link href="../styles.css" rel="stylesheet">
    <script src="../jquery/jquery-3.6.0.min.js"></script>
</head>
<body>
<div class="container-fluid">
    <div class="col-md-12">
        <div class="row d-flex align-items-center justify-content-center text-center ml-auto">
            <?php
            include_once 'connection.php';
            $object = new Connection();
            $connection = $object->Connect();
            $query = "
            SELECT p.CodProgetto, p.Descrizione, p.Titolo, i.Contenuto , p.Importo_Finanziamento, p.Data_Scadenza, c.Descrizione, SUM(d.Importo) as TotaleDonazione
            FROM progetto p 
            JOIN categoria c on c.CodCategoria = p.CodCategoria_FK 
            JOIN immagine i on i.CodImmagine = p.CodImmagine_FK
            LEFT JOIN donazione d on d.CodProgetto_FK = p.CodProgetto
            WHERE p.Data_Scadenza >= CURRENT_DATE AND p.deleted = 0
            GROUP BY p.CodProgetto
        ";
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
                $totalepercentuale = round($donazionitotali / $obbietivo * 100,2);
                ?>
                <div class="card m-1" style="width: 30rem;">
                    <div class="card-header text-white text-uppercase" style="background-color: #00AA9E;">
                        <?php echo $categoria; ?>
                    </div>
                    <img class="card-img-top"
                         src="<?php echo $immagine; ?>"
                         alt="Card image cap">

                    <div class="first-content align-self-center p-3">
                        <h3 class="card-title text-uppercase"><?php echo $titolo; ?></h3>
                        <p class="lead mb-0">Scadenza: <?php echo $row[5]; ?></p>
                    </div>

                    <div class="card-body text-black-50">
                        <div class="third-content ml-auto mr-4 mb-2">
                            <p class="text-uppercase text-muted">Obbietivo Finanziamento</p>
                            <h4 class="font-weight-bold position-relative">$<?php echo $row[4]; ?></h4>
                        </div>

                        <div class="progress md-progress">
                            <div class="progress-bar bg-primary" role="progressbar" style="width: <?php
                            echo $totalepercentuale; ?>%;" aria-valuenow="25" aria-valuemin="0"
                                 aria-valuemax="100"><?php echo $totalepercentuale; ?>%
                            </div>
                        </div>
                    </div>
                    <button type="button" class="btn btn-info"
                            onclick="location.href='db/progetto.php?codprogetto=<?php echo $codiceprogetto; ?>'">Info
                    </button>
                </div>
                <?php
            }
            ?>
        </div>
    </div>
</div>

</body>

</html>