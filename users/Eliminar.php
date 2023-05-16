<?php
    include("../config/conexion.php");
    $correo = $_GET["correo"];
    $conexion_db->query("DELETE FROM usuario WHERE correo ='$correo'");
    header("Location:Usuarios.php");
?>