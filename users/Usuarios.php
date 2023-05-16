<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../CSS/style.css">
    <title>MSV Fotografia Studio</title>
</head>
<body>

    <?php
        include ("../config/conexion.php");
        include ("Rol.php");
        $record = $conexion_db->query("SELECT * FROM usuario");
        $registros = $record->fetchAll(PDO::FETCH_OBJ); //$record devuelve un objeto creado por cada registro de la tabla usuario  
    ?>

    <h1>Usuarios</h1>
    <table>
        <tr>
            <th>Nombre</th>
            <th>Correo</th>
            <th>Rol</th>
            <th>Opciones</th>
        </tr>
        <?php foreach ($registros as $usuario):?>
        <tr>
            <td> <?php echo $usuario->nombre ?> </td>
            <td> <?php echo $usuario->correo ?> </td>
            <td> <?php find_rol($usuario->rol) ?> </td>

            <td class="boton"><input type="button" name="delete" id="delete" value="Eliminar Usuario"
                class="boton"><input type="button" name="update" id="update" value="Modificar Usuario"></td>
        </tr>
        <?php endforeach; ?>
        <tr>
    </table>
</body>
</html>