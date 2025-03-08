<!--  
# Ricardo Monla (https://github.com/rmonla)
# rmCMDs | lnx_removePackage.md | v250308-1620
-->
# lnx_removePackage

[![lnx_removePackage | v250308-1620](https://img.shields.io/badge/lnx_removePackage%20%7C%20v250308%201620-blue?logo=github&logoColor=white)](https://github.com/rmonla) [![Autor: Lic. Ricardo MONLA](https://img.shields.io/badge/Autor-Lic.%20Ricardo%20MONLA-orange?logo=mail.ru&logoColor=white)](mailto:rmonla@frlr.utn.edu.ar)

## Descripción
Este comando elimina un paquete y sus residuos en sistemas Linux.

### Código
```bash
bash -c 'read -p "Ingrese el nombre del paquete a eliminar: " nomAPP && \
echo "Eliminando $nomAPP..." && \
sudo apt remove -y "$nomAPP" && \
sudo apt purge -y "$nomAPP*" && \
sudo dpkg -P "$nomAPP*" 2>/dev/null && \
rm -rf ~/.config/"$nomAPP" ~/.cache/"$nomAPP" ~/.local/share/"$nomAPP" && \
echo "Limpieza completa."'
```

### Sinopsis
Solicita al usuario el nombre de un paquete, lo elimina, purga sus archivos de configuración y elimina directorios relacionados en el sistema de archivos del usuario.

### Uso
Ideal para eliminar completamente un paquete y sus residuos en sistemas basados en Debian/Ubuntu.

### Dependencias
Requiere permisos de superusuario (`sudo`) y el gestor de paquetes `apt`.

### Manejo de errores
Si el paquete no existe o no se puede eliminar, el comando continúa con la limpieza de archivos residuales.

### Ejemplo
```bash
bash -c 'read -p "Ingrese el nombre del paquete a eliminar: " nomAPP && \
echo "Eliminando $nomAPP..." && \
sudo apt remove -y "$nomAPP" && \
sudo apt purge -y "$nomAPP*" && \
sudo dpkg -P "$nomAPP*" 2>/dev/null && \
rm -rf ~/.config/"$nomAPP" ~/.cache/"$nomAPP" ~/.local/share/"$nomAPP" && \
echo "Limpieza completa."'
```

- **Entrada del usuario**:
  ```
  Ingrese el nombre del paquete a eliminar: nombre-del-paquete
  ```
- **Salida esperada**:
  ```
  Eliminando nombre-del-paquete...
  Limpieza completa.
  ```

### Notas
- Elimina el paquete, sus archivos de configuración y directorios residuales en `~/.config`, `~/.cache` y `~/.local/share`.
- Es útil para garantizar que no queden rastros del paquete en el sistema.

[🔼 Volver al índice](../README.md#índice-de-ejemplos)