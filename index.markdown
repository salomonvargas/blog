---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: home
---
<div id="container" style="display: block; margin-left: auto; margin-right: auto; width: 50%;">
    <img src="https://s.gravatar.com/avatar/5045fb8aeb55c9bf1f60d26af056f594?s=300" />
</div>

## Shalo!

<h1>Latest Posts</h1>

<ul>
  {% for post in site.posts %}
    <li>
      <h2><a href="{{ post.url }}">{{ post.title }}</a></h2>
      {{ post.excerpt }}
    </li>
  {% endfor %}
</ul>