---
layout: post
title : "Leetcode::problem bulb switcher"
subtitle: "Leetcode ps medium"
type: "Leetcode medium"
medium: true
ps: true
leetcode: true
text: true
author: "beenpow"
post-header: true
header-img: ""
order: 1
date: "2025-04-27"
---

# Leetcode::bulb switcher
- [Link : Leetcode:bulb switcher](https://leetcode.com/problems/bulb-switcher/description/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, algorithm 60
- level : medium

# point
- Return the number of bulbs that are on after n rounds.
    - Initially, all n bulbs are off.
    - For the i-th round, toggle every i bulb.

# Design
- By simulation, we can find out that only perfect sqauares can be the ones that are turned on after all rounds.
- It's noticeable that a number can be turned on if it's number of factors is odd number.
- For example, 
    - For 6, it has factors as {1, 2, 3, 6}.
        - Since it has even number of factors, it will be turned on by toggling even number of times.
    - For 9, it has factors as {1, 3, 9}.
        - The 9-th bulb will be stayed as on.
- By this test, we notice that only perfect squares are the ones we are looking for.
- Now, let's think about why only perfect squares.
- We know that a factor has a another factor as a pair to be existed.
- For 12, it has factors like, {1, 2, 3, 4, 6, 12}.
- To make 12, these factors can be paired as {1, 12}, {2, 6}, {3, 4}.
- However, there are only odd number of factors for perfect squares.
- For 16, {1, 2, 4, 8, 16}.
- To make 16, {1, 16}, {2, 8}, {4, 4}.
- Since 4 and 4 are the same numbers, this fact yields this bulb to be turned on.
- With this reason, we only need to count the number of perfect squares.


# Big O(time)
- TIME : O(1)
- SPACE : O(1)

# Code

```cpp
class Solution {
public:
    int bulbSwitch(int n) {
        return sqrt(n);
    }
};
```