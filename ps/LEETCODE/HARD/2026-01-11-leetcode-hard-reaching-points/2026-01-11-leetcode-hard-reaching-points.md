---
layout: post
title : "Leetcode::problem reaching points"
subtitle: "Leetcode ps hard"
type: "Leetcode hard"
hard: true
ps: true
leetcode: true
text: true
author: "beenpow"
post-header: true
header-img: ""
order: 1
date: "2026-01-11"
---

# Leetcode::reaching points
- [Link : Leetcode:reaching points](https://leetcode.com/problems/reaching-points)
- Solved, algorithm 120
- level : hard

# Problem Description
- Given four integers sx, sy, tx and ty, return true if it is possible to convert the point (sx, sy) to the point (tx, ty) through some operations, or false otherwise.
- The allowed operation on some point (x, y) is to convert it to either (x, x + y) or (x + y, y).

# How to solve
- I figured the specific form of points.
    - tx = a * sx + b * sy
    - ty = c * sx + d * sy
- I tried to find a matrix between those four numbers, but it had no specific formula after all.
- Instead, the Editorial suggests a interesting way.
- I tried to find from (sx, sy) to (tx, ty), but the Edit suggests find from (tx, ty) to (sx, sy).
- Let's say (sx and sy) is the root.
- If we starts from the root, it becomes complete binary tree, so there are so many children.
- But if we starts from the children, there is only one way to the parent.
    - When tx >= ty, it's parent should be (tx - ty, ty).
- However it takes so much time to naively keep going up from a node to it's parent.
- If we use modulo operation, we can compress several same steps in O(1).
- In a nutshell, this problem seems great to think about several possible ways to solve the problem and choose which can be solved in a given time complexity.

# Big O (Time, Space)
- TIME : O(log(max(tx, ty)))
- SPACE : O(1)

# Code

```cpp
class Solution {
public:
    bool reachingPoints(int sx, int sy, int tx, int ty) {
        while(tx >= sx && ty >= sy) {
            if (tx > ty) {
                if (ty > sy) tx = tx % ty;
                else return (tx - sx) % ty == 0;
            }
            else {
                if (tx > sx) ty = ty % tx;
                else return (ty - sy) % tx == 0;
            }
        }
        return (tx == sx && ty == sy);
    }
};
```