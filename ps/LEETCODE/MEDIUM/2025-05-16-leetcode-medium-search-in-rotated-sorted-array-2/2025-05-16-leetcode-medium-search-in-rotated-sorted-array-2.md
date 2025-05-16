---
layout: post
title : "Leetcode::problem search in rotated sorted array 2"
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
date: "2025-05-16"
---

# Leetcode::search in rotated sorted array 2
- [Link : Leetcode:search in rotated sorted array 2](https://leetcode.com/problems/search-in-rotated-sorted-array-ii/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, algorithm 70
- level : medium

# point
- Sorted non-decreasing array is given, but it is rotated.
- Return true if target is in the array, otherwise return false.
- You must decrease the overall operation steps as much as possible.

# Design
- It's definitely a binary search problem.
- But the problem is that the array is rotated.
- So we know that there can be two sections that are sorted.
- Since we don't know which point is the pivot, we need to check both sides.
- Checking both sides can be done by simple approach like below.
    - If num[mid] is equal to target, return true.
    - If nums[low] == nums[mid],
        - We can't determine which side is sorted.
        - So we just move low pointer one step forward.
    - If nums[low] < nums[mid],
        - Let's say we have [4,5,6,7,0,1,2], then mid can be 5, 6, 7.
        - It means that the left side is sorted.
        - So we can check if the target is in the left side (low ~ mid).
        - If the target is not in the left side, we move the low pointer to mid + 1.
    - If nums[low] > nums[mid],
        - Let's say we have [4,5,6,7,0,1,2], then mid can be 0, 1, 2.
        - It means that the right side is sorted.
        - So we can check if the target is in the right side (mid ~ high).
        - If the target is not in the right side, we move the high pointer to mid - 1.
    - We keep doing this until low is greater than high.
    - If nums[low] is equal to target, we return true.
    - Otherwise, we return false.

# Big O(time)

- TIME :
    - O(logN)
    - O(N) in worst case where all elements are the same.
- SPACE : 
    - O(1)
# Code

```cpp
class Solution {
public:
    bool search(vector<int>& nums, int target) {
        int n = nums.size();
        int lo = 0, hi = n - 1;
        while(lo < hi) {
            int mid = (lo + hi) >> 1;
            if (nums[mid] == target) return true;

            if (nums[lo] == nums[mid]) {
                lo++;
                continue;
            }

            if (nums[lo] < nums[mid]) {
                if (nums[lo] <= target && target < nums[mid]) hi = mid - 1;
                else lo = mid + 1;
            }
            else {
                if (nums[mid] < target && target < nums[lo]) lo = mid + 1;
                else hi = mid - 1;
            }
        }
        return nums[lo] == target;
    }
};
```