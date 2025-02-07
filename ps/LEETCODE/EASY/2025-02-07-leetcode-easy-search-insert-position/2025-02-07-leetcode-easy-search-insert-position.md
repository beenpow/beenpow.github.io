---
layout: post
title : "Leetcode::problem search insert position"
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
date: "2025-02-07"
---

# Leetcode::search insert position
- [Link : Leetcode:search insert position]()
- Solved, 2 2 5 5 5
- level : easy

# point
- Given a sorted array of distinct integers and a target value.
- Return the index if the target is found.
- If not, return the index where it would be if it were inserted in order.

# Design
- Since we have O(logN) time, we can come up with using binary search.
- The reason why we can approach the problem with bs is the given array is sorted.
- Now we implement binary search
- Then, check if the index is on the end of the given array.
- If the target value is larger than the last index of the given array, we should add one.

# Big O(time)
- TIME
  - O(logN)

# Code

```cpp
class Solution {
public:
    int searchInsert(vector<int>& nums, int target) {
        int lo = 0, hi = nums.size() - 1;
        while(lo < hi) {
            int mid = (lo + hi) / 2;
            if (nums[mid] < target) {
                lo = mid + 1;
            } else {
                hi = mid;
            }
        }
        if (lo == nums.size() - 1 && nums[lo] < target) lo++;
        return lo;
    }
};
```
