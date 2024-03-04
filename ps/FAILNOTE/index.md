---
layout: default
title: samsung software test
description: 입사를 위한, 입사 후에도
work: true
main: true
project-header: true
header-img: ""
---

<p class="second-label">
   <span class="label-emoji">
      &#128073;
   </span>
   &nbsp; 실수 모음
   <a href="https://beenpow.github.io/ps/FAILNOTE/2020-03-21-mistake/2020-03-21-mistake" target="_top">click</a>
</p>

<ul class="catalogue">
{% assign sorted = site.pages | sort: 'date' | reverse %}
{% for page in sorted %}
{% if page.swfailnote == true %}
{% include post-list.html %}
{% endif %}
{% endfor %}
</ul>
