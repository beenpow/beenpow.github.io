---
layout: default
title: 알고리즘 문제해결 전략
description: 기초부터 쌓아가기
work: true
main: true
project-header: true
header-img: "https://www.spotebi.com/wp-content/uploads/2019/01/one-day-day-one-workout-motivation-spotebi.jpg"
---

<p class="second-label">
   <span class="label-emoji">
      &#128073;
   </span>
   &nbsp; 목차
   <a href="https://beenpow.github.io/ps/JONGMAN/2019-11-23-Jongman-list/2019-11-23-Jongman-list" target="_top">click</a>
</p>


<ul class="catalogue">
{% assign sorted = site.pages | sort: 'date' | reverse %}
{% for page in sorted %}
{% if page.jongman == true %}
{% include post-list.html %}
{% endif %}
{% endfor %}
</ul>
