---
layout: post
title : "Leetcode::problem(42) Trapping Rain Water"
subtitle: "Leetcode ps hard"
type: "Leetcod hard"
hard: true
ps: true
leetcode: true
text: true
author: "beenpow"
post-header: true
header-img: "https://cdn.mos.cms.futurecdn.net/BfemybeKVXCf9pgX9WCxsc.jpg"
order: 1
date: "2023-07-05"
---

# Leetcode::Trapping Rain Water
- [Link : Leetcode::Trapping Rain Water](https://leetcode.com/problems/trapping-rain-water/description/?envType=study-plan-v2&envId=apple-spring-23-high-frequency)

- level : hard

# point

# Design


# Big O(time)

# Code

```cpp
class Solution {
public:
    typedef long long ll;
    int trap(vector<int>& height) {
        int n = (int)height.size();
        vector<pair<int,int> > h2(n);
        vector<int> top(n, 0);

        for(int i = 0; i < n; i++) h2[i] = {height[i], i};

        sort(h2.rbegin(), h2.rend());

        ll sum = 0, le = -1, ri = -1;
        for (int i = 0; i < n; i++) {
            int id = h2[i].second, h = h2[i].first;
            if (le == -1) le = ri = id, top[id] = h;
            else {
                if (id < le || id > ri) {
                    if (id < le) {
                        for(int j = id; j < le; j++) top[j] = h;
                        le = id;
                    } else {
                        for(int j = ri + 1; j <= id; j++) top[j] = h;
                        ri = id;
                    }
                } else {
                    // do nothing
                }
            }
        }
        for(int i = 0; i < n; i++) {
            sum += (top[i] - height[i]);
        }
        return sum;
    }
};
```
