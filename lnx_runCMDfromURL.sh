bash -c 'read -p "Ingrese la URL del script a ejecutar: " cmdURL && { script_file=$(mktemp) && curl -fsSL "$cmdURL" -o "$script_file" && sh "$script_file" && rm -f "$script_file"; } || { echo "Error: Falló la descarga o ejecución del script"; exit 1; }'
