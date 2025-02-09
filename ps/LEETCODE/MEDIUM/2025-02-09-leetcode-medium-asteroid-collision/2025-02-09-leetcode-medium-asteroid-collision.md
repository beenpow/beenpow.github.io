---
layout: post
title : "Leetcode::problem asteroid collision"
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
date: "2025-02-09"
---

# Leetcode::asteroid collision
- [Link : Leetcode:asteroid collision](https://leetcode.com/problems/asteroid-collision/description/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, 5 15 20 40 3
- level : medium

# point
- We are given an array asteroids of integers representing asteroids in a row.
- Here's how they work when two asteroids meet.
  - The smaller one will explore
	- If both are the same size, both will explode.
	- Two asteroids moving in the same direction will never meet.

# Design
- At a first glimpse, I couldn't come up with the idea of the 'moving forever left' or 'moving forever right' asteroids.
- This is problem is great to think about a few techniques.
 - I've tried to pattern match with such techniques like, moving window, maximum valued dp, etc.
- Anyway, to solve this problem, we maintain 'stack' as we iterathe the given array.
- While the iteration, whenever we meet positive value, we stack it.
  - Because I made the code to iterate the array from left to right. (If not, we gotta stack the negative values.)
- If the value is negative, now we need to pause to think how to handle the collision.
  - Now we have a stack that has
	  - 1. Only negative values
	  - 2. Only positive values
		- 3. Have two sections of (Negative values section)(Positive values section)
  - So, if the current negative value is 'x',
	  - for the case of 1, we stack the x
		- for the case of 2, we compare from the back of the stack wtth 'x'
		- for the case of 3, we compare from the back of the stack with 'x'
- Handling the 'comparision' part is obvious as it is described on the problem.

# Big O(time)
- TIME : O(N)
- SPACE : O(N)

# Code

```cpp
class Solution {
public:
    vector<int> asteroidCollision(vector<int>& ast) {
        vector<int> stk;
        for (auto x : ast) {
            if (x < 0) {
                if (stk.empty() || stk.back() < 0) {
                    stk.push_back(x);
                } else {
                    while (!stk.empty() && stk.back() > 0 && stk.back() < -x) stk.pop_back();
                    // stk.back() < -x
                    if (stk.empty() || stk.back() < 0) stk.push_back(x);
                    else {
                        if (stk.back() == -x) stk.pop_back();
                        else {
                            // stk.back() > -x
                            // do nothing
                        }
                    }
                }
            } else {
                stk.push_back(x);
            }
        }
        return stk;
    }
};
```
