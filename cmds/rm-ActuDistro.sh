#!/bin/bash
# Ricardo Monla (https://github.com/rmonla)
# rm-ActuDistro.sh - v250311-2022
rmCMD="rm-ActuDistro.sh"

cat << 'SHELL' > "${rmCMD}"
#!/bin/bash
# Script para actualizar el sistema y reiniciar si es necesario

clear
echo "Actualizando el sistema..."

if sudo apt update -y && sudo apt full-upgrade -y && sudo apt autoremove -y; then
    echo "Actualización completada correctamente."
else
    echo "Error durante la actualización del sistema."
    exit 1
fi

# Verificar si se requiere reinicio
if [ -f /var/run/reboot-required ]; then
    read -p "El sistema requiere un reinicio. ¿Deseas reiniciar ahora? (s/n): " RESPUESTA
    if [[ "\$RESPUESTA" =~ ^[sS](i|I)?$ ]]; then
        echo "Reiniciando el sistema..."
        sudo reboot -f
    else
        echo "No se reinició el sistema. Por favor, recuerda reiniciar más tarde."
    fi
else
    echo "No se requiere reinicio."
fi
SHELL

# Dar permisos de ejecución al script
chmod +x "${rmCMD}"

# Ejecutar el script
./"${rmCMD}"
