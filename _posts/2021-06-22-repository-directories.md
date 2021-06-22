---
layout: post
title: Estructuras de directorios en repositorios
subtitle: La estandarización es vital en los procesos automáticos y como humanos nos ayuda a comprender mejor los entornos y tareas en las que trabajamos. Los repositorios no son la excepción.
cover-img: /assets/img/landcapes/mountains.jpg
thumbnail-img: /assets/img/icons/directories.png
#share-img: /assets/img/path.jpg
tags: [DevOps, Git, Repositories, Directories]
comments: true
---
<p style='text-align: justify;'>
De seguro has escuchado de la frase de “Caoticamente hermoso”, bien no siempre esta suele ser tan poética como deseamos.
</p>

<p style='text-align: justify;'>
El orden en las tareas y más cuando son ejecutadas o seguidas por muchas personas, sistemas y productos suele ser algo más que un deseable y convertirse en una necesidad real.
</p>

<p style='text-align: justify;'>
Hoy les traigo sobre la mesa una propuesta de estructura de directorios que nos permitirá tener un mayor orden y estandarización de los archivos dentro de nuestros repositorios
</p>

# Lo primero
## ¿Por qué es importante?
<p style='text-align: justify;'>
Bueno, lo primero es la necesidad de estandarizar, encontrar los archivos en la misma estructura de carpetas sin importar la tecnología en la que estamos desarrollando el o los componentes (si, pueden coexistir varios en el mismo repositorio, pero de esto les hablo luego). Al tener esto estandarizado nosotros como humanos van a reconocer estos patrones (estructuras de carpetas) y vamos a encontrar lo que necesitamos de forma más facil.
</p>
<div style="width: 100%; text-align: center;">
    <p><img src="../assets/img/memes/create-directory.jpg" alt="Bla!"></p>
</div>

## Ok, existen buscadores, ¿cuál es el drama?
<p style='text-align: justify;'>
Bien, no somos solo nosotros, también son nuestras siempre fieles amigas las máquinas, ellas que son exelentes en los procesos que nosotros no podemos hacer de forma repetitiva, tan rápida o precisa.
Necesitamos ordenar el contenido del repositorio, y de esta froma facilitar los procesos (menores tareas de búsqueda, eliminación, ordenamiento, etc) haciendolos más eficientes, rápidos y requiriendo muchísimas menos lineas de código para programar estas tareas.
</p>

# La propuesta.
<p style='text-align: justify;'>
Bien, simple la mayoría de los problemas tienen varias soluciones, y hoy les traigo una que pueden utilizar o modificar para sus repositorios.
Espero que les haga sentido y les permita solucionar muchos de los problemas que este ordenamiento me ha ayudado a resolver.
</p>

<p style='text-align: justify;'>
Sin más, les comparto la estructura:
</p>

• build
• docs
• lib
• res
• scripts
• scr
• tools
• readme

## build
<p style='text-align: justify;'>
Esta directorio tiene como fin contener los binarios de las aplicaciones una vez que son compiladas, y por lo tanto, tener claro que lo que hay ahí ya ha pasado el proceso de compilación y está listo para empaquetar, contenerizar o cualquier otro proceso que le des a los binarios luego de la compilación.
</p>

<p style='text-align: justify;'>
Que pasa cuando no hay compilados, cuando tu código es interpetado, HTML, CSS o cualquier otro lenguaje no compilado. Bien, recuerda que te doy una guia, yo consideraría aprovechar para obfuscar, minificar o procesar tus archivos con cualquier otro proceso que te haga sentido y le aporte valor al proceso. Y hacerlo en una carpeta vacia te permite determinar también si estás enviando archivos (a paquetes o contenedores) que realmente no deberían ir.
</p>

<p style='text-align: justify;'>
Si usas Git como sistema de control de versiones, sabrás que no puedes tener directorios sin archivos, por lo que deberás crear este directorio en tus procesos de integración continua o compilacicón.
</p>

## docs
<p style='text-align: justify;'>
Bien, acá no hay misterio, colocamos la documentación interna o externa del producto, librerías o cualquier otra documentación que tengamos relacionada al proyecto. No está de más si tienes oportunidad de incluir enlaces a otra documentación de terceros que puedan estarse actualizando constantemente como es el caso de aplicaciones o librerías de terceros.
</p>

<p style='text-align: justify;'>
Con esta sección de documentación encontrarás en un único lugar y unificado todo lo relacionado a documentación, y en caso de que lleves documentación en sistemas especializados tendrás donde agregar tus enlaces a esa documentación externa al repositorio. 
</p>

<p style='text-align: justify;'>
Ten en cuenta que de nada sirve que tengas la mejor documentación del mundo, si nadie la puede encontrar cuando la necesita de forma fácil. 
</p>

## libs
<p style='text-align: justify;'>
En esta carpeta coloca librerías que tu software requiera, y en este momento te preguntas ¿y los gestores de dependencias? ¿Para que descargo librerías que alguien disponibiliza por mi?. Bien, no pierdas la calma. Acá hay dos posibles razones. 
</p>

