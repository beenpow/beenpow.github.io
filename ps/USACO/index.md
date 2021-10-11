---
layout: default
title: USACO 문제풀이
description: quality matters
work: true
main: true
project-header: true
header-img: "img/project_bg.jpg"
---



<ul class="catalogue">
{% assign sorted = site.pages | sort: 'date' | reverse %}
{% for page in sorted %}
{% if page.usaco == true %}
{% include post-list.html %}
{% endif %}
{% endfor %}
</ul>
