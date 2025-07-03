---
layout: post
title : "Leetcode::problem find subsequence of length k with the largest sum"
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
date: "2025-07-03"
---

# Leetcode::find subsequence of length k with the largest sum
- [Link : Leetcode:find subsequence of length k with the largest sum](https://leetcode.com/problems/find-subsequence-of-length-k-with-the-largest-sum/description/)
- Solved, 5 15 10 5 20
- level : easy

# Problem Description
- You are given an integer array nums and an integer k. You want to find a subsequence of nums of length k that has the largest sum.
- Return any such subsequence as an integer array of length k.
- A subsequence is an array that can be derived from another array by deleting some or no elements without changing the order of the remaining elements.

# How to solve
- We can use a priority queue to find the largest k elements in the array.
- Then we can sort the elements by their index to get the subsequence.
- We can use a vector to store the subsequence.
- Important thing to rememebr is that we are able to use lambda function to sort the elements by their index.
    - By doing this, we don't need to create a new function to sort the elements by their index.

# Big O (Time, Space)
- Time : O(nlogn)
- Space : O(n)

# Code

```cpp
class Solution {
public:

    vector<int> maxSubsequence(vector<int>& nums, int k) {
        int n = nums.size();
        
        vector<pair<int,int>> vp;
        for(int i = 0; i < nums.size(); i++) vp.push_back({nums[i], i});

        sort(vp.begin(), vp.end(), [](auto x1, auto x2){return x1.first > x2.first;});
        sort(vp.begin(), vp.begin() + k, [](auto x1, auto x2){return x1.second < x2.second;});


        vector<int> ans;

        for(int i = 0; i < k; i++) ans.push_back(vp[i].first);

        return ans;
    }
};
```