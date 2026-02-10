---
layout: default
title: Codeforce focus on weak problems
description: Build up step by step
work: true
main: true
project-header: true
header-img: ""
---

<p class="second-label">
   <span class="label-emoji">
      &#128305;
   </span>
   &nbsp; Progress for 1000-1400
   <a href="{{ site.baseurl }}/ps/COFO/cofoeach/2021-10-14-cofo-list/2021-10-14-cofo-list" target="_top">click</a>
</p>

<div class="ps-gallery">
{% assign sorted = site.pages | sort: 'date' | reverse %}
{% for page in sorted %}
{% if page.cofoeach == true %}
{% include post-list-ps-gallery.html %}
{% endif %}
{% endfor %}
</div>
