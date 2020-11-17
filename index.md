@@ -7,17 +7,5 @@
Hola!!, mi nombre es Salomón Vargas, ingeniero en sistemas de información y entusiasta de la automatización.
Espero encuentres en esta página información de interés sobre la tecnología y el mundo de la integración y despliegue continuo

---
layout: default
title: Blog
---
<h1>Latest Posts</h1>

<ul>
  {% for post in site.posts %}
    <li>
      <h2><a href="{{ post.url }}">{{ post.title }}</a></h2>
      {{ post.excerpt }}
    </li>
  {% endfor %}
</ul>
[Blog](https://salomonvargas.github.io/shalo-universe/bl)