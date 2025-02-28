Dentro de este proyecto, se consideraron algunas posibles opciones para implementar un sistema contable con las siguientes especificaciones técnicas:

- Facilidad de uso
- Código abierto (o al menos, *source-available*)
- Instalación local (nube opcional)
- Estructura servidor-cliente
- Interfaz *device-agnostic* o PWA
- Consumo bajo de recursos
- Despliegue y migración simplificados (a través de Docker Compose u otros orquestadores)

#### Facilidad de uso
En el primer caso, al ser un software que será utilizado por más de una persona, y donde la capacitación juega un rol importante para un uso correcto, es necesario que la opción elegida posea una interfaz lo más simplificada posible, para reducir el tiempo de adaptación de todos los integrantes del negocio, y eliminar virtualmente todos los posibles problemas relacionados con esto a futuro.

#### Código abierto
Por otro lado, un software ERP libre de código abierto también funciona como una medida de reducción de costos, al tener licencias mucho más permisivas por defecto, que permiten su distribución, modificación e implementación de forma menos restrictiva que un software comercial. 

#### Instalación local
Además, en el apartado de privacidad, si se hace uso de una alternativa que permita el *self-hosting* o alojamiento privado/local, todos los datos del negocio permanecerán únicamente en los equipos que los usuarios autoricen, y no en el servidor externo de alguna compañía.

#### Estructura servidor-cliente
Una de las consideraciones para este proyecto, es la seguridad de los datos contables, y a la par de una instalación local como requisito, se estableció que un software con una estructura servidor-cliente sería la mejor opción para mantener segura toda la información de la tienda.

Al hacer uso de estaciones de trabajo (como puntos de venta o terminales móviles) para las actividades del negocio, se necesita forzosamente que toda la información se encuentre debidamente catalogada y sincronizada entre partes para hacerla eficaz, de manera que se tomen decisiones en base a lo que ocurre en tiempo real, sin necesidad de introducir los datos más de una vez, incluso si se hace uso de muchos dispositivos al mismo tiempo.

Para ello, un software que esté basado en una estructura servidor-cliente, es la mejor forma de centralizar adecuadamente las operaciones, permitiendo un acceso multi-dispositivo al sistema, sin que ello afecte el funcionamiento de la plataforma.

#### Interfaz *device-agnostic* o PWA
Sumado a lo anterior, es necesario que el sofware implementado posea una interfaz que se ajuste correctamente a cualquier dispositivo en el que se haga uso del mismo. 

Esto implica que la interfaz debe ser lo suficientemente versátil para adaptarse a un dispositivo móvil o una computadora de escritorio, sin que se vea comprometida la experiencia de usuario en el proceso, ni que altere significativamente el flujo de trabajo.


Si bien es preferible tener aplicaciones nativas para cada terminal de usuario, por lo regular solo las alternativas comerciales de código cerrado las proporcionan, debido al alto costo de desarrollo. Respecto a otras alternativas libres, notamos que en muchos de los casos, las interfaces están pensadas para ser usadas en grandes pantallas, lo que elimina la opción de consultarlas desde un smartphone o tablet, por ejemplo. 

En este aspecto, las aplicaciones web progresivas —o PWA—, son las mejores alternativas multi-pantalla, ya que solo requieren hacer uso de un navegador compatible con tecnologías web comunes, como HTML5, CSS3 y JavaScript, así como una base de código sólida que pueda gestionar correctamente la interfaz según el tamaño de pantalla.

#### Consumo bajo de recursos
Uno de los pilares del proyecto —en materia de sustentabilidad—, es el uso eficiente de recursos, entre los que se incluyen la energía eléctrica requerida tanto para la etapa de desarrollo, como en la implementación del proyecto en producción. 

Con eso en mente, se busca que todos los equipos cliente y servidores posean el menor consumo energético posible, a fin de evitar que ésta se desperdicie durante los momentos de baja demanda, sin que resulte excesiva en los momentos de mayor uso.

A nivel técnico, es preferible una infraestructura formada por equipos que hagan uso del conjunto de instrucciones ARM para servidor y clientes. 

No obstante, resulta completamente permisible un servidor x86 común, con un procesador que cuente con una arquitectura moderna y/o de última generación, de forma que el rendimiento por watt sea el mejor para este escenario.

#### Despliegue y migración simplificados

Este es uno de los requisitos más importantes a nivel técnico para el proyecto, puesto que un despliegue perfectamente documentado y simplificado —en términos de operaciones—, dará paso a una implementación robusta, resiliente y replicable.

La migración, por otro lado, permitirá que la solución ERP pueda ser trasladada a un servidor nuevo, sin sufrir absolutamente ningún cambio mayor en lo que respecta a su funcionamiento o pérdida de información durante el proceso. 

