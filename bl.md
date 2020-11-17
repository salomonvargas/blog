---
layout: default
title: Blog
---
# El Blog de Shalo
##### [Regresar](https://salomonvargas.github.io/shalo-universe/index)

<h1>Últimos Posts</h1>

<ul>
  {% for post in site.posts %}
    <li>
      <h2><a href="{{ post.url }}">{{ post.title }}</a></h2>
      {{ post.excerpt }}
    </li>
  {% endfor %}
</ul>