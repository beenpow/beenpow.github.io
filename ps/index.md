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
.ps-section { margin-bottom: 2rem; }
.ps-section:last-child { margin-bottom: 0; }
.ps-title {
  font-size: 0.75rem; font-weight: 600; letter-spacing: 0.05em; text-transform: uppercase;
  color: #6b7280; margin-bottom: 0.75rem;
}
.ps-links { display: flex; flex-wrap: wrap; gap: 0.5rem; }
.ps-links a {
  display: inline-block; padding: 0.5rem 1rem; border-radius: 6px;
  font-size: 0.9rem; font-weight: 500; text-decoration: none;
  background: #f8fafc; color: #334155; border: 1px solid #e2e8f0;
  transition: background .15s, border-color .15s, color .15s;
}
.ps-links a:hover {
  background: #f1f5f9; border-color: #cbd5e1; color: #0f172a;
}
.ps-links.ps-leet a { background: #f5f3ff; color: #5b21b6; border-color: #e9d5ff; }
.ps-links.ps-leet a:hover { background: #ede9fe; border-color: #c4b5fd; color: #4c1d95; }
.ps-links.ps-other a { background: #f0fdf4; color: #166534; border-color: #bbf7d0; }
.ps-links.ps-other a:hover { background: #dcfce7; border-color: #86efac; color: #14532d; }
.ps-links.ps-samsung a { background: #eff6ff; color: #1d4ed8; border-color: #bfdbfe; }
.ps-links.ps-samsung a:hover { background: #dbeafe; border-color: #93c5fd; color: #1e40af; }
.ps-sub { margin-top: 0.5rem; padding-left: 0; }
.ps-sub summary {
  list-style: none; font-size: 0.875rem; font-weight: 500; color: #64748b; cursor: pointer;
  padding: 0.35rem 0; border-bottom: 1px solid #f1f5f9;
}
.ps-sub summary::-webkit-details-marker { display: none; }
.ps-sub .ps-links { margin-top: 0.5rem; margin-bottom: 0.5rem; }
</style>

<!-- 1. LeetCode (top) -->
<section class="ps-section">
  <h2 class="ps-title">LeetCode</h2>
  <div class="ps-links ps-leet">
    <a href="{{ site.baseurl }}/ps/LEETCODE/EASY/">Easy</a>
    <a href="{{ site.baseurl }}/ps/LEETCODE/MEDIUM/">Medium</a>
    <a href="{{ site.baseurl }}/ps/LEETCODE/HARD/">Hard</a>
  </div>
</section>

<!-- 2. Codeforces, BOJ -->
<section class="ps-section">
  <h2 class="ps-title">Codeforces &amp; BOJ</h2>
  <div class="ps-links ps-other">
    <a href="{{ site.baseurl }}/ps/COFO/coforound/">Codeforces Round</a>
    <a href="{{ site.baseurl }}/ps/COFO/cofoeach/">Codeforces 1000–1400</a>
    <a href="{{ site.baseurl }}/ps/BOJ/">BOJ</a>
  </div>
</section>

<!-- 3. Samsung (bottom) -->
<section class="ps-section">
  <h2 class="ps-title">Samsung Coding Test</h2>
  <details class="ps-sub">
    <summary>Advanced (Type A)</summary>
    <div class="ps-links ps-samsung">
      <a href="{{ site.baseurl }}/ps/JONGMAN/">Book: Algorithm Problem Solving Strategy (Jongman)</a>
      <a href="{{ site.baseurl }}/ps/FAILNOTE/">Fail Note</a>
    </div>
  </details>
  <details class="ps-sub">
    <summary>Professional (Type B)</summary>
    <div class="ps-links ps-samsung">
      <a href="{{ site.baseurl }}/ps/PRO/">Basic Data Structure</a>
      <a href="{{ site.baseurl }}/ps/USACO/">USACO Silver</a>
    </div>
  </details>
</section>
