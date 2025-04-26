---
layout: post
title : "Leetcode::problem contains duplicate 2"
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
date: "2025-04-26"
---

# Leetcode::contains duplicate 2
- [Link : Leetcode:contains duplicate 2](https://leetcode.com/problems/contains-duplicate-ii/description/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, 2 2 2 0 0
- level : easy

# point
- Given an integer array nums and an integer k, return true if there are two distinct indices i and j in the array such that nums[i] == nums[j] and abs(i - j) <= k.

# Design
- We can use multiset to check the condition.
- However, if we use an unordered map wisely, we can solve the problem with this.
- If the given array is (1, 1, 1), do we need to check all three paris?
  - (0, 1), (0, 2), (1, 2) ?
- The answer is no.
- Because we only need to check the small distance between same numbers, we only need to check (0, 1) and (1, 2).
- This fact enables us to stack the last index for the same value.
- So, we only need an unordered map.

# Big O(time)
- TIME : O(N)
- SPACE : O(N)

# Code

```cpp
class Solution {
public:
    bool containsNearbyDuplicate(vector<int>& nums, int k) {
        unordered_map<int,int> mp;
        for(int i = 0; i < nums.size(); i++) {
            if (mp.find(nums[i]) != mp.end()) {
                int prev = mp[nums[i]];
                if (i - prev <= k) return true;
            }
            mp[nums[i]] = i;
        }
        return false;
    }
};
```