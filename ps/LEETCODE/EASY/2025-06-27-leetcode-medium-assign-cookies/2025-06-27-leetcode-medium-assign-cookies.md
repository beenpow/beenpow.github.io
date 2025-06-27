---
layout: post
title : "Leetcode::problem assign cookies"
subtitle: "Leetcode ps easy"
type: "Leetcode easy"
easy: true
ps: true
leetcode: true
text: true
author: "beenpow"
post-header: true
header-img: ""
order: 1
date: "2025-06-27"
---

# Leetcode::assign cookies
- [Link : Leetcode:assign cookies](https://leetcode.com/problems/assign-cookies)
- Solved, 3 3 3 2 0
- level : easy

# Problem Description
- Assume you are an awesome parent and want to give your children some cookies.
- But, you should give each child at most one cookie.
- Each child i has a greed factor g[i], which is the minimum size of a cookie that the child will be content with;
- and each cookie j has a size s[j].
- If s[j] >= g[i], we can assign the cookie j to the child i, and the child i will be content.
- Your goal is to maximize the number of your content children and output the maximum number.

# How to solve
- The point of solving this problem is to give the cookie to the child with the smallest greed factor.
- So, we can sort both g and s.
- Then we can use two pointers to find the maximum number of content children.

# Big O (Time, Space)
- N : children, M : cookies
- TIME : O(NlogN + MlogM)
- SPACE : O(1)

# Code

```cpp
class Solution {
public:
    int findContentChildren(vector<int>& g, vector<int>& s) {
        int n = g.size(), m = s.size();
        sort(g.begin(), g.end());
        sort(s.begin(), s.end());

        int ans = 0;
        int j = 0;
        for(int i = 0; i < n; i++){
            while (j < m &&g[i] > s[j]){
                j++;
            }
            if (j < m && g[i] <= s[j]) {
                ans++;
                j++;
            }
        }
        return ans;
    }
};
```