---
layout: default
work: true
main: true
title: Progress
description: codeforce problem solving history
project-header: true
header-img: ""
---

<div class="catalogue">
{% assign sorted = site.pages | sort: 'order' | reverse %}
{% for page in sorted %}
{% if page.projects == true %}

     {% include post-list.html %}

{% endif %}
{% endfor %}
</div>
