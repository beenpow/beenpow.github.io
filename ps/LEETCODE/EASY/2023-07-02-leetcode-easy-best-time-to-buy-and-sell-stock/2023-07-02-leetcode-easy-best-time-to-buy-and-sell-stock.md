---
layout: post
title : "Leetcode::problem(121) Best Time to Buy and Sell stock"
subtitle: "Leetcode ps easy"
type: "Leetcode easy"
easy: true
ps: true
leetcode: true
text: true
author: "beenpow"
post-header: true
header-img: "https://www.spotebi.com/wp-content/uploads/2019/01/one-day-day-one-workout-motivation-spotebi.jpg"
order: 1
date: "2023-07-02"
---

# Leetcode:: Best time to buy and sell stock
- [Link : Leetcode::best time to buy and sell stock](https://leetcode.com/problems/best-time-to-buy-and-sell-stock/description/?envType=study-plan-v2&envId=apple-spring-23-high-frequency)

- level : easy

# point
- Find the best profit of selling a tock
  - You can either buy or sell(only if you bought) or do nothing on every point

# Design
- Since we iterate from left to right, all we need to do is maintain a smallest amount of the stock
  - That's the one we bought
- Then suppose we sell at every point


# Big O(time)
- O(N)

# Code

```cpp
class Solution {
public:
    int maxProfit(vector<int>& prices) {
        int mn = 1e5, ret = 0;
        for(auto x : prices) {
            mn = min(mn, x);
            ret = max(ret, x - mn);
        }
        return ret;
    }
};
```
