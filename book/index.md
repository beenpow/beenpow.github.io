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
 
 
 <li><a href = "https://www.notion.so/91e64213b55c42a7bf96dc024d53a3e3?v=7e11c72868da4298a4560070e84fb4e3">BOOKSHELF</a></li>
  
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