<p style='text-align: justify;'>
La primera es que no estás pensando en tecnologías no tan bendecidas por los avances, olvidadas en el tiempo. Todas aquellas tecnologias que dependen de que los desarrolladores busquen sus dependencias y las tengan sincronizadas a el código que están desarrollando. Ellos aun necesitan guardar librerias y sin ellas el software no compila o no es funcional, por lo que no existe mejor lugar para colocarlas que el mismo repositorio.
</p>

<p style='text-align: justify;'>
La segunda razón, es que hay entornos muy criticos en los que se busca tener la capacidad de compilar aunque el mundo entero haya sido destruido por un apocalipsis nuclear y si estás en esos entornos y lees esto desde un bunquer, quizas veas este directorio muy bueno (suerte con la repoblación de la tierra)
</p>

## res
<p style='text-align: justify;'>
Res viene por resources y en este directorio colocamos todos aquellos recursos que necesitamos para nuestras documentaciones, aplicativos y cualquier otro elemento que estemos guardando en el repositorio.
</p>

<p style='text-align: justify;'>
Es probable que en este momento estén pensando ¿y mi sitio, quieres que saque las imagenes, iconos, audios, fuentes, etc a este directorio en lugar de tenerlo donde las buenas prácticas dictan?. Bien, simple, si la tecnologia que usas ya contempla esto..... ya sabes la respuesta. Pero si no lo hace, ya tienes un directorio donde colocar esos recursos.
</p>

## scripts
<p style='text-align: justify;'>
Sin lugar a dudas, uno de mis favoritos. Este directorio debe contener los scripts que necesitamos en diferentes procesos del ciclo de vida de nustra o nuestras aplicaciones.
</p>

<p style='text-align: justify;'>
Aca podemos encontrar desde scripts para CI CD, hasta scripts de validación, mantenimiento o cualquier otro proceso que hayamos automatizado mediante la legendaria arte del scripting.
</p>

<p style='text-align: justify;'>
Y aunque para muchos suena descabellado tener que escribir un post para recomendar crear un directorio llamado scripts para meter los scripts, deberían ver los repositorios que yo he visto.
</p>

## scr
<p style='text-align: justify;'>
Scr viene por “Source Code” y adivinen ¿qué va dentro de este directorio?. Exacto!, código fuente de tus aplicaciones.
</p>

<p style='text-align: justify;'>
La idea es la misma de los directorios anteriores, un directorio con un nombre que te permita mantener ordenado tu código fuente y de una forma humana saber donde ir a buscar código una vez que te descargas el repositorio.
</p>

<p style='text-align: justify;'>
Te en cuenta que dentro de este directorio podrías tener varias aplicaciones con dependencias tan estrechas que requieran estar todas en el mismo repositorio como lo es el caso de aplicaciones con arquitecturas de “n capas” y otros ejemplos que espero despues poder comentarles.
</p>

<p style='text-align: justify;'>
También ten en cuenta que si tienes infraestructura como código, acá sería un buen lugar para colocarla, en caso de que no sea que manejeas un repositorio aparte solo para ese fin.
</p>

## tools
<p style='text-align: justify;'>
Este directorio busca que guardes las herramientas que necesiten los usuarios de este repositorio para poder trabajar en él. Bien, no pierdas la paz acá tampoco.... No vas a meter un instalador del IDE para cada sistema operativo y en diferentes versiones en este directorio.
</p>

<p style='text-align: justify;'>
Más bien piensa si tienen aplicaciones inhouse que son requeridas para que algo funcione, o para alguno de los procesos. Bien si ese es el caso si puedes considerar colocarla en este directorio. Pero por otro lado, si puedes meter acá refencias (no instaladores) a los IDEs o herramientas que necesitas. Por ejemplo, puedes colocar los enlaces para descargar el IDE, herramientas de diseño grafico, diseño o edición de audio o cualquier otra herramienta que se requiera para desarrollar su software. Asi ayudarás a los nuevos en el proyecto a localizar las herramientas que necesita, o por lo menos cuales recomienta usar el equipo.
</p>

## readme
<p style='text-align: justify;'>
Este no es un directorio, es una archivo y detrás de él también hay toda un arte y una ciencia para hacerlo. Pero solo te recomiendo que en la raíz del directorio coloques este archivo y que no está mal que en este también le comentes a los que clonan el repositorio de las locuras que hemos hecho con los directorios y el porqué de cada uno de ellos.
</p>

## Conclusión
<p style='text-align: justify;'>
Lo importante no es que esté de acuerdo con la estructura que comparto, realmente lo que hace sentido acá es recalcar en la importancia de tener un orden que les aporte valor y que les permita tener ordenado el repositorio de código fuente.

<p style='text-align: justify;'>
Muchos de los directorios expustos podrían no tener tanto sentido con algunas de las tecnologías, pero en otros casos pueden hacer gran diferencia.

<p style='text-align: justify;'> 
Finalmente recuerda que estandarizar aporta valor, les facilita la vida y cuando encuentren la estructura que les hace sentido, aplicarla a todos los repositorios hará que todo fluya mejor.
</p>