---
layout: default
title: Problem Solving
description: Looking back
work: true
main: true
project-header: true
header-img: ""
---

<p class="second-label">
   <span class="label-emoji">
      &#128054;
   </span>
   &nbsp; Samsung Coding Test (quick link)
</p>

<li>
 <a onclick = "this.nextSibling.style.display=(this.nextSibling.style.display=='none')?'block':'none';" href = "javascript:void(0)">
    Advanced (Type A)
 </a><div style = "DISPLAY : none">
   <ul>
    <li><a href = "https://beenpow.github.io/ps/JONGMAN/">&nbsp;&nbsp;&nbsp; - Book:알고리즘 문제 해결 전략 (구종만 지음)</a></li>
    <li><a href = "https://beenpow.github.io/ps/FAILNOTE/">&nbsp;&nbsp;&nbsp; - Fail Note with mistakes</a></li>
   </ul>
 </div>
</li>
<li>
 <a onclick = "this.nextSibling.style.display=(this.nextSibling.style.display=='none')?'block':'none';" href = "javascript:void(0)">
    Professional (Type B)
 </a><div style = "DISPLAY : none">
   <ul>
    <li><a href = "https://beenpow.github.io/ps/PRO/">&nbsp;&nbsp;&nbsp; - Basic Data Structure</a></li>
    <li><a href = "https://beenpow.github.io/ps/USACO/">&nbsp;&nbsp;&nbsp; - Usaco Silver</a></li>
   </ul>
 </div>
</li>

&nbsp;
<p class="second-label">
   <span class="label-emoji">
      &#128123;
   </span>
   &nbsp; Happy PS (quick link)
</p>


<li>
 <a onclick = "this.nextSibling.style.display=(this.nextSibling.style.display=='none')?'block':'none';" href = "javascript:void(0)">
    Codeforce
 </a><div style = "DISPLAY : none">
   <ul>
    <li><a href = "https://beenpow.github.io/ps/COFO/coforound/">&nbsp;&nbsp;&nbsp; - Codeforce round</a></li>
    <li><a href = "https://beenpow.github.io/ps/COFO/cofoeach/">&nbsp;&nbsp;&nbsp; - Codeforce 1000-1400</a></li>
   </ul>
 </div>
</li>
<li><a href = "https://beenpow.github.io/ps/BOJ/">BOJ</a></li>

&nbsp;
<p class="second-label">
   <span class="label-emoji">
      &#128123;
   </span>
   &nbsp; Leet Code (quick link)
</p>
<li><a href = "https://beenpow.github.io/ps/LEETCODE/EASY/">easy</a></li>
<li><a href = "https://beenpow.github.io/ps/LEETCODE/MEDIUM/">medium</a></li>
<li><a href = "https://beenpow.github.io/ps/LEETCODE/HARD/">hard</a></li>

&nbsp;
&nbsp;
&nbsp;

<ul class="catalogue">
{% assign sorted = site.pages | sort: 'date' | reverse %}
{% for page in sorted %}
{% if page.ps == true %}
{% include post-list.html %}
{% endif %}
{% endfor %}
</ul>
