---
layout: default
title: Codeforce full round 진행하기
description: Level Check 하며 쌓아가기
work: true
main: true
project-header: true
header-img: "img/project_bg.jpg"
---



<ul class="catalogue">
{% assign sorted = site.pages | sort: 'date' | reverse %}
{% for page in sorted %}
{% if page.round == true %}
{% include post-list.html %}
{% endif %}
{% endfor %}
</ul>
