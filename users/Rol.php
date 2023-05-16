<?php
    function find_rol($rol) {
        if ($rol != 0) {
            echo "Administrador";
        }
        else{
            echo "Usuario";
        }
    }
?>