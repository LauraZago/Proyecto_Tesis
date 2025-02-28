Durante el desarrollo de este proyecto, se llevaron a cabo una serie de investigaciones relacionadas con las alternativas de software ERP, así como diversas pruebas de cada una de las opciones elegidas. Los siguientes criterios fueron aplicados a todas y cada una de las pruebas:

- Facilidad de uso
- Implementación local
- Licencias y código fuente

# Primera etapa: Obtención de soluciones comerciales
Antes de implementar cualquier alternativa directamente en producción para comenzar a trabajar en el proyecto, era necesario conocer los distintos productos comerciales que se encontraban en el mercado, a fin de determinar el camino a seguir.

Esta investigación tomó en cuenta todas y cada una de las opciones de mayor renombre en la industria, así como otros productos emergentes que buscan satisfacer las necesidades de las pequeñas y medianas empresas, principalmente.

Entre las opciones que fueron revisadas, tenemos:
- Microsoft Dynamics 365
- SAP ERP
- Oracle NetSuite
- Infor ERP
- Sage X3
- Odoo
- Dolibarr
- Flectra
- OpenERP
- ERPNext
- Tryton
- Metasfresh
## Primer filtro
De todas estas opciones, automáticamente fueron descartadas las siguientes, debido al costo excesivo de las licencias, o bien, al no ser software orientado para empresas pequeñas o medianas:

- Microsoft Dynamics 365
- SAP ERP
- Oracle NetSuite
- Infor ERP
- Sage X3

Esto nos deja con las siguientes alternativas:
- Odoo
- Dolibarr
- Flectra
- OpenERP
- ERPNext
- Tryton
- Metasfresh

De esa selección, y luego de aplicar el último filtro, los finalistas fueron:
- Odoo
- Flectra
- ERPNext

# Segunda etapa: Revisión de la documentación oficial

Una vez que fueron determinadas las tres opciones principales para las pruebas, el siguiente paso consistió en en revisar la documentación que cada uno de los proveedores de software tiene publicada en sus respectivas plataformas. 

Esto, con el fin de realizar la implementación exactamente como el desarrollador la tenía pensada desde un inicio, con las recomendaciones de seguridad, dependencias, sistemas y despliegues soportados.
# Tercera etapa: Selección final del software

Luego de recabar la información pertinente para una correcta implementación de cada una de las opciones que se tenían hasta el momento, se determinó que solo sería utilizado Flectra.

ERPNext fue la alternativa elegida en primera instancia, a nivel técnico. Esto se debió a que la plataforma presentaba el mejor rendimiento entre todas las opciones, gracias al uso de Redis como base de datos. Además, ERPNext puede ser alojado localmente o en la nube, y posee todas las características requeridas para el proyecto.

Sin embargo, uno de los puntos que no terminaron de convencer sobre esta plataforma, fue la complejidad de la experiencia de usuario, específicamente en el apartado del punto de venta —o POS—, ya que resultaba en una secuencia de pasos bastante más compleja que las alternativas, ralentizando el proceso de venta.

La segunda alternativa descartada fue Odoo. A nivel usuario, este software cuenta con la mejor interfaz y experiencia de uso, pero a pesar de ser un producto de código abierto, posee un licenciamiento bastante restrictivo si se busca alojarlo de manera local, al requerir una suscripción mensual tarifada por usuario, que resulta en un gasto excesivo a largo plazo.

Si bien Odoo ofrece una versión gratuita denominada "Community", ésta no cuenta con los módulos necesarios para el proyecto, ya que se encuentran artificialmente limitados, a fin de requerir una suscripción a su solución "Enterprise", o bien, al servicio de alojamiento en la nube que ofrece la empresa.

Por último, Flectra fue la alternativa elegida para este proyecto, debido a que se trata de una bifurcación completa de toda la plataforma "Enterprise" de Odoo, y que, bajo los términos y condiciones de la licencia de código abierto de Odoo, es completamente legal su implementación.

Esto significa que Flectra es una versión virtualmente idéntica a Odoo, sin las limitaciones artificiales que se imponen para suscribirse a la versión "Enterprise" de este. Como resultado, tenemos una plataforma que posee absolutamente todos y cada uno de los módulos desbloqueados, sin necesidad de pasar por caja.

# Cuarta etapa: Prueba en entorno "testing"

