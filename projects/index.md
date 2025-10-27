---
layout: default
work: true
main: true
title: PROJECTSs
description: A showcase of software projects that highlight my technical interests, problem-solving mindset, and engineering approach.
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
