<!--  
# Ricardo Monla (https://github.com/rmonla/rmCMDs)
# rmCambiaNomHost.md | v250311-1821
-->
### rmCambiaNomHost.sh
```shell
rmCMD=rm-CambiaNomHost.sh && \
sh -c "$(curl -fsSL https://github.com/rmonla/rmCMDs/raw/refs/heads/main/cmds/${rmCMD})"
```
El script **rmCambiaNomHost.sh** es una herramienta para cambiar el nombre del host en un sistema Linux. Primero, muestra el nombre actual del host y solicita al usuario que ingrese un nuevo nombre. Si se proporciona un nombre válido, el script modifica los archivos de configuración del sistema (`/etc/hosts` y `/etc/hostname`) para actualizar el nombre del host y luego reinicia el sistema para aplicar los cambios. Si no se ingresa un nombre válido, el script muestra un mensaje de error y finaliza sin realizar cambios. Está diseñado para ser ejecutado con permisos de superusuario (`sudo`) debido a la modificación de archivos críticos del sistema.
