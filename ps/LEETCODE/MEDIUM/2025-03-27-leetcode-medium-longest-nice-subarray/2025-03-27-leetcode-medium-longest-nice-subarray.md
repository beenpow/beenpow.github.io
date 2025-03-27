---
layout: post
title : "Leetcode::problem longest nice subarray"
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
date: "2025-03-27"
---

# Leetcode::longest nice subarray
- [Link : Leetcode:longest nice subarray](https://leetcode.com/problems/longest-nice-subarray/submissions/1588022357/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, algorithm 70
- level : medium

# point
- You are given an array nums consisting of positive integers.
- We call a subarray of nums nice if the bitwise AND of every pair of elements that are in different positions in the subarray is equal to 0.
- Retuen the length of the longest nice subarray.

# Design
- We use sliding window for this problem.
- Even if we need to check all the pairs in a range, we can make sure it is a nice subarray by 'AND'ing for all values in a subarray.
- I used checking all the bits seperately, but that was kind of brute forcing.
- We can simply check by just use '&'.
- Since there can be one '1' at a certian position, we just need to do OR and AND operations.
  - We use AND for checking.
  - We use OR for adding the numebr into the checked bits.

# Big O(time)
- TIME : O(N)
- SPACE : O(N)

# Code

```cpp
class Solution {
    public:
    int longestNiceSubarray(vector<int>&nums){
        int n = nums.size();
        int le = 0, ret = 1;
        int uBits = nums[0];
        for(int ri = 1; ri < n; ri++){
            while(le < ri && (uBits & nums[ri])){
                uBits ^= nums[le++];
            }
            uBits |= nums[ri];
            ret = max(ret, ri - le + 1);
        }
        return ret;
    }
};
```