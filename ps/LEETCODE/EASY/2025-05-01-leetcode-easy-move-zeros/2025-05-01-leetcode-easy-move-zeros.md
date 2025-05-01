---
layout: post
title : "Leetcode::problem move zeros"
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
date: "2025-05-01"
---

# Leetcode::move zeros
- [Link : Leetcode:move zeros](https://leetcode.com/problems/move-zeroes/description/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, 5 5 10 0 30
- level : easy

# point
- Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.
- Note that you must do this in-place without making a copy of the array.
- Follow up : Could you minimize the total number of operations done?

# Design
- Here's the simple requirements from the problem.
    - In-place
    - Using minimum number of operations
- There are many ways to solve this problem if we are allowed to use additional memory.
    - For example, if we utilize a stack or a vector, we stack non-zero numbers as it's order and store 0's in the end.
- Let's get back to the problem's requirements.
- Since we have to operate in-place, we can only store a value in a index or swap values.
- As a naive way, 
    - We check from the back of the given array.
    - If we find a zero value, we swap values behind of this until the end or a zero.
- But it takes O(N^2) time.
- As for optimal approach,
    - We use 'nonZeroIndex', and it only points the lastly moved non-zero index.
        - nonZeroIndex starts as '0'.
    - While we iterate the given array, 
        - If we find a non-zero value, we swap this value with the value of nonZeroIndex.
        - Then increase 1 of the nonZeroIndex.
        - Because nonZeroIndex always points the next index of confirmed non-zero value.
- It seems using optimal approach is easy technique but hard to come up with.

# Big O(time)
- naive
    - TIME : O(N^2)
    - SPACE : O(1)
- sub-optimal
    - TIME : O(N)
    - SPACE : O(1)
- optimal
    - TIME : O(N)
    - SPACE : O(1)

# Code

## navie swap

```cpp
class Solution {
public:
    void moveZeroes(vector<int>& nums) {
        int j = nums.size() - 1;
        while(j >= 0) {
            if (nums[j] == 0) {
                for(int i = j; i < nums.size() - 1; i++) {
                    swap(nums[i], nums[i+1]);
                }
                j--;
            } else {
                j--;
            }
        }
    }
};
```

## sub-optimal

```cpp
class Solution {
public:
    void moveZeroes(vector<int>& nums) {
        int lastNonZeroIndex = 0;
        for(int i = 0; i < nums.size(); i++) {
            if (nums[i] != 0) {
                nums[lastNonZeroIndex++] = nums[i];
            }
        }
        for(int i = lastNonZeroIndex; i < nums.size(); i++) {
            nums[i] = 0;
        }
    }
};
```

## optimal

```cpp
class Solution {
public:
    void moveZeroes(vector<int>& nums) {
        int lastNonZeroIndex = 0;
        for(int i = 0; i < nums.size(); i++) {
            if (nums[i] != 0) {
                swap(nums[lastNonZeroIndex++], nums[i]);
            }
        }
    }
};
```