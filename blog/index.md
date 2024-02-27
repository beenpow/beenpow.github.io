---
layout: default
title: "Blog"
description: 오 이렇게도되나 2
main: true
project-header: true
header-img: "https://www.spotebi.com/wp-content/uploads/2019/01/one-day-day-one-workout-motivation-spotebi.jpg"
---

<a href="https://beenpow.github.io/book/" target="_top">goto book</a>

<ul class="catalogue">
{% assign sorted = site.pages | sort: 'order' | reverse %}
{% for page in sorted %}
{% if page.blog == true %}
{% include post-list.html %}
{% endif %}
{% endfor %}
</ul>
