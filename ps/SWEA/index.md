---
layout: default
title: SWEA 풀어보기
description: 기출문제 풀어보기
work: true
main: true
project-header: true
header-img: ""
---



<div class="ps-gallery">
{% assign sorted = site.pages | sort: 'date' | reverse %}
{% for page in sorted %}
{% if page.swea == true %}
{% include post-list-ps-gallery.html %}
{% endif %}
{% endfor %}
</div>
