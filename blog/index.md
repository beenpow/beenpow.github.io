---
layout: default
title: "Blog"
description: 오 이렇게도되나<br><a href="https://www.google.com/" target="_blank">Google</a>
main: true
project-header: true
header-img: img/about.jpg
---

- TEST
<ul class="catalogue">
{% assign sorted = site.pages | sort: 'order' | reverse %}
{% for page in sorted %}
{% if page.blog == true %}
{% include post-list.html %}
{% endif %}
{% endfor %}
</ul>
