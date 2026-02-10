---
layout: default
title: Algorithm problem solving strategy
description: Building from the basics
work: true
main: true
project-header: true
header-img: ""
---

<p class="second-label">
   <span class="label-emoji">
      &#128073;
   </span>
   &nbsp; Contents
   <a href="{{ site.baseurl }}/ps/JONGMAN/2019-11-23-Jongman-list/2019-11-23-Jongman-list" target="_top">click</a>
</p>


<div class="ps-gallery">
{% assign sorted = site.pages | sort: 'date' | reverse %}
{% for page in sorted %}
{% if page.jongman == true %}
{% include post-list-ps-gallery.html %}
{% endif %}
{% endfor %}
</div>
