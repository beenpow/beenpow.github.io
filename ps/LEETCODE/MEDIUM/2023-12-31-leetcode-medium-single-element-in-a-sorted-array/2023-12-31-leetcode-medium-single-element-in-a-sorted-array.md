---
layout: post
title : "Leetcode::problem(540) Single Element in a Sorted Array"
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
date: "2023-12-31"
---

# Leetcode::Single Element in a Sorted Array
- [Link : Leetcode::Single Element in a Sorted Array](https://leetcode.com/problems/single-element-in-a-sorted-array/description/)

- level : medium

# point
- You are given a sorted array consisting of only integers where every element appears exactly twice, except for one element which appears exactly once.
- Return the single element that appears only once

# Design
- We can solve this problem with binary search, since we can notice where the target number exists either left half or right half
- The logic to notice where the target is like below
  - Let's say we are on even number of index
  - If there's no target number on the left side, the value of the index should be same with the value of the index + 1
	- If there's the target number on the left side, the value of the index should be different with the value of the index + 1
- With above logic, we can use binary search.
- But the tricky part of this problem is thinking about margin when index is 0 or (size -1)
	- To handle this margin, I added some exceptional case statement on the binary search function

# Big O(time)
- O(logN)

# Code

```cpp
class Solution {
public:
    int n;
    int bs(vector<int> nums) {
        int retIdx = -1;
        int lo = 0, hi = nums.size()-1;
        while(lo < hi) {
            int mi = (lo + hi) / 2;
            if (mi -1 < 0 || mi + 1 >= nums.size()) {
                retIdx = mi;
                break;
            } else {
                if (nums[mi-1] != nums[mi] && nums[mi] != nums[mi+1]) {
                    retIdx = mi;
                    break;
                }
                if (mi%2 == 0) {
                    if (nums[mi-1] != nums[mi]) {
                        lo = mi + 1;
                    } else {
                        hi = mi - 1;
                    }
                } else {
                    if (nums[mi-1] != nums[mi]) {
                        hi = mi - 1;
                    } else {
                        lo = mi + 1;
                    }
                }
            }
        }
        cout << retIdx << '\n';
        if (retIdx == -1) retIdx = hi;
        return nums[retIdx];
    }
    int singleNonDuplicate(vector<int>& nums) {
        n = nums.size();
        int ret = bs(nums);
        return ret;
    }
};
```
