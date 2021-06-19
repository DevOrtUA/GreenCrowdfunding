<?php
session_start();

if ($_SESSION["s_username"] === null) {
    header("Location: ../index.php");
}else {
    http_response_code(403);
    die('Forbidden No Admin');
}

?>