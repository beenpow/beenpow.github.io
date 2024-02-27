---
layout: post
title : "Leetcode::problem(875) Koko Eating Bananas"
subtitle: "Leetcode ps medium"
type: "Leetcode medium"
medium: true
ps: true
leetcode: true
text: true
author: "beenpow"
post-header: true
header-img: "https://www.spotebi.com/wp-content/uploads/2019/01/one-day-day-one-workout-motivation-spotebi.jpg"
order: 1
date: "2023-09-18"
---

# Leetcode::Koko Eating Bananas
- [Link : Leetcode::Koko Eating Bananas](https://leetcode.com/problems/koko-eating-bananas/?envType=study-plan-v2&envId=google-spring-23-high-frequency)

- level : medium

# point
- Return the minimum integer k such that she can eat all the bananas within h hours

# Design
- It was easy binary search problem
- Seeing it as a binary search problem was the real problem
- Once you know that, it's typical bs problem

# Big O(time)
- O(n log m)
	  - n = piles.length
		- m = piles[i]

# Code

```cpp
typedef long long ll;
class Solution {
public:
    ll takingHour(vector<int> piles, int k) {
        ll ret = 0;
        for(auto x : piles) {
            ret += x / k;
            ret += (x % k > 0);
        }
        return ret;
    }
    ll bs(vector<int> piles, ll h, ll lo, ll hi) {
        ll ret = hi;
        while(lo <= hi) {
            ll mi = (lo + hi) / 2;
            if (takingHour(piles, mi) <= h) {
                hi = mi - 1;
                ret = min(ret, mi);
            }
            else    
                lo = mi + 1;
        }
        return ret;
    }
    int minEatingSpeed(vector<int>& piles, int h) {
        ll ret = bs(piles, h, 1, *max_element(piles.begin(), piles.end()));
        return ret;
    }
};
```
