#!/bin/bash

###### Script de Instalación de Flectra ######
set -e
echo -e "\e[1;35mInstalador de Flectra\e[0m"
sleep 2

###### Comprobar permisos de sudo o root ######
echo -e "\e[0;32m➤ Comprobando permisos...\e[0m"
if [[ $EUID -ne 0 ]]; then
   echo -e "\e[1;31m✖  Para usar este script, es necesario elevar permisos. Use 'sudo bash "$0"' en su lugar\e[0m" 1>&2
   exit 1
fi
echo -e "\e[1;32m✔ El script se está ejecutando con permisos de administrador\e[0m"
sleep 2

###### Continuar con la ejecución ######
echo -e "\e[0;32m➤ Continuando con la ejecución...\e[0m"
sleep 2

echo
echo -e "\e[1;36m➤ Creando carpetas para instalación de Flectra...\e[0m"
cd /opt/
sudo mkdir -p flectra && cd flectra

echo
echo -e "\e[1;36m➤ Descargando plantilla de docker-compose desde el repositorio...\e[0m"
wget -q https://raw.githubusercontent.com/LauraZago/Proyecto_Tesis/refs/heads/dev/docker-compose.yaml -O docker-compose.yaml
    echo -e "\e[0;32m✔ docker-compose.yaml descargado correctamente\e[0m" || 
        echo -e "\e[0;31m✖ Hubo un problema al descargar la plantilla de docker-compose.yaml\e[0m"
sleep 1

echo
echo -e "\e[1;36m➤ Descargando plantilla de variables .env desde el repositorio...\e[0m"
wget -q https://raw.githubusercontent.com/LauraZago/Proyecto_Tesis/refs/heads/dev/.env.example -O .env &&
    echo -e "\e[0;32m✔ .env descargado correctamente\e[0m" || 
        echo -e "\e[0;31m✖ Hubo un problema al descargar el archivo .env\e[0m"
sleep 1

echo
echo -e "\e[1;36m➤ Descargando imagen de Flectra...\e[0m"
docker compose pull &&
    echo -e "\e[0;32m✔ Imagen de Flectra descargada correctamente\e[0m" || 
        echo -e "\e[0;31m✖ Hubo un problema al descargar la imagen de Flectra\e[0m"
sleep 1

echo
echo -e "\e[1;36m➤ Iniciando la configuración de variables de Flectra...\e[0m"

echo
echo -e "\e[1;36m➤ Descargando script de configuración desde el repositorio...\e[0m"
wget -q https://raw.githubusercontent.com/LauraZago/Proyecto_Tesis/refs/heads/dev/flectra-configurator.sh -O flectra-configurator.sh
    echo -e "\e[0;32m✔ script descargado correctamente\e[0m" || 
        echo -e "\e[0;31m✖ Hubo un problema al descargar el script\e[0m"
sleep 1

echo
echo -e "\e[1;36m➤ Ejecutando script de configuración...\e[0m"
sudo bash flectra-configurator.sh

echo
echo -e "\e[1;36m➤ Iniciando contenedores de Flectra...\e[0m"
sleep 1
docker compose up -d 
    echo -e "\e[0;32m✔ Contenedores de Flectra iniciados correctamente\e[0m" || 
        echo -e "\e[0;31m✖ Hubo un problema al iniciar los contenedores de Flectra\e[0m"
sleep 1

echo
echo -e "\e[1;34m➤ Configura la instancia de Flectra de este servidor, a través de http://$(hostname  -I | cut -f1 -d' '):8080\e[0m"
echo -e "\e[1;34m  Una vez iniciados los contenedores, recomendamos configurar la instancia de Flectra\e[0m"
echo -e "\e[1;34m  con los datos de acceso y la configuración de la base de datos\e[0m"
echo -e "\e[1;34m  para su correcto funcionamiento.\e[0m"