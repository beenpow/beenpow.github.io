---
layout: post
title : "Leetcode::problem(31) Next Permutation"
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
date: "2024-08-22"
---

# Leetcode::Next Permutation
- [Link : Leetcode::Next Permutation](https://leetcode.com/problems/next-permutation/)

- level : medium
- took 43mins to solve

# point
- Given an array of integers nums, find the next permutation of nums.

# Design
- Here's how to solve the problem.

```txt
1. Find i, where 
    - nums[i-1] < nums[i].
    - nums[i] > nums [j] ( i < j )
    -> If there's no such 'i', sort the given nums in increasing order
    -> Or, skip below step 2.

2. Find k, where
    - d = num[i-1] < num[k] (i <= k)
    - d is smallet possibile

3. Re-order inplace
    - swap(num[i-1], num[k])
    - sort num[i ~ n] in increasing order
		- Since the numbers in the range(i+1, n) are in decreasing order, we can simply reverse it.
```

# Big O(time)
- TIME : O(N)
- SPACE : O(N)

# Code

```cpp
class Solution {
public:
    void nextPermutation(vector<int>& nums) {
        // step 1
        int nearPeak = -1;
        for(int i = nums.size() - 1; i > 0; i--) {
            if (nums[i-1] < nums[i]) {
                nearPeak = i-1;
                break;
            }
        }

        int k = 0;
        if (nearPeak != -1) {
            // step 2
            for(int i = nums.size() - 1; i > nearPeak; i--) {
                if (nums[i] > nums[nearPeak]) {
                    k = i;
                    break;
                }
            }
            // step 3
            swap(nums[nearPeak], nums[k]);
        }
        //sort(nums.begin() + nearPeak + 1, nums.end());
        for (int i = 0; nearPeak + 1 + i < nums.size() - 1 - i; i++) {
            swap(nums[nearPeak + 1 + i], nums[nums.size() - 1 - i]);
        }
    }
};
```
