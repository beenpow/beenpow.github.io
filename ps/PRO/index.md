---
layout: default
title: 삼성 B형(pro) 대비하기
description: 알고리즘 쌓아가기
work: true
main: true
project-header: true
header-img: "img/project_bg.jpg"
---



<ul class="catalogue">
{% assign sorted = site.pages | sort: 'date' | reverse %}
{% for page in sorted %}
{% if page.pro == true %}
{% include post-list.html %}
{% endif %}
{% endfor %}
</ul>
