---
layout: default
title: samsung software test
description: For recruitment and beyond
work: true
main: true
project-header: true
header-img: ""
---

<p class="second-label">
   <span class="label-emoji">
      &#128073;
   </span>
   &nbsp; Mistakes collection
   <a href="{{ site.baseurl }}/ps/FAILNOTE/2020-03-21-mistake/2020-03-21-mistake" target="_top">click</a>
</p>

<div class="ps-gallery">
{% assign sorted = site.pages | sort: 'date' | reverse %}
{% for page in sorted %}
{% if page.swfailnote == true %}
{% include post-list-ps-gallery.html %}
{% endif %}
{% endfor %}
</div>
