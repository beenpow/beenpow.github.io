---
layout: post
title : "Leetcode::problem check if array is sorted and rotated"
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
date: "2025-06-10"
---

# Leetcode::check if array is sorted and rotated
- [Link : Leetcode:check if array is sorted and rotated](https://leetcode.com/problems/check-if-array-is-sorted-and-rotated/description/)

- Solved, 5 5 10 5 1
- level : easy

# Problem Description
- Given an array nums, return true if the array was originally sorted in non-decreasing order, then rotated some number of positions (including 0). Otherwise, return false.

# How to solve
- I've used a method that finds the smallest element and its index.
- We can find the smallest element by iterating through the array.
- Then we check if the array is sorted from that index.
- There is a case that we need to handle carefully.
- If there are multiple smallest elements, those elements could be located after the largest element.
- So we check if those elements are all same with the first element.

# Big O (Time, Space)
- Time : O(n)
- Space : O(1)

# Code

```cpp
class Solution {
public:
    bool check(vector<int>& nums) {
        int st = 0;
        int stVal = 101;
        for(int i=0; i<nums.size();i++){
            if(nums[i] <= stVal){
                stVal = nums[i];
                st = i;
            }
        }
        int cnt = 1;
        int n = nums.size();
        int cur = st, nxt = (st+1)%n;
        while(cnt < n && nums[cur] <= nums[nxt]){
            cur = nxt;
            nxt = (nxt+1)%n;
            cnt++;
        }
        while(cnt < n && nums[nxt] == nums[st]) {
            nxt = (nxt + 1) % n;
            cnt++;
        }
        return cnt == n;
    }
};
```