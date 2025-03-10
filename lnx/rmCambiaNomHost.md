### rmCambiaNomHost.sh
```shell
sh -c "$(curl -fsSL https://github.com/rmonla/rmLIBs/raw/refs/heads/master/_rmServers/rmCambiaNomHost.sh)"
```
El script **rmCambiaNomHost.sh** es una herramienta para cambiar el nombre del host en un sistema Linux. Primero, muestra el nombre actual del host y solicita al usuario que ingrese un nuevo nombre. Si se proporciona un nombre válido, el script modifica los archivos de configuración del sistema (`/etc/hosts` y `/etc/hostname`) para actualizar el nombre del host y luego reinicia el sistema para aplicar los cambios. Si no se ingresa un nombre válido, el script muestra un mensaje de error y finaliza sin realizar cambios. Está diseñado para ser ejecutado con permisos de superusuario (`sudo`) debido a la modificación de archivos críticos del sistema.
