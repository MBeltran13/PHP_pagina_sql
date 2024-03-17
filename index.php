<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Visualizador de Tablas PHP</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #e0f2f1;
            text-align: center;
        }

        h2 {
            color: #333;
        }

        table {
            border-collapse: collapse;
            width: 80%;
            margin: 20px auto;
            background-color: #fff;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        form {
            margin-top: 20px;
        }

        input[type="text"], select {
            padding: 5px;
        }

        input[type="submit"], .dropdown-btn, .search-btn {
            padding: 5px 10px;
            border: none;
            cursor: pointer;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: #fff;
        }

        .dropdown-btn {
            background-color: #3498db;
            color: #fff;
        }

        .search-btn {
            background-color: #e74c3c;
            color: #fff;
        }
    </style>
</head>
<body>
    <?php
        include_once("conexion.php");

        class VisualizadorTablas
        {
            private $conexion;

            public function __construct()
            {
                $this->conexion = (new CConexion())->ConexionBD();
            }

            public function visualizarTabla($nombreTabla)
            {
                $consulta = $this->conexion->prepare("SELECT * FROM $nombreTabla");
                $consulta->execute();
                $resultados = $consulta->fetchAll(PDO::FETCH_ASSOC);

                echo "<h2>$nombreTabla</h2>";
                $this->imprimirTabla($resultados);
            }

            private function imprimirTabla($resultados)
            {
                if (count($resultados) > 0) {
                    echo "<table><tr>";
                    foreach ($resultados[0] as $columna => $valor) {
                        echo "<th>$columna</th>";
                    }
                    echo "</tr>";

                    foreach ($resultados as $fila) {
                        echo "<tr>";
                        foreach ($fila as $valor) {
                            echo "<td>$valor</td>";
                        }
                        echo "</tr>";
                    }

                    echo "</table>";
                } else {
                    echo "<p>No hay datos en la tabla</p>";
                }
            }

            public function obtenerTablas()
            {
                try {
                    $consultaTablas = $this->conexion->query("SELECT table_name FROM information_schema.tables WHERE table_schema='public'");
                    return $consultaTablas->fetchAll(PDO::FETCH_COLUMN);
                } catch (PDOException $e) {
                    echo "Error al obtener las tablas: " . $e->getMessage();
                    return [];
                }
            }
        }

        // Ejemplo de uso
        $visualizador = new VisualizadorTablas();

        // Obtener la tabla seleccionada del menú desplegable
        $tablaSeleccionada = isset($_GET['tabla']) ? $_GET['tabla'] : null;

        // Visualizar la tabla seleccionada (si está definida)
        if ($tablaSeleccionada) {
            $visualizador->visualizarTabla($tablaSeleccionada);
        }

        // Obtener la lista de tablas desde la base de datos
        $tablas = $visualizador->obtenerTablas();

        // Formulario de búsqueda y menú desplegable
        echo "<form action='' method='GET'>";
        echo "<label for='tabla'>Seleccionar Tabla: </label>";
        echo "<select name='tabla' id='tabla'>";
        foreach ($tablas as $tabla) {
            echo "<option value='$tabla'>$tabla</option>";
        }
        echo "</select>";
        echo "<input type='submit' class='dropdown-btn' value='Mostrar Tabla'>";
        echo "</form>";

        // Botón de búsqueda superior
        echo "<form action='' method='GET'>";
        echo "<input type='text' name='search' placeholder='Palabra clave'>";
        echo "<input type='submit' class='search-btn' value='Buscar'>";
        echo "</form>";
    ?>
</body>
</html>
