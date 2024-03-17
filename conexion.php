<?php
class CConexion
{
    function ConexionBD()
    {
        $host = "postgresrds1.cbcec0scsed1.us-east-2.rds.amazonaws.com";
        $dbname = "RDS";
        $username = "postgres";
        $password = "123456789"; // Agrega la contraseña aquí

        try
        {
            $cone = new PDO("pgsql:host=$host;dbname=$dbname;user=$username;password=$password");
            echo "Se conectó correctamente a la base de datos";
        }
        catch(PDOException $exp)
        {
            echo ("No se pudo conectar a la base de datos, $exp");
        }
        
        return $cone;
    }
}
?>
