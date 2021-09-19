---
layout: default
title: "Blog"
description: 오 이렇게도되나<br><a href="https://beenpow.github.io/book/" target="_top">wgat</a>
main: true
project-header: true
header-img: img/about.jpg
---

- TEST
<ul class="catalogue">
{% assign sorted = site.pages | sort: 'order' | reverse %}
{% for page in sorted %}
{% if page.blog == true %}
{% include post-list.html %}
{% endif %}
{% endfor %}
</ul>
