#!/bin/bash
# Ricardo Monla (https://github.com/rmonla)
# rm-connNS8.sh - v250312-0934

# rmCMD=rm-connNS8.sh && sh -c "$(curl -fsSL https://github.com/rmonla/rmCMDs/raw/refs/heads/main/cmds/${rmCMD})"

rmCMD="rm-connNS8.sh"

cat << 'SHELL' > "${rmCMD}"
#!/bin/bash

# Array de IPs
ips=("190.114.205.17" "172.25.0.1")

# Mostrar el menú
echo "Selecciona una opción para conectarte via SSH:"
for i in "${!ips[@]}"; do
    echo "$i) Conectar a ${ips[$i]}"
done
echo "${#ips[@]}) Salir"  # Opción para salir

# Leer la opción del usuario
read -p "Opción: " opcion

# Validar la opción seleccionada
if [[ $opcion -ge 0 && $opcion -lt ${#ips[@]} ]]; then
    echo "Conectando a ${ips[$opcion]}..."
    ssh -p 7022 ${ips[$opcion]}
elif [[ $opcion -eq ${#ips[@]} ]]; then
    echo "Saliendo..."
    exit 0
else
    echo "Opción no válida. Saliendo..."
    exit 1
fi

SHELL

# Dar permisos de ejecución al script
chmod +x "${rmCMD}"

# Ejecutar el script
./"${rmCMD}"
