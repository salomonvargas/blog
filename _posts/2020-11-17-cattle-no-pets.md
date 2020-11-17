---
layout: post
title: Cattle, no pets!
subtitle: Una increíble cultura que debemos adoptar
cover-img: /assets/img/path.jpg
thumbnail-img: /assets/img/cattlenopets/NoPets.jpg
#share-img: /assets/img/path.jpg
tags: [DevOps, Culture, Cattle, Pets]
comments: true
---
# Cattle, no pets!

De seguro te preguntarás es la relación entre ganado (cattle) y las mascotas (pets), y aun más allá, del como estos dos términos tienen relación con la cultura y las tecnologías de información.

Lo primero es determinar el significado de la frase. Esta proviene del manejo o trato diferenciado que actualmente se les dan a diferentes animales. Sabemos que no tenemos vacas en nuestras casas, sentadas en nuestros regazos. Ni tampoco criamos animales como gatos, o perros en campos abiertos. Pues es de esta diferencia en el trato de los animales de granja y animales domésticos o mascotas que surge esta cultura.
![alt text](/assets/img/cattlenopets/mascota.jpg "Mascota Confundida")

La cultura del “Cattle, no pets”, pretende que nuestra infraestructura, servicios, aplicaciones y demás componentes tecnológicos que hay en nuestras empresas sean tratados como lo que son “un negocio” y no como piezas irremplazables (como lo son las mascotas en nuestras vidas).  Y probablemente te estás preguntando si esta comparación no es un tanto grotesca. Quizás sí, el termino, es un poco impactante, pero da, en el que lo comprende, un duro golpe de realidad y cambia el punto de vista sobre los componentes que administrados y operamos en el mundo de la tecnología.

Pero. ¿y la cultura? Bien, la cultura del “Cattle, no pets” pretende que al ver, por ejemplo, un servidor como una pieza más de tu trabajo como ganadero, seas consiente de que el servidor se crea en determinado momento (nace), y se irá irremediablemente para un matadero, enfermará o terminará cumpliendo su ciclo de vida, y que no debes encariñarte con él (aceptar que puede enfermar repentinamente o morir irremediablemente sin importar cuanto te esfuerces o pidas a un veterinario que le ayude). 

Entonces, ¿Qué significa encariñarte con un componente? Y ¿Cómo evito encariñarme con mis servidores u otros componentes? Bien, lo primero acepta el hecho de que se pueden enfermar o morir en cualquier momento, y un componente enfermo al igual que en la ganadería, verás que termina enfermando a los demás componentes. Así bien, aceptando esto empezarás a ver que necesitarás tener la capacidad de crear otro servidor (vaquita) tan rápido como puedas y que te haga la misma tarea que el anterior (empiece a producir leche de inmediato) 

Te dejo estos consejos para empezar a adoptar esta cultura en tu vida (si también tu equipo personal hoy es una mascota que puedes volver en vaca) y en tu organización

## Estandariza todo lo que puedas
Usualmente en las personas que tienen varias mascotas, estas suelen tener varias especies (como un perro y un gato), a cada uno le pondrá nombres bonitos, pero normalmente sin relación entre ellos. Tome en cuenta esto y empiece a crear un estándar de nombres, estándar de números de puertos, direcciones IP y nombres DNS. 
Cree diagramas para mapear y tener claridad de cuales son sus vacas, y que función tienen dentro del rebaño.
Estandarizar le permitirá tener más control y podrá recrear vacas más fácil y rápido.

## Automatización
Es un negocio, y el tiempo es oro, sus clientes, sus compañeros y sus jefes esperan que todo esté rápido y confiable. Nadie te dará un premio por hacer una tarea bien, si tardas mucho.
Esto lo logras con automatización, has que tus vacas tengan scripts de aprovisionamiento y otras tecnologías para crearlas con las dependencias que necesitan, como Docker, MV, etc.
Automatiza todo lo que puedas, no solo la creación de servidores, sino piensa también en Integración y Despliegues continuos, configuraciones de componentes como bases de datos, balanceadores de cargas y todo lo que puedas meter en Runbooks
Los scripts al final son código fuente así que no olvides versionarlos en un repositorio de código fuente y hacer un manejo adecuado de números de versión y releases de estos

## Cuida los pequeños detalles
Los pequeños detalles hacen la diferencia, puedes verlo en productos de marcas originales vs las copias, donde ves costuras salidas, materiales de mala calidad. Acá no es la excepción y pensar que una configuración que te toma 1 minuto hacer a mano no amerita ser versionada en scripts. Esto es un grave muy grave error. Si tu vaca muere y tratas de recrearla, de seguro olvidarás esa configuración y tu servicio no funcionará o lo hará mal hasta que diagnostiques ese problema y eso te tomará tiempo y dinero en resolver.
Ten la disciplina de automatizarlo sin importar lo pequeño que este cambio o configuración sea y verás que cuando recrees una máquina o servicio esté funcionará a la primera sin errores, pues no dejaste ni una sola configuración fuera del proceso automático.

## Ayuda a otros a comprender la cultura
Una cultura no es una persona, esto funciona si todos somos parte de la solución. Cuando enseñes a otros la importancia de esta cultura y la adopten en sus trabajos diarios, en sus scripts y en sus diseños. Todos se verán beneficiados y la cultura se abrirá campo por si misma.

## Envía vacas al matadero
Perdón por ser tan crudo nuevamente, pero debes asegurarte de que puedes crear componentes rápidos y confiables, ¡demuéstralo! 
Aleatoriamente y de una forma planificada (respaldando todo lo importante) destruye una vaca y toma las métricas de cuanto tiempo te tomo tener el componente operando nuevamente, verifica si alguna configuración se quedó por fuera y debes incluirla en los scripts y automatización. 
Si haces esto periódicamente y en diferentes componentes te iras asegurando que todo va por buen camino. Es el mismo principio por el cual se hacen simulacros.
