<!--  
# Ricardo Monla (https://github.com/rmonla/rmCMDs)
# rm-ActuDistro.sh | v250311-2111
-->
### rm-ActuDistro.sh
```shell
rmCMD=rm-ActuDistro.sh && \
sh -c "$(curl -fsSL https://github.com/rmonla/rmCMDs/raw/refs/heads/main/cmds/${rmCMD})"
```
Este script actualiza el sistema usando `apt`, ejecutando `update`, `full-upgrade` y `autoremove` con privilegios de superusuario. Si la actualización se completa exitosamente, muestra un mensaje de confirmación; en caso contrario, muestra un error y termina la ejecución. Luego, verifica si el sistema requiere un reinicio buscando el archivo `/var/run/reboot-required`. Si es necesario reiniciar, solicita al usuario una confirmación interactiva y, si acepta, reinicia el sistema; de lo contrario, recuerda reiniciar más tarde.
