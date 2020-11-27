---
layout: post
title: Migraciones de esquemas de base de datos
subtitle: Los despliegues imposibles "SELECT Tasks FROM Deployments WHERE Deployment_type = ‘Impossible_Deployments’;"
cover-img: /assets/img/schemamigrations/animal-migrations.jpg
thumbnail-img: /assets/img/schemamigrations/changes-ahead.jpg
#share-img: /assets/img/path.jpg
tags: [DevOps, Database, Migrations, Scripts, Changes]
comments: true
---
<p style='text-align: justify;'>
¿Alguna vez se han encontrado con alguna tarea que todos llaman “imposible”? esto me ocurrió cuando empecé a trabajar con integraciones y en especial con despliegue continuo de bases de datos, me encontré en casi todas las áreas que consultaba (desarrollo, operaciones, soporte, etc.) la negativa respuesta a los despliegues de bases de datos.
</p>

<div style="width: 100%; text-align: center;">
    <p><img src="../assets/img/schemamigrations/raptor-impossible.jpg " alt="Raptor"></p>
</div>


<p style='text-align: justify;'>
Hoy, luego de haber implementado procesos para MS SQL Server y Oracle, no solo sé que son posibles, sino, que también son más rápidos, seguros, confiables y elegantes. 
Pero ¿por qué era imposible?, ¿por qué nadie creía en un mundo donde los esquemas de bases de datos se podían actualizar sin dolor?
</p>

<p style='text-align: justify;'>
Lo primero que debemos comprender es que si bien las bases de datos se crean con código (scripts), y algunas tienen lógica como procedimientos, funciones o triggers dentro, se diferencian de aplicaciones en que son cambiantes. Es decir, cada segundo un usuario hace una transacción, ingresa, actualiza o elimina datos. Por lo que por sí misma la base de datos es diferente a la base de datos que existía en el servidor hace un segundo. Esto imposibilita que tratemos a la base de datos como algo que podemos reversar a su estado anterior con respaldos o snapshots.
</p>

<p style='text-align: justify;'>
A lo anterior se le suma que, como la información es el activo más importante de las empresas, y la información en su gran mayoría vive o se procesa en las bases de datos, se empieza a crear un velo de algo divino o sagrado sobre las bases de datos, es decir, solo puedes dejar que el DBA las toque, y no eres digno de manipularlas (aun cuando como desarrollador eres enteramente responsable del código que estás enviando en una actualización). Esto es un factor que frena mucho la posibilidad de tratar de implementar procesos de integración y despliegue continuo, así como procesos de mantenimiento de forma automática. Al lidiar con factores como estos y otros más, en ocasiones es complicado convencer a los demás miembros de los equipos de implementar mejoras en automatización.
</p>

<p style='text-align: justify;'>
¡Ok!, entonces, son posibles y son nuestra mejor opción. Y ¿qué más debo saber para empezar a implementarlos? Pues son varios los temas que debes tener presentes para poder iniciar.
A continuación, te dejo algunos temas que debes tener en cuenta para implementar CI CD en las migraciones de base de datos.
</p>

# Migraciones
<p style='text-align: justify;'>
El proceso de actualizar nuestros esquemas de bases de datos se llama migración, y se llama de esta forma porque la base de datos no es estática, es dinámica, cambia con cada segundo que es utilizada. Por lo que vas a llevar la base de datos de un estado a otro (migración), por lo que no es como un remplazo de una versión por otra, tal y como ocurre con las aplicaciones.
</p>

# Tecnologías disponibles
<p style='text-align: justify;'>
Debes investigar si el fabricante de tu base de datos, algún otro proveedor o incluso si existe software libre que te permita llevar el control de versiones y migraciones de tus esquemas de bases de datos. Para citar un ejemplo SQL Server tiene los proyectos de base de datos en Visual Studio y Dacpacks para hacer los despliegues. Yo te recomendaría dar más importancia a las soluciones que son brindadas por el mismo fabricante del motor de base de datos.
</p>

<p style='text-align: justify;'>
Determina en cual sistema de control de versiones vas a llevar el control del historial de tus scripts o código fuente.
</p>

