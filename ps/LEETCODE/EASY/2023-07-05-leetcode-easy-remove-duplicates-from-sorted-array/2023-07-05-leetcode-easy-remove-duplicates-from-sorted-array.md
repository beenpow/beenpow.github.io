---
layout: post
title : "Leetcode::problem(26) Remove Dumplicates from Sorted Array"
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
date: "2023-07-05"
---

# Leetcode::Remove Duplicates from Sorted Array
- [Link : Leetcode::Remove Duplicates from sorted array](https://leetcode.com/problems/remove-duplicates-from-sorted-array/description/?envType=study-plan-v2&envId=apple-spring-23-high-frequency)

- level : easy

# point
- Remove duplicates from sorted array

# Design
- We can easily achieve the goal by using 'unique' and 'erase function in the stl

# Big O(time)
- O(N)

# Code

```cpp
class Solution {
public:
    int removeDuplicates(vector<int>& nums) {
        nums.erase(unique(nums.begin(), nums.end()), nums.end());
        return nums.size();
    }
};
```
