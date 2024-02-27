---
layout: default
title: SWEA 풀어보기
description: 기출문제 풀어보기
work: true
main: true
project-header: true
header-img: "https://www.spotebi.com/wp-content/uploads/2019/01/one-day-day-one-workout-motivation-spotebi.jpg"
---



<ul class="catalogue">
{% assign sorted = site.pages | sort: 'date' | reverse %}
{% for page in sorted %}
{% if page.swea == true %}
{% include post-list.html %}
{% endif %}
{% endfor %}
</ul>
