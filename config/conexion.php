<?php
    require "config.php";     //Configuracion de la base de datos
    try {

        $conexion_db = new PDO('mysql:host=' . DB_HOST . '; dbname=' . DB_NAME,DB_USER,DB_PASSWORD);      //conexion_db = instancia de la base PDO
        $conexion_db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);    //Atrapar expeciones
        $conexion_db->exec("SET CHARACTER SET utf8");
        //echo "Conexion realizada";
    
    } catch (Exception $e) {
        die("Error: " . $e->getMessage());
    }
?>