## Modelos que puedes implementar
<p style='text-align: justify;'>
Existen dos modelos, de los cuales podrás elegir uno para hacer la implementación, y te explico cómo funciona cada uno.
</p>

### Basado en estado
<p style='text-align: justify;'>
En este modelo, lo que se versiona y se empaqueta para el despliegue es el estado en que deseamos que nuestra base de datos esté luego de la actualización. ¿Qué quiere decir esto?, bien, significa que si quieres que luego de la actualización tu base de datos tenga una tabla clientes con 3 campos (Id, nombre y correo electrónico). Lo que haces es versionar el script que crea esa tabla con los 3 campos. Y en el momento de desplegarse, el software que utilizas para este modelo determina los scripts deltas que harán que la base de datos tenga la tabla como la indicaste en el script. Veamos 2 ejemplos de esto:
</p>

#### Escenario 1:
<p style='text-align: justify;'>
La tabla «clientes» no existe en la base de datos, por lo que la herramienta al generar los scripts deltas, determinará que la tabla no existe y la crea.
</p>

#### Escenario 2:
<p style='text-align: justify;'>
La tabla existe, pero solo tiene dos columnas (Id y nombre), la herramienta determina que el objeto tabla «clientes» existe, pero que tiene una columna menos (correo), por lo que el script delta generado solo contendrá la instrucción para generar la columna faltante. De esta forma, al finalizar la ejecución de este script delta, la tabla quedará de igual forma que como la describimos en código. De aquí que su nombre sea «Basado en estado», ya que determina el estado de la base de datos de destino para generar los deltas adecuados para dejar los objetos de la forma que lo declaraste.
</p>

## Scripts de migración
<p style='text-align: justify;'>
En este modelo, la migración se lleva a cabo como un historial de pequeños cambios que migran la base de datos al estado deseado. En otras palabras, siguiendo con el ejemplo de la tabla de clientes que citamos en la sección anterior, inicias versionando el script que crea la tabla clientes con las 2 columnas iniciales. Y cuando necesitas agregar la tercera columna creas el script que te altera la tabla con la creación de la columna para el correo electrónico.
</p>

<p style='text-align: justify;'>
En este punto te debes preguntar ¿en qué se diferencia este modelo con el que has hecho por tantos años? Pues, bien, la diferencia es que identificas a los archivos de scripts con un nombre que les permita establecer el orden cronológico de ejecución de los scripts. Usualmente se usa un formato de nombre similar a este «0001-Nombre-Descriptivo.sql».
</p>

<p style='text-align: justify;'>
Al usar un formato como el anterior, la herramienta que ejecute los scripts tendrá garantizado dos cosas, la primera, los nombres además de descriptivos son únicos, evitando que tengas problemas con nombrar los archivos, y la segunda es que te permite identificar el orden en que se deben aplicar los scripts. Ya que la herramienta debe crear la tabla «clientes» antes de agregar la tercera columna.
</p>

<p style='text-align: justify;'>
Esto es de suma importancia ya que al final tus scripts serán la historia (cómo evoluciona tu base de datos en el tiempo) y el orden adecuado de ejecución para llegar al estado deseado de la base de datos.
</p>

<p style='text-align: justify;'>
Normalmente estas herramientas crean una tabla adicional dentro del esquema para guardar el historial de estos scripts y prevenir ejecutar scripts que ya se han ejecutado en otras actualizaciones. Estas herramientas para despliegues en este modelo suelen tener algunas diferencias, documéntese bien y analice los pros y contras de cada una antes de tomar un camino.
</p>

# Herramientas
<p style='text-align: justify;'>
Esta es una lista de algunas herramientas o procesos que pueden servirle, sin embargo, tome en cuenta que existen muchos otros en el mercado.
</p>

| Nombre     | Motores                                                                  |
|------------|:------------------------------------------------------------------------:|
| DACPAC     | SQL Server                                                               |
| DbUp       | SQL Server Oracle MySQL Firebase PostgreSQL SQLite SQL Azure             |
| Liquidbase | MySQL MariaDB PostgreSQL Oracle SQL Server Azure SQL DB2 Firebase SQLite |
| Redgate    | SQL Server Oracle                                                        |

