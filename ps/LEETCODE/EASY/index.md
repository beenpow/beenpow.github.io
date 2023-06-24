---
layout: default
title: LeetCode Easy
description: Hitting easy problems
work: true
main: true
project-header: true
header-img: "img/project_bg.jpg"
---


<ul class="catalogue">
{% assign sorted = site.pages | sort: 'date' | reverse %}
{% for page in sorted %}
{% if page.leetcode == true %}
{% if page.easy == true %}
{% include post-list.html %}
{% endif %}
{% endif %}
{% endfor %}
</ul>
