#!/bin/bash
# Ricardo Monla (https://github.com/rmonla)
# rm-connNS8.sh - v250312-1026

# rmCMD=rm-connNS8.sh && sh -c "$(curl -fsSL https://github.com/rmonla/rmCMDs/raw/refs/heads/main/cmds/${rmCMD})"

rmCMD="rm-connNS8.sh"

cat << 'SHELL' > "${rmCMD}"
#!/bin/bash
clear

# Array de servidores con IP y PORT
servers=(
    "IP=172.25.0.1 PORT=7022"
    "IP=190.114.205.3 PORT=22"
)

# Valores predeterminados
usuario="rmonla"

# Colores
verde="\e[32m"
rojo="\e[31m"
amarillo="\e[33m"
reset="\e[0m"

# Función para mostrar el menú
mostrar_menu() {
    echo -e "${verde}====== MENÚ SSH ======${reset}"
    for i in "${!servers[@]}"; do
        # Extraer datos del servidor
        IFS=' ' read -r -a server_data <<< "${servers[$i]}"
        ip="${server_data[0]#IP=}"
        port="${server_data[1]#PORT=}"
        echo -e "$i) Conectar a ${verde}$ip${reset} (Puerto: $port)"
    done
    echo -e "u) Cambiar usuario (actual: ${amarillo}$usuario${reset})"
    echo -e "q) Salir"
    echo -e "========================="
}

# Loop principal
while true; do
    mostrar_menu

    # Leer la opción del usuario
    read -p "Seleccione una opción [0]: " opcion

    # Si no se ingresa una opción, usar la opción predeterminada (0)
    opcion="${opcion:-0}"

    case $opcion in
        [0-9])
            if [[ $opcion -ge 0 && $opcion -lt ${#servers[@]} ]]; then
                # Extraer datos del servidor seleccionado
                IFS=' ' read -r -a server_data <<< "${servers[$opcion]}"
                ip="${server_data[0]#IP=}"
                port="${server_data[1]#PORT=}"

                echo -e "${verde}Conectando a $ip como $usuario en el puerto $port...${reset}"
                ssh -p "$port" "$usuario@$ip"
                echo -e "${amarillo}Sesión finalizada. Volviendo al menú...${reset}"
            else
                echo -e "${rojo}Opción no válida. Inténtalo de nuevo.${reset}"
            fi
            ;;
        [uU])
            read -p "Ingrese el nuevo usuario [$usuario]: " nuevo_usuario
            [[ -n "$nuevo_usuario" ]] && usuario="$nuevo_usuario"
            echo -e "${verde}Usuario cambiado a: $usuario${reset}"
            ;;
        [qQ])
            echo -e "${amarillo}Saliendo...${reset}"
            exit 0
            ;;
        *)
            echo -e "${rojo}Opción no válida. Inténtalo de nuevo.${reset}"
            ;;
    esac
done

SHELL

# Dar permisos de ejecución al script
chmod +x "${rmCMD}"

# Ejecutar el script
./"${rmCMD}"
