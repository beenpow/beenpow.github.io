---
layout: default
title: Codeforce 취약문제 집중하기
description: 단계별로 쌓아가기
work: true
main: true
project-header: true
header-img: "img/project_bg.jpg"
---

<p class="second-label">
   <span class="label-emoji">
      &#128305;
   </span>
   &nbsp; Progress for 1000-1400
   <a href="https://beenpow.github.io/ps/COFO/cofoeach/2021-10-14-cofo-list/2021-10-14-cofo-list" target="_top">click</a>
</p>

<ul class="catalogue">
{% assign sorted = site.pages | sort: 'date' | reverse %}
{% for page in sorted %}
{% if page.cofoeach == true %}
{% include post-list.html %}
{% endif %}
{% endfor %}
</ul>
