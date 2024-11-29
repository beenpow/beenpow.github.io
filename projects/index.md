---
layout: default
work: true
main: true
title: PROJECTS
description: projects
project-header: true
header-img: ""
---


&nbsp;


<div class="catalogue">
{% assign sorted = site.pages | sort: 'order' | reverse %}
{% for page in sorted %}
{% if page.projects == true %}
     {% if page.undergrad == true %}
          {% include post-list.html %}
{% endif %}
{% endif %}
{% endfor %}
</div>
