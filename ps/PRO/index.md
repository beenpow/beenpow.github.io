---
layout: default
title: Preparing for Samsung Type B (pro)
description: Building algorithms
work: true
main: true
project-header: true
header-img: ""
---



<div class="ps-gallery">
{% assign sorted = site.pages | sort: 'date' | reverse %}
{% for page in sorted %}
{% if page.pro == true %}
{% include post-list-ps-gallery.html %}
{% endif %}
{% endfor %}
</div>
