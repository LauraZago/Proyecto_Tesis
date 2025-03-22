#!/bin/bash

###### Script Post-Install ######
set -e
echo -e "\e[1;35mScript Post-Install\e[0m"
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

###### Actualizar la lista de paquetes ######
echo -e "\e[0;32m➤ Actualizando repositorios...\e[1;30m"
sleep 2
sudo apt update -qqqy && 
    echo "✔ Repositorios actualizados" || 
        echo -e "\e[0;31m✖  Hubo un problema al actualizar repositorios\e[0m"
sleep 2
echo -e "\e[1;32mLos siguientes paquetes serán actualizados:\e[0m"
sleep 2
sudo apt list --upgradable
sleep 5

# Actualizar los paquetes instalados
echo -e "\e[0;32m➤ Actualizando paquetes...\e[0m"
sleep 2
sudo apt upgrade -qqqy && 
    echo -e "\e[0;32m✔ Paquetes actualizados\e[0m" || 
        echo -e "\e[0;31m✖  Hubo un problema al actualizar los paquetes\e[0m"


# Instalar paquetes necesarios
echo -e "\e[0;32m➤ Instalando paquetes pendientes...\e[0m"
sleep 2
sudo apt install -qqqy git curl wget ca-certificates && 
    echo -e "\e[0;32m✔ Dependencias instaladas correctamente\e[0m" || 
        echo -e "\e[0;31m✖  Hubo un problema al instalar dependencias\e[0m"

# Instalar Docker
echo
sleep 2
echo -e "\e[1;36m➤ Iniciando la instalación de Docker, mediante script del proyecto...\e[1;30m"
sudo curl -fsSL https://raw.githubusercontent.com/LauraZago/Proyecto_Tesis/refs/heads/dev/instalador-docker.sh | sudo bash -s
echo -e "\e[0;32m✔ Se ha instalado la última versión de Docker\e[0m" || echo -e "\e[0;31m✖ Error al instalar la última versión de Docker\e[0m"
echo
sleep 2

# Notificar finalización
echo -e "\e[1;32m✔ Actualización de paquetes y repositorios completada.\e[0m"


sleep 5
echo -e "\e[1;33m➤ La configuración continuará automáticamente en 15 segundos. Para interrupir el script, presiona CTRL+C\e[0m"
sleep 15
echo -e "\e[1;36m➤ Continuando script...\e[0m"
sleep 2
cd /opt/
sudo curl -fsSL https://raw.githubusercontent.com/LauraZago/Proyecto_Tesis/refs/heads/dev/instalador-flectra.sh | sudo bash -s
sleep 1

echo 
echo -e "\e[1;32m✔ Instalación de Flectra completada con éxito\e[0m"
sleep 2
