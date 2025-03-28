#!/bin/bash
# Ricardo Monla (https://github.com/rmonla)
# rm-actuDistro.sh - v250328-1137

rmCMD="rm-actuDistro.sh"

cat << 'SHELL' > "${rmCMD}"
#!/bin/bash
# Script para actualizar el sistema y reiniciar si es necesario

mostrar_ayuda() {
    echo "Uso: $0 [opciones]"
    echo ""
    echo "Opciones:"
    echo "  -h        Mostrar esta ayuda"
    echo "  -r        Ejecutando comando desde el repositorio"
    exit 0
}

ejecutar_actualizacion() {
    clear
    echo "Actualizando el sistema..."

    for aptRUN in update full-upgrade autoremove autoclean; do
        echo -e "\nEjecutando $aptRUN..."
        sudo apt $aptRUN -y
    done

    # Verificar si se requiere reinicio
    if [ -f /var/run/reboot-required ]; then
        echo "El sistema requiere un reinicio."
    else
        echo "No se requiere reinicio."
    fi
}

# Procesar parámetros
while getopts ":hr" opcion; do
    case $opcion in
        h)
            mostrar_ayuda
            ;;
        r)
            echo "Ejecutando comando desde el repositorio..."
            rmCMD=rm-actuDistro.sh && sh -c "$(curl -fsSL https://github.com/rmonla/rmCMDs/raw/refs/heads/main/cmds/${rmCMD})"
            ;;
        \?)
            echo "Opción inválida: -$OPTARG" >&2
            mostrar_ayuda
            ;;
    esac
done

# Si no se pasa ninguna opción, ejecutar actualización
if [ $OPTIND -eq 1 ]; then
    ejecutar_actualizacion
fi

SHELL

# Dar permisos de ejecución al script
chmod +x "${rmCMD}"

# Ejecutar el script
./"${rmCMD}"
