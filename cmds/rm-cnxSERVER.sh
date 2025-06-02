#!/bin/bash

rmCMD="rm-cnxSERVER.sh"
cat << 'SHELL' > "${rmCMD}"
#!/bin/bash
# Ricardo Monla (https://github.com/rmonla)
# rm-cnxSERVER.sh - v250425-2300

# Ejecutar desde el repositorio si se pasa -r como argumento
if [[ "$1" == "-r" ]]; then
    echo -e "\n\e[32m>> Ejecutando script remoto desde GitHub...\e[0m"
    rmCMD=rm-cnxSERVER.sh && exec bash -c "$(curl -fsSL https://github.com/rmonla/rmCMDs/raw/refs/heads/main/cmds/${rmCMD})"
    exit 0
fi

clear

# Array de servidores
servers=(
    "ID=srvNS8 HOST=172.27.0.1 PORT=7022"
    "ID=srvNS8 HOST=10.0.10.8 PORT=7022"
    "ID=srvNS8 HOST=ns8.frlr.utn.edu.ar PORT=7022"
    "ID=srvNS8 HOST=dtic.frlr.utn.edu.ar PORT=7022"
    "ID=srvNS7 HOST=10.0.10.7"
    "ID=srvNS7 HOST=172.25.0.1"
    "ID=srvNS1 HOST=ns1.frlr.utn.edu.ar"
    "ID=srvDTIC HOST=dtic.frlr.utn.edu.ar"
    "ID=srvDTIC HOST=10.0.10.4"
    "ID=srvSITIO HOST=www.frlr.utn.edu.ar"
    "ID=srvSITIO0 HOST=s0.frlr.utn.edu.ar"
    "ID=srvKOHA HOST=koha.frlr.utn.edu.ar"
    "ID=srvKOHA HOST=10.0.10.130"
    "ID=srvDOCs HOST=docs.frlr.utn.edu.ar"
    "ID=srvDOCs HOST=10.0.10.14"
    "ID=srvTORII HOST=10.0.10.3"
    "ID=srvTORII HOST=dns.frlr.utn.edu.ar"
    "ID=srvTORII HOST=190.114.205.2"
    "ID=srvTELEs HOST=tele.frlr.utn.edu.ar"
    "ID=srvTELEs HOST=10.0.10.6"
    "ID=srvPMOX1 HOST=10.0.10.9"
    "ID=srvPMOX1 HOST=pmox1.frlr.utn.edu.ar"
    "ID=srvPMOX2 HOST=10.0.10.200"
    "ID=srvPMOX2 HOST=pmox2.frlr.utn.edu.ar"
    "ID=srvXEN01 HOST=10.0.10.23"
    "ID=srvXEN02 HOST=10.0.10.24"
)

usuario_predeterminado="rmonla"
puerto_predeterminado="22"

verde="\e[32m"
rojo="\e[31m"
amarillo="\e[33m"
reset="\e[0m"

# Obtener lista única de IDs
get_grupos_unicos() {
    local ids=()
    for entry in "${servers[@]}"; do
        [[ "$entry" =~ ID=([^[:space:]]+) ]] && ids+=("${BASH_REMATCH[1]}")
    done
    # Quitar duplicados
    echo "${ids[@]}" | tr ' ' '\n' | sort -u
}

mostrar_menu_grupos() {
    clear
    echo -e "${verde}====== GRUPOS DISPONIBLES [$(hostname)] ======${reset}\n"
    grupos=($(get_grupos_unicos))
    for i in "${!grupos[@]}"; do
        echo -e "$i) ${amarillo}${grupos[$i]}${reset}"
    done
    echo -e "\nu) Cambiar usuario (actual: ${amarillo}$usuario_predeterminado${reset})"
    echo -e "p) Cambiar puerto (actual: ${amarillo}$puerto_predeterminado${reset})"
    echo -e "r) Ejecutar desde el repositorio remoto"
    echo -e "q) Salir"
    echo -e "\n=============================================\n"
}

mostrar_submenu_grupo() {
    grupo="$1"
    clear
    echo -e "${verde}>> Servidores en grupo '$grupo':${reset}\n"

    opciones=()
    for i in "${!servers[@]}"; do
        [[ "${servers[$i]}" =~ ID=$grupo ]] && opciones+=("$i")
    done

    for idx in "${!opciones[@]}"; do
        i="${opciones[$idx]}"
        IFS=' ' read -r -a server_data <<< "${servers[$i]}"
        host="${server_data[1]#HOST=}"
        port="${server_data[2]#PORT=}"
        usr="${server_data[3]#USR=}"

        echo -n -e "$idx) Host: ${verde}$host${reset}"
        [[ -n "$port" ]] && echo -n -e ", Puerto: $port"
        [[ -n "$usr" ]] && echo -n -e ", Usuario: $usr"
        echo
    done
    echo -e "\nb) Volver al menú principal\n"

    read -p "Seleccione un servidor [0]: " subopcion
    subopcion="${subopcion:-0}"

    if [[ "$subopcion" == "b" ]]; then return; fi
    if [[ "$subopcion" =~ ^[0-9]+$ && "$subopcion" -ge 0 && "$subopcion" -lt "${#opciones[@]}" ]]; then
        idx="${opciones[$subopcion]}"
        IFS=' ' read -r -a server_data <<< "${servers[$idx]}"
        id="${server_data[0]#ID=}"
        host="${server_data[1]#HOST=}"
        port="${server_data[2]#PORT=}"
        usr="${server_data[3]#USR=}"
        [[ -z "$port" ]] && port="$puerto_predeterminado"
        [[ -z "$usr" ]] && usr="$usuario_predeterminado"

        echo -e "${verde}Conectando a $id ($host) como $usr en el puerto $port...${reset}"
        ssh -p "$port" "$usr@$host"
        echo -e "${amarillo}Sesión finalizada. Volviendo al menú...${reset}"
    else
        echo -e "${rojo}Opción inválida.${reset}"
    fi
}

# Bucle principal
while true; do
    mostrar_menu_grupos
    read -p "Seleccione un grupo: " opcion

    case "$opcion" in
        [qQ]) echo -e "${amarillo}Saliendo...${reset}"; exit 0 ;;
        [rR]) echo -e "${verde}Ejecutando remoto...${reset}"; rmCMD=rm-cnxSERVER.sh && exec bash -c "$(curl -fsSL https://github.com/rmonla/rmCMDs/raw/refs/heads/main/cmds/${rmCMD})" ;;
        [uU]) read -p "Nuevo usuario [$usuario_predeterminado]: " nuevo; [[ -n "$nuevo" ]] && usuario_predeterminado="$nuevo" ;;
        [pP]) read -p "Nuevo puerto [$puerto_predeterminado]: " nuevo; [[ "$nuevo" =~ ^[0-9]+$ ]] && puerto_predeterminado="$nuevo" ;;
        ''|*[0-9]*)
            grupos=($(get_grupos_unicos))
            if [[ "$opcion" -ge 0 && "$opcion" -lt "${#grupos[@]}" ]]; then
                mostrar_submenu_grupo "${grupos[$opcion]}"
            else
                echo -e "${rojo}Grupo inválido.${reset}"
            fi
            ;;
        *) echo -e "${rojo}Opción inválida.${reset}" ;;
    esac
done


SHELL

# Dar permisos de ejecución al script
chmod +x "${rmCMD}"

# Ejecutar el script
./"${rmCMD}"
