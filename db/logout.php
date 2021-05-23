<?php
session_start();
unset($_SESSION["s_username"]);
unset($_SESSION["s_roleid"]);
unset($_SESSION["s_role"]);
session_destroy();
header("Location:../index.php");
?>