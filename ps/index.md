---
layout: default
title: Problem Solving
description: 정리하며 ps하기
work: true
main: true
project-header: true
header-img: "img/project_bg.jpg"
---

<p class="second-label">
   <span class="label-emoji">
      &#128054;
   </span>
   &nbsp; 삼성 코딩 테스트 대비 (quick link)
</p>

<li>
 <a onclick = "this.nextSibling.style.display=(this.nextSibling.style.display=='none')?'block':'none';" href = "javascript:void(0)">
    Advanced (A형)
 </a><div style = "DISPLAY : none">
   <ul>
    <li><a href = "https://beenpow.github.io/ps/JONGMAN/">&nbsp;&nbsp;&nbsp; - 알고리즘 문제 해결 전략 (구종만 지음)</a></li>
    <li><a href = "">&nbsp;&nbsp;&nbsp; - 코딩 테스트 대비 실수 모음집</a></li>
    <li><a href = "https://beenpow.github.io/ps/FAILNOTE/">&nbsp;&nbsp;&nbsp; - 삼성 Fail Note</a></li>
   </ul>
 </div>
</li>
<li>
 <a onclick = "this.nextSibling.style.display=(this.nextSibling.style.display=='none')?'block':'none';" href = "javascript:void(0)">
    Professional (B형)
 </a><div style = "DISPLAY : none">
   <ul>
    <li><a href = "https://beenpow.github.io/ps/PRO/">&nbsp;&nbsp;&nbsp; - 기본적인 자료 구조</a></li>
    <li><a href = "https://beenpow.github.io/ps/USACO/">&nbsp;&nbsp;&nbsp; - Usaco Silver 풀이</a></li>
    <li><a href = "">&nbsp;&nbsp;&nbsp; - 실력증대 실수 모음</a></li>
    <li><a href = "">&nbsp;&nbsp;&nbsp; - Lesson's learned</a></li>
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
