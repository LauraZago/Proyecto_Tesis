Dentro de este proyecto, se consideraron algunas posibles opciones para implementar un sistema contable con las siguientes especificaciones técnicas:

- Facilidad de uso
- Código abierto (o al menos, *source-available*)
- Instalación local (nube opcional)
- Estructura servidor-cliente
- Interfaz *device-agnostic* o PWA
- Consumo bajo de recursos
- Despliegue y migración simplificados (a través de Docker Compose u otros orquestadores)

## Facilidad de uso
En el primer caso, al ser un software que será utilizado por más de una persona, y donde la capacitación juega un rol importante para un uso correcto, es necesario que la opción elegida posea una interfaz lo más simplificada posible, para reducir el tiempo de adaptación de todos los integrantes del negocio, y eliminar virtualmente todos los posibles problemas relacionados con esto a futuro.

## Código abierto (o al menos, *source-available*)
Por otro lado, un software ERP libre de código abierto también funciona como una medida de reducción de costos, al tener licencias mucho más permisivas por defecto, que permiten su distribución, modificación e implementación de forma menos restrictiva que un software comercial. 

## Instalación local
Además, en el apartado de privacidad, si se hace uso de una alternativa que permita el *self-hosting* o alojamiento privado/local, todos los datos del negocio permanecerán únicamente en los equipos que los usuarios autoricen, y no en el servidor externo de alguna compañía.

## Estructura servidor-cliente
Una de las consideraciones para este proyecto, es la seguridad de los datos contables, y a la par de una instalación local como requisito, se estableció que un software con una estructura servidor-cliente sería la mejor opción para mantener segura toda la información de la tienda.

Al hacer uso de estaciones de trabajo (como puntos de venta o terminales móviles) para las actividades del negocio, se necesita forzosamente que toda la información se encuentre debidamente catalogada y sincronizada entre partes para hacerla eficaz, de manera que se tomen decisiones en base a lo que ocurre en tiempo real, sin necesidad de introducir los datos más de una vez, incluso si se hace uso de muchos dispositivos al mismo tiempo.

Para ello, un software que esté basado en una estructura servidor-cliente, es la mejor forma de centralizar adecuadamente las operaciones, permitiendo un acceso multi-dispositivo al sistema, sin que ello afecte el funcionamiento de la plataforma.

## Interfaz *device-agnostic* o PWA
Sumado a lo anterior, es necesario que el sofware implementado posea una interfaz que se ajuste correctamente a cualquier dispositivo en el que se haga uso del mismo. 

Esto implica que la interfaz debe ser lo suficientemente versátil para adaptarse a un dispositivo móvil o una computadora de escritorio, sin que se vea comprometida la experiencia de usuario en el proceso, ni que altere significativamente el flujo de trabajo.


Si bien es preferible tener aplicaciones nativas para cada terminal de usuario, por lo regular solo las alternativas comerciales de código cerrado las proporcionan, debido al alto costo de desarrollo. Respecto a otras alternativas libres, notamos que en muchos de los casos, las interfaces están pensadas para ser usadas en grandes pantallas, lo que elimina la opción de consultarlas desde un smartphone o tablet, por ejemplo. 

En este aspecto, las aplicaciones web progresivas —o PWA—, son las mejores alternativas multi-pantalla, ya que solo requieren hacer uso de un navegador compatible con tecnologías web comunes, como HTML5, CSS3 y JavaScript, así como una base de código sólida que pueda gestionar correctamente la interfaz según el tamaño de pantalla.

## Consumo bajo de recursos
Uno de los pilares del proyecto —en materia de sustentabilidad—, es el uso eficiente de recursos, entre los que se incluyen la energía eléctrica requerida tanto para la etapa de desarrollo, como en la implementación del proyecto en producción. 

Con eso en mente, se busca que todos los equipos cliente y servidores posean el menor consumo energético posible, a fin de evitar que ésta se desperdicie durante los momentos de baja demanda, sin que resulte excesiva en los momentos de mayor uso.

A nivel técnico, es preferible una infraestructura formada por equipos que hagan uso del conjunto de instrucciones ARM para servidor y clientes. 

No obstante, resulta completamente permisible un servidor x86 común, con un procesador que cuente con una arquitectura moderna y/o de última generación, de forma que el rendimiento por watt sea el mejor para este escenario.

## Despliegue y migración simplificados

Este es uno de los requisitos más importantes a nivel técnico para el proyecto, puesto que un despliegue perfectamente documentado y simplificado —en términos de operaciones—, dará paso a una implementación robusta, resiliente y replicable.

La migración, por otro lado, permitirá que la solución ERP pueda ser trasladada a un servidor nuevo, sin sufrir absolutamente ningún cambio mayor en lo que respecta a su funcionamiento o pérdida de información durante el proceso. 

Asimismo, una política completa de copias de seguridad podría hacer aún más robusto el despliegue, al proteger todos los datos del negocio en caso de desastres, con las mejores prácticas económicamente viables.