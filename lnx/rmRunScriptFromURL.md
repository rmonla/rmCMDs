<!--  
# Ricardo Monla (https://github.com/rmonla/rmCMDs)
# rmRunScriptFromURL.md | v250308-1639
-->
# rmRunScriptFromURL

[![rmRunScriptFromURL | v250308-1639](https://img.shields.io/badge/rmRunScriptFromURL%20%7C%20v250308%201639-blue?logo=github&logoColor=white)](https://github.com/rmonla) [![Autor: Lic. Ricardo MONLA](https://img.shields.io/badge/Autor-Lic.%20Ricardo%20MONLA-orange?logo=mail.ru&logoColor=white)](mailto:rmonla@frlr.utn.edu.ar)

## Descripción
Este comando permite ejecutar un script desde una URL en sistemas Linux.

### Código
```bash
bash -c 'read -p "Ingrese la URL del script a ejecutar: " cmdURL && \
{ script_file=$(mktemp) && curl -fsSL "$cmdURL" -o "$script_file" && sh "$script_file" && rm -f "$script_file"; } \
|| { echo "Error: Falló la descarga o ejecución del script"; exit 1; }'
```

### Sinopsis
Solicita al usuario una URL de un script, lo descarga en un archivo temporal, lo ejecuta y luego elimina el archivo temporal. Si falla la descarga o la ejecución, muestra un mensaje de error y detiene el proceso.

### Uso
Ideal para ejecutar scripts remotos de manera temporal y segura, sin dejar rastros en el sistema.

### Dependencias
Requiere `curl` instalado en el sistema.

### Manejo de errores
Si falla la descarga, la ejecución o la eliminación del archivo temporal, se muestra un mensaje de error y se detiene la ejecución con `exit 1`.

### Ejemplo
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

### Notas
- El script se descarga en un archivo temporal creado con `mktemp`, lo que garantiza que no se sobrescriban archivos existentes.
- El archivo temporal se elimina automáticamente después de la ejecución, lo que mejora la seguridad y evita dejar rastros en el sistema.

[🔼 Volver al índice](../README.md#)