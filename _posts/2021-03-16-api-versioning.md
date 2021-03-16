---
layout: post
title: Números de versión de API’s
subtitle: Cada día son más comunes en nuestras vidas, pero se suele olvidar el significado de los números de versión en los API’s
cover-img: /assets/img/landcapes/woods1.jpeg
thumbnail-img: /assets/img/icons/versions.png
#share-img: /assets/img/path.jpg
tags: [DevOps, API, Versions]
comments: true
---
<p style='text-align: justify;'>
Actualmente el mundo de la tecnología está lleno de API’s, y cada día más y más sistemas legacy se van migrando e implementando API’s en su arquitectura.
En esta ocasión les vengo a comentar sobre los números de versión de API, su significado, y porqué son tan importantes.
</p>

# ¿Qué es una API?
<p style='text-align: justify;'>
Primero lo primero, seguramente sabrás lo que es un API, pero de igual forma hay muchos que no están tan familiarizados con el término.
API viene del inglés “Application Programming Interfaces”, y lo que viene siendo es un protocolo y definiciones para que dos aplicaciones se comuniquen de una forma estándar.  
Con las arquitecturas más modernas de software, donde se busca la baja cohesión y alto acoplamiento, se vuelven los API’s una herramienta muy práctica.
</p>
![alt text](../assets/img/memes/numbersbaby.jpg "Baby Numbers")

# ¿Dónde se usan API’s?
<p style='text-align: justify;'>
Pues actualmente, en todas partes los encontramos, y te cito algunos ejemplos comunes.
</p>
1. Aplicaciones móviles: muchas de las aplicaciones móviles requieren de contenido que no está en el dispositivo, como mensajes, imágenes, post, contenido multimedia. y es acá donde la aplicación requiere establecer comunicación con otra aplicación (backend, que si los tiene).
2. Sitios Web: al igual que con las aplicaciones móviles, los sitios buscan enfocarse por razones de seguridad, especialización en tecnologías de frontend y muchas otras causas solo en la presentación, y los datos, procesos y demás se lo dejan a otras aplicaciones que son consumidas por API’s.
3. Nube: Así es la administración de las nubes, PaaS, IaC y demás es administrada de forma estándar por API’s
<p style='text-align: justify;'>Como pueden ver los API’s son cada vez más comunes en nuestra vida, y su importancia no solo radica en proveer de aislamiento de responsabilidades, seguridad y optimización, sino que también recae sobre ellas la posibilidad de servir a los consumidores de los API’s la retro compatibilidad para poder aceptar los cambios en el momento oportuno, y este es el tema central de este post, el manejo de los números de versión de los API’s
</p>

# ¿Cómo son los números de versión de los API’s?
<p style='text-align: justify;'>
Al igual que todo lo que es creado a partir de código fuente, refleja cambios, y debe dar una noción de la deferencia de las capacidades de un componente a otro, se ocupan los números de versión, por eso, los API’s no son la excepción.
</p>

<p style='text-align: justify;'>
Los números de versión de los API’s usualmente constan de uno o dos grupos de números enteros positivos, como por ejemplo 2 o el 1.0. Y es muy importante aclarar que los API’s publicados pueden tener varias versiones publicadas de forma simultanea, a diferencia de las otras aplicaciones comunes que instalamos en nuestros equipos, un ejemplo de esto sería una aplicación móvil de mensajería, no es factible (y no tiene mucho sentido hacerlo) instalar más de una versión de la misma aplicación en el celular. Pero, entonces, porqué tiene sentido que si ocurra esto en los API’s.
</p>

<p style='text-align: justify;'>
Bien, lo que ocurre diferente con los API’s es que cada uno de nosotros de forma personal tiene una aplicación determinada en una versión X del tiempo. En ese momento el fabricante libera una actualización (bastante novedosa), pero este fabricante no tiene forma de corrdinar que todos los usuarios actualicemos la aplicación de forma sincronizada, todos estamos en regiones diferentes del planeta, con zonas horarias diferentes, velocidades de internet distintas (algunos con conexiones fijas, otros con móviles con planes o incluso, móviles pre pago y restricciones por descargas), sin mencionar los intereses de cada uno en conseguir la flamante actualización, y tampoco podemos olvidar las limitaciones de cada sistema operativo. De esta forma el fabricante junto con la aplicación nueva, libera una nueva versión del API, de esta forma los usuarios que actualicen su aplicación consumirán el API en la versión más reciente, y los que aun no lo hacen, o del todo no quieren hacerlo, continúan consumiendo la versión más antigua del API.
</p>

<p style='text-align: justify;'>
Con esto, se garantiza que los clientes tengan continuidad del servicio sin importar si ya han aplicado la actualización o no. E incluso, si les es factible o no aplicarla, ya que hay escenarios donde aplicaciones dejan de mejorar un determina sector de mercado y solo le dan parches de seguridad.
</p>

<p style='text-align: justify;'>
Entonces. ¿cada vez que actualizamos la aplicación móvil, actualizamos el número de versión del API? La respuesta es “no siempre”. El número de versión del API no representa actualizaciones en funcionalidades o corrección, pero entonces, ¿Qué representa?
</p>

