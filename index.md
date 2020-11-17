<div id="container" style="display: block; margin-left: auto; margin-right: auto; width: 50%;">
    <img src="https://s.gravatar.com/avatar/5045fb8aeb55c9bf1f60d26af056f594?s=300" />
</div>

## Shalo!

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
