---
layout: page
title: Shalo App
subtitle: Una caja de herramientas para tu terminal
---

# ¿Para qué sirve esta aplicación?
Shalo app es una aplicación para incluir multiples funcionalidades a tu terminal, como resguardo de links, snippets, información del sistema o resguardo de secretos.


## Instalación para Windows
<img src="../../assets/img/icons/Windows.svg" alt="windows" width="40" height="40">
Para instalar en sistemas operativos Windows abra Powershell como administrador y ejecute el siguiente comando
```Powershell
iex ((New-Object System.Net.WebClient).DownloadString('https://salomonvargas.github.io/shalo-universe/shalo-app/versions/1.0.0/win/shalo.ps1'))
```
 
---

## Instalación para GNU / Linux
<img src="../../assets/img/icons/gnu-linux.png" alt="gnu / linux" width="40" height="40">
Para instalar en sistemas operativos GNU / Linux abra la terminal y ejecute los siguientes comandos
```Bash
curl https://salomonvargas.github.io/shalo-universe/shalo-app/versions/1.0.0/linux/shalo.sh -o shalo.sh
sudo chmod +x shalo.sh
sudo sh shalo.sh
```

---

## Tip
Los archivos creados por la aplicación se guardan en una carpeta llamada "shalo" en el home del usuario, si quieres resguardar y llevar control de cambios sobre estos archivos, puedes crear un repositio git en el proveedor de su preferencia y versionar los archivos de información de la aplicación.

Esto también será util si usas la aplicación en varias terminales o máquinas, y no perderás la información.