# Idempotencia
<p style='text-align: justify;'>
Primero, aclaramos el concepto de idempotencia, la cual, según la Real Academia Española, la idempotencia, es la capacidad de ser idempotente, y esta a su vez significa «Dicho de un elemento de un conjunto: Que tiene la propiedad de que al multiplicarse por sí mismo vuelve a obtenerse el mismo elemento; p. ej., 1·1 = 1». Pero esto en algo que podamos entender y que se ajuste a nuestras migraciones quiere decir que, Debes tener la capacidad de ejecutar una migración de esquema cuantas veces quieras o necesites sobre tu base de datos y siempre obtener el mismo resultado.
</p>

<p style='text-align: justify;'>
En otras palabras, junto con tu proceso de integración, despliegue (automático de preferencia) y la forma en que codificas tus scripts, debes garantizar que un proceso se pueda aplicar múltiples veces sin generar por esto, errores.
</p>

<p style='text-align: justify;'>
¿por qué necesitaría ejecutar varias veces una migración?, la respuesta fácil, es que tú debes garantizar que tu proceso es lo suficientemente robusto para no ocasionar problemas si determinado script de migración ya había sido ejecutado previamente. Sin embargo, hay otras razones como seguridad, ya que se pueden corregir o sobre escribir cambios no autorizados, en casos donde la base de datos guarda configuraciones de los aplicativos, se pueden hacer ajustes en configuraciones sin necesidad de liberar una versión completa del producto por un cambio de configuración 
</p>

# Antes, durante y después
<p style='text-align: justify;'>
Usualmente se suele hacer esta separación, en la migración de esquemas de base de datos, y da algunos beneficios, o por lo menos el proceso queda preparado por si en escenarios futuros llegas a necesitar de estas separaciones.
</p>

<p style='text-align: justify;'>
Estas tres secciones buscan separar en 3 los scripts de migraciones (en especial si usas el modelo «scripts de migración» en lugar del modelo «Basado en estado», sin embargo, no quiere decir, que no lo puedas usar en ambos modelos).
</p>

<p style='text-align: justify;'>
En la primera sección me gusta llamarla Predeployment y en esta se incluyen los scripts que se deben ejecutar antes de la migración. Como, por ejemplo, movimientos a tablas históricas, respaldos, exports, etc. Cualquier tarea que consideres que debe hacer la base de datos o el esquema antes de iniciar el proceso de actualización.
</p>

<p style='text-align: justify;'>
La segunda parte, deployment, consiste crear objetos nuevos, migrar los objetos a su nuevo estado o eliminar los que ya no son requeridos, por ejemplo, agregar esa nueva columna a una determinada tabla, crear una vista, eliminar un procedimiento almacenado que ya no se va a usar, etc.
</p>

<p style='text-align: justify;'>
Finalmente, la parte de postdeployment, ejecuta tareas que puedan necesitarse luego de la migración, como, por ejemplo, pruebas de que todos los objetos quedan compilados (Oracle), o incluso la ejecución de objetos cuya naturaleza los hace idempotentes y que podemos ejecutar con todos los despliegues sin mayor problema, como creación o remplazo de funciones, procedimientos o paquetes.
</p>

# ¿Que debo incluir en el control de versiones?
<p style='text-align: justify;'>
De suma importancia, ya que ni el mejor proceso te funciona si faltan scripts. Toma en cuenta que debes incluir TODO script, sin importar lo pequeño que sea el script, desde un grant hasta el más complejo de los procedimientos almacenados, sin excepción. Te doy estas categorías que te pueden ayudar a comprender mejor los scripts que debes tener en control de versiones.
</p>

## Estructura
<p style='text-align: justify;'>
Esta categoría, tal como lo muestra su nombre, consiste en la estructura del esquema, y su funcionalidad, como tablas, vistas, triggers, secuencias, etc. Dan la forma y sustento a los datos que almacenamos y consultamos
</p>