Como tal, el entorno "*testing*" no es más que un área de pruebas que emulará varios aspectos del despliegue final, en donde será posible realizar varias modificaciones a la implementación base, para poder adaptarla al escenario de uso donde será desplegada al terminar el proyecto.

Para ello, se fijaron los siguientes parámetros:
- Servidor local basado en Ubuntu 24.04 LTS
- Virtualización o uso de contenedores para "encapsular" todo el software necesario
- Uso de un hipervisor type-1 de código abierto
- Preparación del sistema usando un script bash
- Despliegue de aplicaciones utilizando Docker y Docker Compose

Dicho lo anterior, el entorno de prueba —ya cercano a producción— se compondrá de los siguientes elementos:

- Proxmox VE 8.0.2 como hipervisor
- Contenedor LXC basado en Ubuntu 24.04 LTS
- Instalación oficial de Docker, a través de un script personalizado
- Cloudflare Tunnels para conectar al exterior

Este sistema es accesible desde una interfaz web o mediante SSH —una terminal segura hacia el servidor—, para una correcta administración, y en ambos casos, estará basado completamente en Linux, para un despliegue libre de costos de licenciamiento, un soporte extendido, y acorde a los estándares de la industria.

La estructura general de este sistema, consiste en un servidor en el que será instalado Proxmox VE 8.0.2 como base, y sobre este, se utilizará un contenedor LXC con una imagen de Ubuntu 24.04 LTS, de manera que quede "encapsulado" todo lo referente al sistema operativo, pero sin desperdiciar recursos excesivos, como sucede con las máquinas virtuales —o VM—.

Dentro de ese contenedor LXC, será instalado otro sistema más universal de contenedores, que es Docker. 

Este consiste en un proyecto de código abierto que automatiza el despliegue de aplicaciones dentro de espacios confinados para ellas solas, y funciona como una capa de abstracción adicional, que otorga muchas de las ventajas de la virtualización, pero sin requerir tantos recursos adicionales.

Una de las formas en las que se puede realizar esta automatización, es a través de un orquestador como Docker Compose, que es una herramienta integrada a Docker, que facilita el despliegue mediante un archivo de "instrucciones" —en formato YAML—, y que, a través de un solo comando, puede descargar todos los componentes necesarios, crear las redes internas para que cada componente se comunique entre si, y exponer públicamente las aplicaciones para su uso, en base a lo que le indiquemos.

En caso de realizar cambios al proyecto, solo basta con modificar un solo archivo llamado *docker-compose.yaml*, y volver a ejecutar el comando.

## Acceso desde el exterior

Debido a que el sistema estará alojado de forma local, y hasta este momento, todas las pruebas están siendo realizadas desde casa, era necesario ejecutar una serie de medidas para hacer que esta plataforma fuese accesible desde el exterior, debido a que, por defecto, Flectra únicamente puede usarse dentro de la misma red local. 

Esto elimina por completo la posibilidad de ingresar a la plataforma desde internet. Si bien esta es una medida de seguridad extra que está pensada para mantener el sistema de forma óptima sin ningún tipo de infiltraciones o ataques al mismo, esto retrasaba el desarrollo del proyecto.

Para ello, se recurrió a una solución comercial denominada Cloudflare Tunnels. Esta solución permite crear un túnel virtual entre el servidor de origen —que se encuentra en casa—, y uno de los servidores de la red de Cloudflare, que tienen acceso pleno a internet, para luego conectarlo con un dominio propio, y poder entrar de manera segura a la plataforma.


# Quinta etapa: Creación de código para despliegue

Una vez que la prueba dentro del entorno *testing* fue considerara exitosa en lo referente a su funcionamiento y estabilidad, se desarrollaron las plantillas de Docker Compose para facilitar la implementación en el futuro entorno de producción.

Estas plantillas, así como buena parte de la documentación que se está escribiendo sobre el proyecto, están siendo alojados en un repositorio git, en la plataforma GitHub. 

Los repositorios git facilitan la colaboración sobre código entre varias personas, así como un control de versiones bastante detallado, en el que se permite comentar los cambios, revertirlos, eliminarlos, establecer ramas independientes de desarrollo, y mucho más.

Para efectos prácticos, se eligió esta plataforma como una forma de adaptar el proyecto a los estándares de la industria, de forma que el experto pueda generar las notas —y código— que se integrarán al reporte final.