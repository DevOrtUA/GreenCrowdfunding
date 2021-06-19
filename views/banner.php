<?php
include_once '../db/connection.php';

$object = new Connection();
$connection = $object->Connect();

$querydonazioni = "SELECT SUM(Importo) FROM donazione";
$resultSet = $connection->prepare($querydonazioni);
$resultSet->execute();
while ($row = $resultSet->fetch()) {
    $totaledonazioni = $row[0];
}

$queryorganizzazione = "SELECT COUNT(*) as TotaleOrganizzazione FROM organizzazione";
$resultSet = $connection->prepare($queryorganizzazione);
$resultSet->execute();
while ($row = $resultSet->fetch()) {
    $totaleorganizzazioni = $row[0];
}

$queryprogetti = "SELECT COUNT(*) as TotaleProgetti FROM progetto WHERE deleted = 0";
$resultSet = $connection->prepare($queryprogetti);
$resultSet->execute();
while ($row = $resultSet->fetch()) {
    $totaleprogetti = $row[0];
}
$connection = null;
?>

<!-- Banner Section -->
  <div class="container">
    <!-- Banner Content -->
    <div class="row">
      <div class="col-sm-12 bg-hero">
        <div class="banner_content">
          <div class="underline"></div>
          <h2>We're a digital Crowdy.</h2>
        </div>
      </div>
    </div>

    <!-- Content box -->
    <div class="row">
      <div class="col-12 col-sm-12 col-lg-4">
        <a href="#">
          <div class="infobox active">
            <div class="infobox-icon">
              <i class="fas fa-dollar-sign"> <?php echo $totaledonazioni; ?></i>
            </div>
            <div class="infobox-content">
              <h3 class="title">Donazioni</h3>
              <p>Totale delle donazioni che sono state fatte dai partecipanti.</p>
            </div>
          </div>
        </a>
      </div>
      <div class="col-12 col-sm-12 col-lg-4">
        <a href="#">
          <div class="infobox">
            <div class="infobox-icon">
              <i class="fas fa-building"> <?php echo $totaleorganizzazioni; ?></i>
            </div>
            <div class="infobox-content">
              <h3 class="title">Organizzazioni</h3>
              <p>Organizzazioni che sono state coinvolte a creare delle iniziative.</p>
            </div>
          </div>
        </a>
      </div>
      <div class="col-12 col-sm-12 col-lg-4">
        <a href="#">
          <div class="infobox">
            <div class="infobox-icon">
              <i class="fas fa-tools"> <?php echo $totaleprogetti; ?></i>
            </div>
            <div class="infobox-content">
              <h3 class="title">Progetti</h3>
              <p>Totale dei progetti che sono stati pubblicati nella piattaforma.</p>
            </div>
          </div>
        </a>
      </div>
    </div>
  </div>
<!-- Banner Section End -->