<?php
session_start();
//roleid = 1 donatore
if (!isset($_SESSION["s_roleid"]) || isset($_SESSION["s_roleid"]) == null) {
    echo '
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="index.html">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#" onclick="ListaProgetti()">Progetti</a>
            </li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
        <li><a href="views/login_donatore.php" class="btn btn-primary"><span>Login</span></a></li>
        <li><a href="views/formregistrazionedonatore.php" class="btn btn-primary"><span>Registrazione</span></a></li>
        </ul>
    ';
} elseif (isset($_SESSION["s_roleid"]) && $_SESSION["s_roleid"] == 0) {
    echo '<ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="index.html">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#" onclick="ListaProgetti()">Progetti</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="views/pag_init.php">Dashboard Admin</a>
            </li>
        </ul>   
        <ul class="nav navbar-nav navbar-right">
            <li class="navbar-brand">
        ';
    echo $_SESSION["s_username"];
    echo '</li>';
    echo '</ul>';
    echo '<a class="btn btn-danger btn-lg" href="db/logout.php" role="button">logout</a>';
}else {
    echo '<ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="index.html">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#" onclick="ListaProgetti()">Progetti</a>
            </li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="navbar-brand">
        ';
    echo $_SESSION["s_username"];
    echo '</li>';
    echo '</ul>';
    echo '<a class="btn btn-danger btn-lg" href="db/logout.php" role="button">logout</a>';
}
?>