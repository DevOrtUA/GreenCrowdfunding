<?php session_start();
unset($_SESSION["s_username"]);
unset($_SESSION["s_roleid"]);
unset($_SESSION["s_role"]);

?>
<!DOCTYPE html>
<html>
<body>
    <div style="width:150px;margin:auto;height:500px;margin-top:300px">

    <?php
session_destroy();

echo '<meta http-equiv="refresh" content="2;url=..">';
echo '<progress max=100><strong>Progress: 60% done.</strong></progress><br>';
echo '<span class="itext">Logging out please wait!...</span>';

?>
    </div>

</body>
</html>