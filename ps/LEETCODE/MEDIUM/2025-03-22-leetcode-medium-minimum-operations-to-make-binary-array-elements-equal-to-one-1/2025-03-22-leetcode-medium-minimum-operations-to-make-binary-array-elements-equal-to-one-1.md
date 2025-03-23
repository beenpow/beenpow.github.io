---
layout: post
title : "Leetcode::problem minimum operations to make binary array elements equal to one 1"
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
date: "2025-03-22"
---

# Leetcode::minimum operations to make binary array elements equal to one 1
- [Link : Leetcode:minimum operations to make binary array elements equal to one 1](https://leetcode.com/problems/minimum-operations-to-make-binary-array-elements-equal-to-one-i/description/)
- Solved, 2 3 3 0 0
- level : medium

# point
- You are given a binary array nums.
- Return the minimum number of operations required to make all elements in nums equal to 1.

# Design
- When we iterate through the given nums, if we flip three values in a row if the current value is '0', is this making the result as minimum?
- Yes it is.
  - Why is it?
  - If we maintain '0' as it is, it can never be changed when we get to next value.
  - So, it has to be changed when it's time to be considered while we iterating.
- So, we simply need to change three values if nums[i] is equal to 0.
- And if the last two values are not 0, it means it is impossible to make all values to '1'.


# Big O(time)
- TIME : O(N)
- SPACE : O(1)

# Code

```cpp
class Solution {
public:
    int minOperations(vector<int>& nums) {
        int n = nums.size();
        int cnt = 0;
        for(int i = 0; i < n - 2;i++){
            if (nums[i] == 0){
                cnt++;
                nums[i] = !nums[i];
                nums[i+1] = !nums[i+1];
                nums[i+2] = !nums[i+2];
            }
        }
        if(nums[n-2] == 0 || nums[n-1] == 0) return -1;
        return cnt;
    }
};
```