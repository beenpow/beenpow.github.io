---
layout: post
title : "Leetcode::problem kids with the greatest number of candies"
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
date: "2025-03-23"
---

# Leetcode::kids with the greatest number of candies
- [Link : Leetcode:kids with the greatest number of candies](https://leetcode.com/problems/kids-with-the-greatest-number-of-candies/description/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, 1 2 3 0 0
- level : easy

# point
- There are n kids with candies.
- Return a boolean array result of length n, where result[i] is true if, after giving i-th kid all the extraCandies, they will have the greatest number of candies among all the kids, or false otherwise.

# Design
- We check if a kid's candies can be greater than the maximum candies after adding extra candies.

# Big O(time)
- TIME : O(N)
- SPACE : O(1)
# Code

```cpp
class Solution {
public:
    vector<bool> kidsWithCandies(vector<int>& candies, int extraCandies) {
        int mx = *max_element(candies.begin(), candies.end());
        
        vector<bool> ret(candies.size(), false);
        for(int i = 0; i < candies.size(); i++) if (candies[i] + extraCandies >= mx) {
            ret[i] = true;
        }
        return ret;
    }
};
```