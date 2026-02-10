---
layout: default
title: Codeforce full round
description: Level check while building up
work: true
main: true
project-header: true
header-img: ""
---

<p class="second-label">
   <span class="label-emoji">
      &#128293;
   </span>
   &nbsp; Round Progress
   <a href="{{ site.baseurl }}/ps/COFO/coforound/2020-04-07-cofo-list/2020-04-07-cofo-list" target="_top">click</a>
</p>

<div class="ps-gallery">
{% assign sorted = site.pages | sort: 'date' | reverse %}
{% for page in sorted %}
{% if page.round == true %}
{% include post-list-ps-gallery.html %}
{% endif %}
{% endfor %}
</div>
