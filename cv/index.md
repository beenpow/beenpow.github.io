---
layout: default
work: true
main: true
title: CV
description: cv
project-header: true
header-img: ""
---


&nbsp;


THIS IS CV





<div class="catalogue">
{% assign sorted = site.pages | sort: 'order' | reverse %}
{% for page in sorted %}
{% if page.book == true %}

     {% include post-list.html %}

{% endif %}
{% endfor %}
</div>