Asimismo, una política completa de copias de seguridad podría hacer aún más robusto el despliegue, al proteger todos los datos del negocio en caso de desastres, con las mejores prácticas económicamente viables.


# Odoo
Odoo es una de las alternativas más asequibles que se pueden encontrar dentro de las soluciones propuestas, y como tal, es posible utilizar una versión "Community" completamente open-source, que puede ser implementada en un servidor local privado. 

No obstante, en la práctica se traduce a una versión bastante recortada que no incluye acceso a los módulos necesarios para llevar a cabo el proyecto (inventarios y POS), obligando al usuario a suscribirse al tier "Enterprise", que posee un costo excesivo de licenciamiento por cuenta.
#### Despliegue e implementación
Odoo puede ser implementado mediante una suscripción al sitio web, en donde será proporcionado el alojamiento necesario en odoo.sh, sin necesidad de instalar absolutamente nada, al ser accesible desde cualquier navegador.

En caso de querer utilizarlo de forma privada, Odoo también ofrece una documentación bastante extensa y detallada de cómo hacerlo, así como soporte pagado para llevarlo a cabo. 

Sin embargo, solo la versión "Community" es de código abierto, ya que los demás módulos —que no están incluidos—, se ofrecen como source-available después de pagar por la versión "Enterprise".

# OpenERP
OpenERP era un proyecto ERP libre y de código abierto, que eventualmente se convertiría en Odoo, luego de un cambio de licencias y modelo de negocios.
#### Despliegue e implementación
Esta alternativa resultaba bastante fácil de implementar, era gratuita en todo sentido, y solo bastaba un servidor local para alojarla, pero fue descartada rápidamente al no tener actualizaciones desde hace varios años, lo que hace que el proyecto en si, quedara abandonado por parte de sus desarrolladores, sin que ninguna bifurcación (fork) tuviera un éxito considerable para mantenerla en la lista.

# ERPNext
Aunque ERPNext está cargado de funcionalidades y cuenta con una licencia totalmente open-source en la que no se necesita ningún tipo de suscripción o pago (si se aloja en un servidor local), es una solución que carece de una interfaz de usuario suficientemente amigable para los usuarios finales, de forma que podría retrasar la implementación en tienda, al no ser tan fácil de usar.

Frappe, que es la empresa detrás del desarrollo, ofrece una solución similar a la de Odoo, pero el costo es muy alto para el tamaño del negocio donde será incorporado.
#### Despliegue e implementación
En el apartado técnico, resulta un poco complicado de poner en funcionamiento localmente, ya que la documentación es un poco confusa en algunas secciones, y su despliegue utilizando Docker Compose no es lo suficientemente simple para considerarlo en un entorno tan pequeño.

En cuanto a rendimiento, se trata de la alternativa más potente entre las mencionadas, en parte debido al uso de Redis como base de datos.

Como punto positivo, es posible utilizar una arquitectura ARM al cambiar algunos parámetros en el archivo *docker-compose.yaml*, 

# Dolibarr
Dolibarr es otra de las alternativas de código abierto que fueron manejadas durante el proceso de selección, pero fue descartada debido a su interfaz de usuario tan rudimentaria y complicada de usar, particularmente en el sistema POS.

No obstante, Dolibarr es un proyecto completamente open-source orientado para negocios pequeños, autónomos y fundaciones, contando con una documentación bastante completa, y la posibilidad de desplegarlo de cualquier forma que deseemos.


# Flectra
Flectra fue la opción más adecuada para este proyecto, debido a que se trata de una bifurcación (fork) de Odoo Enterprise, pero eliminando las limitaciones artificiales que obligan a suscribirse al producto del que se deriva, de manera que están disponibles todas las funciones sin licencias adicionales.

Una de las ventajas de ser un fork de Odoo, es que la interfaz de usuario es bastante amigable, los módulos son fáciles de usar, y para una implementación local, funciona extremadamente bien.
#### Despliegue e implementación
Esta alternativa también ofrece alojamiento por un pago único o suscripción mensual, así como la opción de alojarlo gratuitamente en un servidor privado o local. Flectra también proporciona paquetes para Debian, Red Hat y Windows, además del código fuente e imágenes de Docker.

Como punto negativo, la documentación no es la mejor, y al no contar con un equipo de desarrollo tan grande como el de Odoo, es de esperar que existan algunos bugs relacionados principalmente con la interfaz, aunque no afectan al funcionamiento del software ni sus módulos propiamente.

Sin embargo, el despliegue es sumamente sencillo, al solo requerir una base de datos (PostgreSQL) correctamente configurada, y el programa/imagen base con los parámetros necesarios para acceder a la base de datos.


# SAP ERP
Esta alternativa fue descartada casi inmediatamente, debido al alto costo de las licencias, y al tratarse de una alternativa pensada para grandes empresas, siendo incompatible con el escenario mostrado en el proyecto.