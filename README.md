<!--  
# Ricardo Monla (https://github.com/rmonla)
# rmCMDs | readme.md | v250308-1553
-->
# rmCMDs

[![rmCMDs | readme.md | v250308-1553](https://img.shields.io/badge/rmCMDs%20%7C%20readme.md%20-v250308%201553-blue?logo=github&logoColor=white)](https://github.com/rmonla) [![Autor: Lic. Ricardo MONLA](https://img.shields.io/badge/Autor-Lic.%20Ricardo%20MONLA-orange?logo=mail.ru&logoColor=white)](mailto:rmonla@frlr.utn.edu.ar)

## Descripción
Este repositorio recopila comandos de Linux y Windows que uso periódicamente. También busca ser un recurso útil para programadores, administradores de IT y público en general.

## Índice de Comandos y Scripts
Aquí se encuentran diversos comandos y scripts organizados por prefijo según su plataforma y lenguaje.

### Índice de Ejemplos
- [1. `lnx_runScriptFromURL`](#1-lnx_runscriptfromurl)
- [2. `win_ver_ip`](#2-win_ver_ip)
- [3. `php_conexion_db`](#3-php_conexion_db)

### Ejemplos Iniciales

#### 1. `lnx_runScriptFromURL`
- **Código**:
  ```bash
  bash -c 'read -p "Ingrese la URL del script a ejecutar: " cmdURL && \
  { script_file=$(mktemp) && curl -fsSL "$cmdURL" -o "$script_file" && sh "$script_file" && rm -f "$script_file"; } \
  || { echo "Error: Falló la descarga o ejecución del script"; exit 1; }'
  ```
- **Sinopsis**: Solicita al usuario una URL de un script, lo descarga en un archivo temporal, lo ejecuta y luego elimina el archivo temporal. Si falla la descarga o la ejecución, muestra un mensaje de error y detiene el proceso.
- **Uso**: Ideal para ejecutar scripts remotos de manera temporal y segura, sin dejar rastros en el sistema.
- **Dependencias**: Requiere `curl` instalado en el sistema.
- **Manejo de errores**: Si falla la descarga, la ejecución o la eliminación del archivo temporal, se muestra un mensaje de error y se detiene la ejecución con `exit 1`.
- **Ejemplo**:
  ```bash
  bash -c 'read -p "Ingrese la URL del script a ejecutar: " cmdURL && \
  { script_file=$(mktemp) && curl -fsSL "$cmdURL" -o "$script_file" && sh "$script_file" && rm -f "$script_file"; } \
  || { echo "Error: Falló la descarga o ejecución del script"; exit 1; }'
  ```
  - **Entrada del usuario**:
    ```
    Ingrese la URL del script a ejecutar: https://ejemplo.com/ruta/al/script.sh
    ```
  - **Salida esperada**:
    - Si todo funciona correctamente, el script se ejecuta y no se muestra ningún error.
    - Si falla, se muestra: `Error: Falló la descarga o ejecución del script`.

- **Notas**:
  - El script se descarga en un archivo temporal creado con `mktemp`, lo que garantiza que no se sobrescriban archivos existentes.
  - El archivo temporal se elimina automáticamente después de la ejecución, lo que mejora la seguridad y evita dejar rastros en el sistema.

- [🔼 Volver al índice](#índice-de-ejemplos)

---

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
