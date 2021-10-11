---
layout: default
title: 알고리즘 문제해결 전략
description: 기초부터 쌓아가기
work: true
main: true
project-header: true
header-img: "img/project_bg.jpg"
---



<ul class="catalogue">
{% assign sorted = site.pages | sort: 'date' | reverse %}
{% for page in sorted %}
{% if page.jongman == true %}
{% include post-list.html %}
{% endif %}
{% endfor %}
</ul>
