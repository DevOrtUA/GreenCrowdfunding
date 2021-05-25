<!doctype html>
<html lang="en">

<head>
    <title>Tutorial Lista Autos</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" >
</head>
<body>
<div class="container mt-3">
    <div class="row">

        <?php
        //TODO
        include_once 'db/connection.php';
        $object = new Connection();
        $connection = $object->Connect();
        $query = "SELECT `marca`, `modelo`, `anio`, `imagen` FROM `autos`";
        $resultSet = $connection->prepare($query);
        $resultSet->execute();
        while ($row = $resultSet->fetch()) {
            ?>
            <div class="card text-center">
                <div class="card">
                    //test
                    <a href="#" class="btn btn-primary"><img src="TempImages/<?php echo $row[3]; ?>" class="m-0" alt="..." height="200" width="342"></a>
                    //<img src="TempImages/<?php echo $row[3]; ?>" class="m-0" alt="..." height="200" width="342">
                    <div class="card-body">
                        <h5 class="card-title"><?php echo $row[0] . " " . $row[1]; ?></h5>
                        <p class="card-text">
                            Año:<?php echo $row[2]; ?>
                        </p>
                        <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
            </div>
            <?php
        }
        ?>
    </div>
</div>
</body>

</html>
