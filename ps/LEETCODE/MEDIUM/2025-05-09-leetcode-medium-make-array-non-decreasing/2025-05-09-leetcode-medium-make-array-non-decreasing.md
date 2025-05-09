---
layout: post
title : "Leetcode::problem make array non decreasing"
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
date: "2025-05-09"
---

# Leetcode::make array non decreasing
- [Link : Leetcode:make array non decreasing](https://leetcode.com/problems/make-array-non-decreasing/description/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, 5 15 10 0 0
- level : medium

# point
- You are given an integer array nums.
- In one operation, you can select a subarray and replace it with a single element equal to its maximum value.
- Return the maximum possible size of the array after performing zero or more operations such that the resulting array is non-decreasing.

# Design
- It's unusual type of problem when we first see it.
- Usually, we deal with tops(a(i-1) < a(i) < a(i+1)) and bottoms(a(i-1) > a(i) < a(i+1)) with this kind of problems.
- However, the operation seems bit different.
- Because we can not just skip number we don't need, it makes us to approach differently.
- To solve this problem.
    - We find the first top, then we count only non-decreasing numbers from this point.
        - The reason why we can do this is other number that are not selected can be deleted by operations.
        - Let's consider an example of {2, 4, 7, 3, 5, 7, 9}.
        - The first top is '7'.
        - From there we count only non-decreasing numbers.
        - So we get {7, 7, 9}.
    - Then we add numbers before the first top to the answer.
        - Because numbers before the first top are non-decreasing.
    - As a result, we get {2, 4, 7, 7, 9}.

# Big O(time)
- TIME : O(N)
- SPACE : O(1)

# Code

```cpp
class Solution {
public:
    int maximumPossibleSize(vector<int>& nums) {
        int n = nums.size();

        int firstDropPoint = -1;
        for (int i = 0; i < n - 1; i++) {
            if (nums[i] > nums[i+1]) {
                firstDropPoint = i;
                break;
            }   
        }
        if (firstDropPoint == -1) return n;

        int ans = firstDropPoint + 1, prev = nums[firstDropPoint];

        // check only hills.
        for (int i = firstDropPoint + 1; i < n; i++) {
            if (nums[i] >= prev) {
                prev = nums[i];
                ans++;
            }
        }

        return ans;
    }
};
```