# ¿Qué representa el número de versión en un API?
<p style='text-align: justify;'>
El número de versión de un API no representa un cambio en la funcionalidad, mejoras en rendimiento o la cantidad de errores que se han corregido. Este número representa un contrato con el consumidor, para marcar la posibilidad de este de continuar consumiendo el API sin ocasionar problemas en la aplicación que consume, ni tampoco requerir cambios en la codificación o procesos de esta.
</p>

<p style='text-align: justify;'>
En otras palabras, el número de versión del API cambia, cuando se sabe que los consumidores actuales tendrán que realizar cambios en sus aplicaciones para poder consumir las mejoras que se están liberando del API. En este escenario se mantienen ambas versiones del API publicadas, la actual y la nueva (la que se está liberando con las nuevas funcionalidades)
</p>

<p style='text-align: justify;'>
A continuación, te doy una lista de cambios en el API, que de seguro requerirán un cambio en el número de versión, junto con una muy breve descripción de la razón del cambio.
</p>
 1. Se cambian los parámetros de entrada un parámetro adicional en un request al API: En este caso, si parámetro adicional no es opcional, el consumidor está en obligación de enviarlo, pero su aplicación no está preparada para enviarlo, por lo que, de no hacer el cambio de versión de API, dicha aplicación va a fallar. Si el parámetro es opcional y no hay afectación en el consumidor por no enviarlo, no existe cambio en el número de versión.
2. Cambios en los parámetros de entrada, cambios en el tipo de dato en el request del API: Si tenemos un request que pide un valor entero, y ahora lo pedimos en cualquier otro tipo de dato como cadena, booleano, etc, provocaría una falla en los consumidores. Por lo que en este caso también aplica un cambio en el número de versión del API.
3. Se elimina una funcionalidad (deprecated): en este escenario, se sugiere también el cambio de número de versión, ya que si existen clientes que usan la funcionalidad y la eliminamos van a tener afectación, y si la mantenemos, los consumidores no obtarán por dejar de usar dicha funcionalidad, por lo que en este caso, se mantiene en la versión actual, y en la nueva versión del API, se procede a eliminarla para que cuando los consumidores migren a la versión más reciente, se preparen para la funcionalidad eliminada.
4. Cualquier cambio en las firmas de la respuesta del API (cambio de firmas): Si bien la mayoría de los procesos de consulta de API’s utilizan deserialización, no podemos dar por un hecho que lo hacen y que los procesos que han programado los desarrolladores del consumidor son compatibles con una firma distinta en las respuestas del API. Por esta razón estos cambios también implican un cambio en la versión del API. 

# ¿Dónde se encuentran los números de versión del API?
<p style='text-align: justify;'>
Usualmente los podemos definir en dos posibles lugares (para consumir el API), ambas formas tienen sus fans a favor y haters en contra. Sin embargo, esto no coloca a una sobre la otra, simplemente son dos caminos distintos que considerar
</p>

<p style='text-align: justify;'>
El primero de estos caminos, es cuando el número de versión está en la URL para consumir el API, de esta forma tendríamos URL como las siguientes
</p>
• https://company.api/v1/security
• https://company.api/v2/security

<p style='text-align: justify;'>
Los defensores de este enfoque indican que las URL deben ser únicas para un recurso, por lo que al modificar la URL (con el número de versión) es transparente para los consumidores que están consumiendo una versión del API y que esta se mantiene única para cada recurso.
El segundo enfoque es cuando la URL del API es la misma para todas las versiones, y el consumidor debe enviar en el encabezado de la solicitud el número de versión del API que va a consumir.
</p>

<p style='text-align: justify;'>
Los detractores de esta forma alegan que el mismo recurso en la red, consumido por una URL apunta a varias versiones.
Sin embargo, sus defensores indican que este modelo es más simple, ya que solo se consume una URL y que el cambio en el número de versión está claramente identificado con el parámetro en el encabezado.
Yo en lo personal, no veo este tema tan polarizado, y no inclino la balanza por ninguna de las opciones, y me parece que los argumentos no son de tanto peso como para que vea mayores ventajas en una de las opciones sobre la otra. Y ambas aportan variedad sin pecar en la confusión.
</p>

# Conclusión
<p style='text-align: justify;'>
Los números de versión sirven para marcar cambios, sin embargo, en esta ocasión los números de versión de los API’s no marcan cambios en la funcionalidad del software, o cuantas mejoras se han integrado. Sino que indica la compatibilidad de un consumidor, garantizando que, por actualizar el componente, los consumidores del API tengan inconvenientes, fallas o se vena en apuros para hacer sus aplicaciones compatibles con los nuevos cambios integrados al API.
</p>

<p style='text-align: justify;'>
Existen diferentes formas de colocar el número de versión que se va a consumir, y no hay argumentos de suficiente peso (en lo personal) para pensar que una forma sea mejor que la otra.
Finalmente el equipo que da seguimiento y desarrollo al API, debe estar muy claro que la no afectación de los consumidores es también una prioridad de ellos, y que deben estar bien claros cuando existe dicha afectación para liberar una versión nueva del API.
</p>