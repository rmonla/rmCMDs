#!/bin/bash
# Ricardo Monla (https://github.com/rmonla)
# rm-cnxSERVER.sh - v250316-1109

rmCMD="rm-cnxSERVER.sh"

cat << 'SHELL' > "${rmCMD}"
#!/bin/bash
clear

# Array de servidores con ID, HOST, PORT (opcional) y USR (opcional)
servers=(
    "ID=ns8_vpn HOST=172.25.0.1 PORT=7022"
    "ID=ns8_utnlan HOST=10.0.10.8 PORT=7022"
    "ID=ns8_wan HOST=ns8.frlr.utn.edu.ar PORT=7022"
    "ID=ns7_vpn HOST=172.23.0.1"
    "ID=utnDNS HOST=190.114.205.2"
    "ID=utnWWW HOST=www.frlr.utn.edu.ar"
    "ID=utnTORII HOST=190.114.205.3"
    "ID=utnKOHA HOST=10.0.10.130"
    "ID=utnDOCs HOST=10.0.10.14"
    )

# Valores predeterminados
usuario_predeterminado="rmonla"
puerto_predeterminado="22"

# Colores
verde="\e[32m"
rojo="\e[31m"
amarillo="\e[33m"
reset="\e[0m"

# Función para mostrar el menú
mostrar_menu() {
    clear
    echo -e "${verde}====== MENÚ [$(hostname)] ======${reset}\n"
    for i in "${!servers[@]}"; do
        # Extraer datos del servidor
        IFS=' ' read -r -a server_data <<< "${servers[$i]}"
        id="${server_data[0]#ID=}"
        host="${server_data[1]#HOST=}"
        port="${server_data[2]#PORT=}"
        usr="${server_data[3]#USR=}"

        # Mostrar información del servidor
        echo -n -e "$i) Conectar a ${verde}$id${reset} (Host: $host"
        [[ -n "$port" ]] && echo -n -e ", Puerto: $port"
        [[ -n "$usr" ]] && echo -n -e ", Usuario: $usr"
        echo -e ")"
    done
    echo -e "\nu) Cambiar usuario predeterminado (actual: ${amarillo}$usuario_predeterminado${reset})"
    echo -e "p) Cambiar puerto predeterminado (actual: ${amarillo}$puerto_predeterminado${reset})"
    echo -e "r) Ejecutar éste sacript desde el repositorio${reset})"
    echo -e "q) Salir"
    echo -e "\n=========================\n"
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
                id="${server_data[0]#ID=}"
                host="${server_data[1]#HOST=}"
                port="${server_data[2]#PORT=}"
                usr="${server_data[3]#USR=}"

                # Usar valores predeterminados si PORT o USR no están definidos
                [[ -z "$port" ]] && port="$puerto_predeterminado"
                [[ -z "$usr" ]] && usr="$usuario_predeterminado"

                echo -e "${verde}Conectando a $id ($host) como $usr en el puerto $port...${reset}"
                ssh -p "$port" "$usr@$host"
                echo -e "${amarillo}Sesión finalizada. Volviendo al menú...${reset}"
            else
                echo -e "${rojo}Opción no válida. Inténtalo de nuevo.${reset}"
            fi
            ;;
        [uU])
            read -p "Ingrese el nuevo usuario predeterminado [$usuario_predeterminado]: " nuevo_usuario
            [[ -n "$nuevo_usuario" ]] && usuario_predeterminado="$nuevo_usuario"
            echo -e "${verde}Usuario predeterminado cambiado a: $usuario_predeterminado${reset}"
            ;;
        [pP])
            read -p "Ingrese el nuevo puerto predeterminado [$puerto_predeterminado]: " nuevo_puerto
            if [[ "$nuevo_puerto" =~ ^[0-9]+$ ]]; then
                puerto_predeterminado="$nuevo_puerto"
                echo -e "${verde}Puerto predeterminado cambiado a: $puerto_predeterminado${reset}"
            else
                echo -e "${rojo}Puerto no válido. Usando el anterior: $puerto_predeterminado${reset}"
            fi
            ;;
        [rR])
            echo -e "Conectando a ${verde}github.com/rmonla/rmCMDs${reset} y ejecutando ${verde}rm-cnxSERVER.sh...${reset}"
            rmCMD=rm-cnxSERVER.sh && sh -c "$(curl -fsSL https://github.com/rmonla/rmCMDs/raw/refs/heads/main/cmds/${rmCMD})"
            exit 0
            ;;
        [qQ])
            echo -e "\n${amarillo}Saliendo...${reset}"
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
