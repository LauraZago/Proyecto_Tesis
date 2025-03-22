#!/bin/bash
###### Tags a reemplazar ######
filename=".env"
postgres_db="postgresdb"
postgres_user="flectrauser"
postgres_password="flectrapassword"

set -e
echo -e "\e[1;35mFlectra - Configurator\e[0m"
echo
sleep 2

echo -e "\e[1;36m➤ Este script configurará las variables .env para iniciar el contenedor de Flectra\e[0m"
sleep 3

# Crear respaldo de archivo .env
echo -e "\e[1;36m➤ Creando respaldo del archivo .env existente\e[0m"
cp .env .env.bak && 
    echo -e "\e[0;32m✔ Archivo .env respaldado correctamente\e[0m" || 
        echo -e "\e[0;31m✖ Hubo un problema al respaldar el archivo\e[0m"
sleep 1

# Reemplazar tags en archivo .env
echo
echo -e "\e[1;36m➤ Iniciando configuración de variables de Flectra...\e[0m"
sleep 2

###### Base de datos ######
echo
echo -e "\e[1;36m➤ Ingrese el nombre que desea usar para la base de datos:\e[0m"
echo -e "\e[1;30m  Ejemplo: postgresdb\e[0m"
read -p " " replace
if [[ -n $postgres_db && -n $replace ]]; then
  sed -i "s/$postgres_db/$replace/g" $filename && echo -e "\e[0;32m✔ Nombre añadido al archivo \e[0m" || echo -e "\e[0;31m✖ Hubo un problema al reemplazar el nombre\e[0m"
fi
sleep 1

###### Usuario de base de datos######
echo
echo -e "\e[1;36m➤ Ingrese el nombre de usuario que desea usar para la base de datos:\e[0m"
echo -e "\e[1;30m  Ejemplo: flectrauser\e[0m"
read -p " " replace
if [[ -n $postgres_user && -n $replace ]]; then
  sed -i "s/$postgres_user/$replace/g" "$filename" && echo -e "\e[0;32m✔ Nombre de usuario añadido al archivo \e[0m" || echo -e "\e[0;31m✖ Hubo un problema al reemplazar el nombre de usuario\e[0m"
fi
sleep 1


###### Contraseña de base de datos######
echo
echo -e "\e[1;36m➤ Ingrese la contraseña que desea usar para la base de datos:\e[0m"
echo -e "\e[1;30m  Ejemplo: flectrapassword\e[0m"
read -p " " replace
if [[ -n $replace ]]; then
  sed -i "s/$postgres_password/$replace/g" $filename && echo -e "\e[0;32m✔ Contraseña añadida al archivo \e[0m" || echo -e "\e[0;31m✖ Hubo un problema al reemplazar la contraseña\e[0m"
fi
sleep 1

echo
echo -e "\e[1;32m✔ Configuración de variables de Flectra completada con éxito.\e[0m"
echo -e "\e[1;34m  Consulta la documentación oficial para terminar la configuración.\e[0m"
echo