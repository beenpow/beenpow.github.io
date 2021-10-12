---
layout: default
title: samsung software test
description: 입사를 위한, 입사 후에도
work: true
main: true
project-header: true
header-img: "img/project_bg.jpg"
---



<ul class="catalogue">
{% assign sorted = site.pages | sort: 'date' | reverse %}
{% for page in sorted %}
{% if page.swfailnote == true %}
{% include post-list.html %}
{% endif %}
{% endfor %}
</ul>
