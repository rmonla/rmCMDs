<!--  
# Ricardo Monla (https://github.com/rmonla)
# rmCMDs | php_conexion_db.md | v250308-1624
-->
# php_conexion_db

[![php_conexion_db | v250308-1620](https://img.shields.io/badge/php_conexion_db%20%7C%20v250308%201620-blue?logo=github&logoColor=white)](https://github.com/rmonla) [![Autor: Lic. Ricardo MONLA](https://img.shields.io/badge/Autor-Lic.%20Ricardo%20MONLA-orange?logo=mail.ru&logoColor=white)](mailto:rmonla@frlr.utn.edu.ar)

## Descripción
Este script muestra cómo conectarse a una base de datos MySQL utilizando PHP.

### Código
```php
<?php
$servername = "localhost";
$username = "user";
$password = "pass";
$dbname = "database";

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}
echo "Conexión exitosa";
?>
```

### Sinopsis
Ejemplo básico de conexión a una base de datos MySQL utilizando PHP.

[🔼 Volver al índice](../README.md)