---
layout: default
title: Problem Solving
description: A collection of algorithm challenges and coding tests I’ve solved, reflecting my approach to logic, efficiency, and problem-solving as a software engineer.
work: true
main: true
project-header: true
header-img: ""
---

<style>
/* 버튼(요약) 공통 스타일 */
.ps-btn {
  display:inline-block; padding:10px 14px; border-radius:12px;
  font-weight:600; text-decoration:none; cursor:pointer;
  background:#f5f3ff; color:#6b21a8; border:1px solid #e9d5ff;
  transition:transform .15s ease, background .15s ease, box-shadow .15s ease;
}
.ps-btn:hover { background:#ede9fe; transform:translateY(-1px); box-shadow:0 2px 8px rgba(0,0,0,.06); }
.ps-row { display:flex; flex-wrap:wrap; gap:8px; margin:10px 0 18px; }

/* 섹션 라벨 */
.ps-label { font-size:1.05rem; font-weight:700; margin:24px 0 8px; display:flex; align-items:center; gap:8px; }
.ps-emoji { font-size:1.2rem; }

/* 색상 변형(원하면 조절 가능) */
.ps-samsung { background:#eff6ff; color:#2563eb; border-color:#bfdbfe; }
.ps-happy   { background:#ecfdf5; color:#059669; border-color:#bbf7d0; }
.ps-leet    { background:#f5f3ff; color:#7c3aed; border-color:#e9d5ff; }

/* details 기본 스타일 */
.ps-acc { margin:8px 0 4px; }
.ps-acc > summary { list-style:none; }
.ps-acc > summary::-webkit-details-marker { display:none; }

/* 리스트 정돈 */
.ps-list { margin:6px 0 14px 18px; }
.ps-list li { margin:4px 0; }



/* 하위 링크들을 버튼처럼 */
.ps-list {
  margin: 8px 0 14px 0;
  padding-left: 0;
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
}
.ps-list li { list-style: none; margin: 0; }
.ps-list a {
  display: inline-block;
  padding: 8px 12px;
  border-radius: 10px;
  font-weight: 600;
  text-decoration: none;
  border: 1px solid #e5e7eb;
  background: #f9fafb;
  color: #111827;
  transition: transform .15s ease, box-shadow .15s ease, background .15s ease;
}
.ps-list a:hover {
  background: #f3f4f6;
  transform: translateY(-1px);
  box-shadow: 0 2px 8px rgba(0,0,0,.06);
}

/* 카테고리별 색감(상위 버튼 팔레트와 맞춤) */
.ps-list.ps-samsung a { background:#eff6ff; color:#2563eb; border-color:#bfdbfe; }
.ps-list.ps-happy   a { background:#ecfdf5; color:#059669; border-color:#bbf7d0; }
.ps-list.ps-leet    a { background:#f5f3ff; color:#7c3aed; border-color:#e9d5ff; }

</style>





<!-- Samsung -->
<p class="ps-label"><span class="ps-emoji">🐶</span> Samsung Coding Test</p>
<details class="ps-acc">
  <summary class="ps-btn ps-samsung">Advanced (Type A)</summary>
  <ul class="ps-list">
    <li><a href="https://beenpow.github.io/ps/JONGMAN/">Book: 알고리즘 문제 해결 전략 (구종만)</a></li>
    <li><a href="https://beenpow.github.io/ps/FAILNOTE/">Fail Note with mistakes</a></li>
  </ul>
</details>
<details class="ps-acc">
  <summary class="ps-btn ps-samsung">Professional (Type B)</summary>
  <ul class="ps-list">
    <li><a href="https://beenpow.github.io/ps/PRO/">Basic Data Structure</a></li>
    <li><a href="https://beenpow.github.io/ps/USACO/">USACO Silver</a></li>
  </ul>
</details>

<!-- Happy PS -->
<p class="ps-label"><span class="ps-emoji">👻</span> Happy PS</p>
<details class="ps-acc">
  <summary class="ps-btn ps-happy">Codeforces</summary>
  <ul class="ps-list">
    <li><a href="https://beenpow.github.io/ps/COFO/coforound/">Codeforces Round</a></li>
    <li><a href="https://beenpow.github.io/ps/COFO/cofoeach/">Codeforces 1000–1400</a></li>
  </ul>
</details>
<div class="ps-row">
  <a class="ps-btn ps-happy" href="https://beenpow.github.io/ps/BOJ/">BOJ</a>
</div>

<!-- LeetCode -->
<p class="ps-label"><span class="ps-emoji">👻</span> LeetCode</p>
<div class="ps-row">
  <a class="ps-btn ps-leet" href="https://beenpow.github.io/ps/LEETCODE/EASY/">Easy</a>
  <a class="ps-btn ps-leet" href="https://beenpow.github.io/ps/LEETCODE/MEDIUM/">Medium</a>
  <a class="ps-btn ps-leet" href="https://beenpow.github.io/ps/LEETCODE/HARD/">Hard</a>
</div>

<ul class="catalogue">
{% assign sorted = site.pages | sort: 'date' | reverse %}
{% for page in sorted %}
{% if page.ps == true %}
{% include post-list.html %}
{% endif %}
{% endfor %}
</ul>
