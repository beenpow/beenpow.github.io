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
header-img: "https://imagescdn.gettyimagesbank.com/500/19/449/519/0/1136292189.jpg"
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
