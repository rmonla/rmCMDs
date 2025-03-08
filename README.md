<!--  
# Ricardo Monla (https://github.com/rmonla)
# rmCMDs | readme.md | v250308-1357
-->
# rmCMDs

[![rmCMDs | readme.md | v250308-1357](https://img.shields.io/badge/rmCMDs%20%7C%20readme.md%20-v250308%201357-blue?logo=github&logoColor=white)](https://github.com/rmonla) [![Autor: Lic. Ricardo MONLA](https://img.shields.io/badge/Autor-Lic.%20Ricardo%20MONLA-orange?logo=mail.ru&logoColor=white)](mailto:rmonla@frlr.utn.edu.ar)

## Descripción
Este repositorio recopila comandos de Linux y Windows que uso periódicamente. También busca ser un recurso útil para programadores, administradores de IT y público en general.

## Índice de Comandos y Scripts
Aquí se encuentran diversos comandos y scripts organizados por prefijo según su plataforma y lenguaje.

### Índice de Ejemplos
- [1. `lnx_listar_archivos`](#1-lnx_listar_archivos)
- [2. `win_ver_ip`](#2-win_ver_ip)
- [3. `php_conexion_db`](#3-php_conexion_db)

### Ejemplos Iniciales

#### 1. `lnx_listar_archivos`
- **Código**:
  ```bash
  ls -la
  ```
- **Sinopsis**: Lista todos los archivos y directorios en el directorio actual, incluyendo archivos ocultos, con detalles de permisos y propietarios.
- [🔼 Volver al índice](#índice-de-ejemplos)

#### 2. `win_ver_ip`
- **Código**:
  ```batch
  ipconfig
  ```
- **Sinopsis**: Muestra la configuración de red actual en Windows, incluyendo la dirección IP, máscara de subred y puerta de enlace predeterminada.
- [🔼 Volver al índice](#índice-de-ejemplos)

#### 3. `php_conexion_db`
- **Código**:
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
- **Sinopsis**: Ejemplo básico de conexión a una base de datos MySQL utilizando PHP.
- [🔼 Volver al índice](#índice-de-ejemplos)

## Estructura del Repositorio
No hay una estructura de carpetas definida inicialmente, pero los scripts se identifican mediante prefijos en sus nombres:
- **Linux**: `lnx_`
- **Windows**: `win_`
- **PHP**: `php_`
- **SQL**: `sql_`
- **Python**: `py_`

## Contribuciones
Las contribuciones son bienvenidas. Para colaborar, sigue estos pasos:
1. Realiza un fork del repositorio.
2. Crea una nueva rama con tu mejora (`git checkout -b feature-nueva`).
3. Realiza cambios y confirma los cambios (`git commit -m "Descripción de la mejora"`).
4. Envía un pull request.

## ¡Invítame un Café! ☕
Si este proyecto te ha sido útil y deseas apoyar su desarrollo, considera invitarme un café. Cada contribución ayuda a mantener el flujo de trabajo y a mejorar herramientas como esta.

[![Invítame un café](https://img.shields.io/badge/Invítame%20un%20café-%23FFDD00?style=for-the-badge&logo=buymeacoffee&logoColor=white)](https://bit.ly/4hcukTf)

## Temas
Este repositorio está categorizado bajo los siguientes temas:
- `linux-commands`
- `windows-commands`
- `bash-scripts`
- `shell-scripts`
- `php`
- `sql`
- `python`
- `it-tools`
- `sysadmin`

## Licencia
Este proyecto está licenciado bajo la **MIT License**. Puedes ver más detalles en el archivo `LICENSE`.

## Archivo `.gitignore`
Se ha incluido un archivo `.gitignore` básico para excluir archivos innecesarios, como archivos temporales o de configuración local.

