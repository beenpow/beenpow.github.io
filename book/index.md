---
layout: default
work: true
main: true
title: Book recommendation
description: books
project-header: true
header-img: "img/project_bg.jpg"
---


&nbsp;
 <p class="second-label">
    <span class="label-emoji">
       &#128054;
    </span>
    &nbsp; You are what you read (quick link)
 </p>
 
 
 <li><a href = "https://www.notion.so/91e64213b55c42a7bf96dc024d53a3e3?v=f1c2dd1fa3f14c318e69606d5d1a0704">BOOKS</a></li>
  
 &nbsp;
 &nbsp;
 &nbsp;








<div class="catalogue">
{% assign sorted = site.pages | sort: 'order' | reverse %}
{% for page in sorted %}
{% if page.book == true %}

     {% include post-list.html %}

{% endif %}
{% endfor %}
</div>