## Lógica y programación
<p style='text-align: justify;'>
Son esos objetos que incluyen lógica y programación a nuestros esquemas, como procedimientos almacenados, paquetes o funciones.
</p>

## Información de la aplicación
<p style='text-align: justify;'>
Si, la información también, siempre y cuando sea de la aplicación, como, por ejemplo, si nuestra base de datos requiere guardar el catálogo de países, sucursales, entre otros, estas deben estar versionados y ser aplicados por este proceso. Esto te permite, llevar control de ellos, poder recrear el esquema cuando necesites.
</p>

<p style='text-align: justify;'>
También si tu aplicación tiene otras configuraciones, como URL’s, archivos, imágenes u cualquier otro dato que requiera para que las aplicaciones funcionen. Son datos que deberías analizar incluir en esta sección.
</p>

## Datos de pruebas
<p style='text-align: justify;'>
También este proceso nos ayuda a poder crear nuestras bases de datos y esquemas en cualquier punto en que los necesitemos, con finalidades como atender desarrollos o soportes. Y de poco nos sirve poder recrear la base de datos a la versión que necesitas, si desarrolladores y personal de calidad no tienen datos para que la aplicación funcione y se puedan probar los cambios.
</p>

<p style='text-align: justify;'>
Entonces, versiona inserts de estos datos, para que la base de datos siempre tenga datos para que el equipo pueda trabajar. Por ejemplo, crea usuarios, cuentas, clientes, facturas, cuentas por pagar y todo lo que tu sistema necesite para que se pueda usar y hacer pruebas sin tener que ingresar manualmente a crear estos datos cada vez que creemos una base de datos.
</p>

<p style='text-align: justify; font-weight: bold;'>
IMPORTANTE: Solo para ambientes de desarrollo y pruebas, asegúrate que tu proceso no los ejecute en ambientes productivos.
</p>

## Seguridad
<p style='text-align: justify;'>
Esta sección hace referencia a sentencias para crear los usuarios (logins de base de datos) que necesita nuestro esquema o base de datos para funcionar. Permisos adicionales que se requiera por parte del esquema o bien Grants que se deban dar para que roles o usuarios ejecuten paquetería o consultas SQL sobre tu esquema.
</p>

# Cultura “Cattle, No pets!”
<p style='text-align: justify;'>
En esta cultura, se pretende que no te amarres a componentes o que los sientas irremplazables, por lo que no deberías tener problemas de borrar la base de datos de desarrollo y volverla a crear desde cero y a la versión que necesitas con este proceso.
</p>

<p style='text-align: justify;'>
Naturalmente eso en producción o con datos en certificación no es posible, pero debes tener esa capacidad y es recomendable que lo hagas periódicamente para garantizar que tanto el proceso, como los scripts funcionan al 100% y que no se te ha quedado ningún detalle fuera de versionamiento o del proceso
</p>

# Conclusión
<p style='text-align: justify;'>
Es natural la resistencia al cambio, y esto suele ser más frecuente en tareas o procesos delicados. Sin embargo, hay que poner sobre la balanza los reales beneficios técnicos comprobables.
</p>

<p style='text-align: justify;'>
Hoy, con más experiencia en estos procesos, hemos implementado scripts de migraciones de esquemas, con credenciales que solo el DBA conoce y adecuadamente resguardadas en sistemas con estos fines, Todos los logs de las ejecuciones a disposición del equipo, garantizando que no hay información sensible en ellos, gracias también a una recolección automática que analiza datos sensibles y los enmascara en caso de que los encuentre, evitando que, datos sensibles sean vistos por personal no autorizado.
</p>

<p style='text-align: justify;'>
Lo imposible se ha vuelto posible, y es gratificante ver como el mismo equipo hoy está feliz por tener un proceso que facilita, mejora la seguridad y hace que migraciones que tardaban horas con gran posibilidad de error humano hoy son aplicadas en minutos con mayor certeza, confianza y seguridad.
</p>

<p style='text-align: justify;'>
Finalmente recuerda que, hay múltiples caminos que te pueden llevar al mismo lugar, y con esto ten presente que hay muchas herramientas, procesos y formas de implementarlos para resolver estas necesidades de automatización.
</p>