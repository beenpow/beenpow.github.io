---
layout: post
title : "Leetcode::problem taking maximum energy from the mystic dungeon"
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
date: "2025-10-24"
---

# Leetcode::taking maximum energy from the mystic dungeon
- [Link : Leetcode:taking maximum energy from the mystic dungeon]()
- Solved, 3 3 3 0 0
- level : medium

# Problem Description
- Array energy and integer k are given.
- Return the maximum possible energy you can gain.

# How to solve
- If we set a starting point, we can jump k steps forward.
- We can calculate all the possible ways from the back k numbers.
- From those numbers, we jump to the previous point.
- While jumping, we find the maximum energy we can gain.

# Big O (Time, Space)
- TIME : O(N)
- SPACE : O(1)

# Code

```cpp
class Solution {
public:
    int maximumEnergy(vector<int>& energy, int k) {
        int ans = -10000001;
        int n = energy.size();
        for (int i = 0; i < k; i++) {
            int st = n - i - 1;
            int sum = 0;
            while(st >= 0) {
                sum += energy[st];
                ans = max(ans, sum);
                st -= k;
            }
        }
        return ans;
    }
};
```