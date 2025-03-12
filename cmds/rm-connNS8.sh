#!/bin/bash
# Ricardo Monla (https://github.com/rmonla)
# rm-connNS8.sh - v250312-0958

# rmCMD=rm-connNS8.sh && sh -c "$(curl -fsSL https://github.com/rmonla/rmCMDs/raw/refs/heads/main/cmds/${rmCMD})"

rmCMD="rm-connNS8.sh"

cat << 'SHELL' > "${rmCMD}"
#!/bin/bash
clear

# Array de IPs
ips=("172.25.0.1" "190.114.205.17")

# Valores predeterminados
usuario="rmonla"
puerto="7022"

# Colores
verde="\e[32m"
rojo="\e[31m"
amarillo="\e[33m"
reset="\e[0m"

# Función para mostrar el menú
mostrar_menu() {
    echo -e "${verde}====== MENÚ SSH ======${reset}"
    for i in "${!ips[@]}"; do
        echo -e "$i) Conectar a ${ips[$i]}"
    done
    echo -e "u) Cambiar usuario (actual: ${amarillo}$usuario${reset})"
    echo -e "p) Cambiar puerto  (actual: ${amarillo}$puerto${reset})"
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
            if [[ $opcion -ge 0 && $opcion -lt ${#ips[@]} ]]; then
                echo -e "${verde}Conectando a ${ips[$opcion]} como $usuario en el puerto $puerto...${reset}"
                ssh -p "$puerto" "$usuario@${ips[$opcion]}"
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
        [pP])
            read -p "Ingrese el nuevo puerto [$puerto]: " nuevo_puerto
            if [[ "$nuevo_puerto" =~ ^[0-9]+$ ]]; then
                puerto="$nuevo_puerto"
                echo -e "${verde}Puerto cambiado a: $puerto${reset}"
            else
                echo -e "${rojo}Puerto no válido. Usando el anterior: $puerto${reset}"
            fi
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
