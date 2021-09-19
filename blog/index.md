---
layout: default
title: "Blog"
description: 오 이렇게도되나<br>
[List를 보고싶다면](https://beenpow.github.io/blog/)
main: true
project-header: true
header-img: img/about.jpg
---

<ul class="catalogue">
{% assign sorted = site.pages | sort: 'order' | reverse %}
{% for page in sorted %}
{% if page.blog == true %}
{% include post-list.html %}
{% endif %}
{% endfor %}
</ul>
