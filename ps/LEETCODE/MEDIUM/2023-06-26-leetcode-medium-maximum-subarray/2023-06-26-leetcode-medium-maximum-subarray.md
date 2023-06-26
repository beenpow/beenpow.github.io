---
layout: post
title : "Leetcode::problem(53) Maximum Subarray"
subtitle: "Leetcode ps medium"
type: "Leetcode medium"
medium: true
ps: true
leetcode: true
text: true
author: "beenpow"
post-header: true
header-img: "https://d144mzi0q5mijx.cloudfront.net/img/J/U/Just-Do-It.png"
order: 1
date: "2023-06-26"
---

# Leetcode:: Maximum Subarray
- [Link : Leetcode::Maximum Subarray](https://leetcode.com/problems/maximum-subarray/description/?envType=study-plan-v2&envId=apple-spring-23-high-frequency)

- level : medium

# point
- Find the maxium subarray with the largest sum

# Design
- Can we solve this problem with 'Windowing' ? Nope
  - Here's a counter example of why we can't use the method
  - [1 4 7 -3 2]
  - The maxium subarray will be [1 4 7 -3 2].
  - But by using 'windowing' method, the algorithm will stop summing when it meets '-3', because adding '-3' makes the sum less
- We can solve this problem by using simple but powerful strategy
  - While looing the nums,
    - We either add current x to the previous sum or take this x as a new sum
      - The meaning of adding current x to the previous sum is this x will be the continous member of the subarray
      - The meaning of taking current x as a new sum is that we don't need previous subarray anymore since x is greater than sum + x

# Big O(time)
- O(N)

# Code

```cpp
class Solution {
public:
    int maxSubArray(vector<int>& nums) {
        int mxSum = -1e4 * 1e5, sum = 0;
        for(auto x : nums) {
            if (x > sum + x) sum = x;
            else sum += x;
            mxSum = max(mxSum, sum);
        }
        return mxSum;
    }
};
```
