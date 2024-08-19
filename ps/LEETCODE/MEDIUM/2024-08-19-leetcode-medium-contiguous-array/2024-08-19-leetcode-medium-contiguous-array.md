---
layout: post
title : "Leetcode::problem(525) Contiguous Array"
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
date: "2024-08-19"
---

# Leetcode::Contiguous Array
- [Link : Leetcode::Contiguous Array](https://leetcode.com/problems/contiguous-array/description/)

- level : medium
- fail to come up with the idea

# point
- Given a binary array nums, return the maximum length of a contiguous subarray with an equal number of 0 and 1.

# Design
- With two pointer method, it's hard to determine how to move the end point to the next.
- So, here's how editorial way.
- It's nice to know this method.
- We use a value called 'counter'.
  - It is increased 1 when the current value is '1'
	- It is decreased 1 when the current value is '0'
- While we iterate the given nums,
	- We keep track of this 'counter' as we increase/decrease 1.
	- Let's say we have x-y dimension, and x dimension represents index and y represents 'counter'.
	- Then we can have a graph if we connect dots.
	- On the graph, we see each 'y' value which is counter.
	- If there are several indices that has same counter, we get the longest length out of it.
	- This length means that there are same number of '1's and '0's on the range.
	- So we get the longest length as we iterate the given nums.

# Big O(time)
- TIME : O(N)
- MEMORY : O(N)

# Code

```cpp
class Solution {
public:
    int findMaxLength(vector<int>& nums) {
        map<int, int> firstFound;
        firstFound[0] = -1;

        int count = 0, ans = 0;
        for (int i = 0; i < nums.size(); i++) {
            auto x = nums[i];

            if (x == 0) count--;
            else count++;

            if (firstFound.find(count) == firstFound.end()) firstFound[count] = i;
            else ans = max(ans, (i - firstFound[count]));
        }
        return ans;
    }
};
```
