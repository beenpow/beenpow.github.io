---
layout: default
title: USACO problem solving
description: quality matters
work: true
main: true
project-header: true
header-img: ""
---



<div class="ps-gallery">
{% assign sorted = site.pages | sort: 'date' | reverse %}
{% for page in sorted %}
{% if page.usaco == true %}
{% include post-list-ps-gallery.html %}
{% endif %}
{% endfor %}
</div>
