---
layout: post
title : "Leetcode::problem fruit into baskets"
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
date: "2025-05-05"
---

# Leetcode::fruit into baskets
- [Link : Leetcode:fruit into baskets](https://leetcode.com/problems/fruit-into-baskets/description/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, 2 5 5 0 13
- level : medium

# point
- You are visiting a farm that has a single row of fruit trees arranged from left to right.
- You only have two baskets, and each basket can hold one type of fruits.
- Given the integer array fruits, return the maximum number of fruits you can pick.

# Design
- The thing that we have to notice first is that all trees have to consecutive.
- From this fact, we can come up with the idea of using sliding window.
- If we use a map, we can check the size of types.
- If the type size is over 2, we move the left side of the window.

# Big O(time)
- TIME : O(N)
- SPACE : O(1)

# Code

```cpp
class Solution {
public:
    int totalFruit(vector<int>& fruits) {
        unordered_map<int,int> baskets;
        int ans = 0, cur = 0, le = 0;

        for (int ri = 0; ri < fruits.size(); ri++) {
            cur++;
            baskets[fruits[ri]]++;
            while (baskets.size() > 2) {
                baskets[fruits[le]]--;
                if (baskets[fruits[le]] == 0) baskets.erase(fruits[le]);
                le++;
                cur--;
            }
            ans = max(ans, cur);
        }
        return ans;
    }
};
```