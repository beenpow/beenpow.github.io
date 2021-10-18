---
layout: default
title: "AOSP"
description: It's all about Android and Linux
main: true
project-header: true
header-img: img/about.jpg
---

<a href="https://beenpow.github.io/book/" target="_top">goto book</a>

<ul class="catalogue">
{% assign sorted = site.pages | sort: 'order' | reverse %}
{% for page in sorted %}
{% if page.aosp == true %}
{% include post-list.html %}
{% endif %}
{% endfor %}
</ul>
