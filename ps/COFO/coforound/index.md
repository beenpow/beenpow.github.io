---
layout: default
title: Codeforce full round 진행하기
description: Level Check 하며 쌓아가기
work: true
main: true
project-header: true
header-img: "https://www.spotebi.com/wp-content/uploads/2019/01/one-day-day-one-workout-motivation-spotebi.jpg"
---

<p class="second-label">
   <span class="label-emoji">
      &#128293;
   </span>
   &nbsp; Round Progress
   <a href="https://beenpow.github.io/ps/COFO/coforound/2020-04-07-cofo-list/2020-04-07-cofo-list" target="_top">click</a>
</p>

<ul class="catalogue">
{% assign sorted = site.pages | sort: 'date' | reverse %}
{% for page in sorted %}
{% if page.round == true %}
{% include post-list.html %}
{% endif %}
{% endfor %}
</ul>
