---
layout: post
title : "Leetcode::problem(215) Kth Largest Element in an array"
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
date: "2024-08-18"
---

# Leetcode::Kth Largest Element in an array
- [Link : Leetcode::Kth Largest Element in an array](Kth Largest Element in an array)

- level : medium

# point
- Given an integer array nums and integer k, return the k-th largest element in the array.

# Design
- Since we get the given k which is constant, it's not so difficult to find the k-th largest number in an array.
- The simplest way is the way of using a heap.
- We use a min heap and only store k numbers in it, so we can always have the largest k numbers from the given numbers.
- In the end, the top of the min heap is the k-th largest element in the array.

# Big O(time)
- TIME : O(NlogN)
- SPACE : O(K)

# Code

```cpp
class Solution {
public:
    int findKthLargest(vector<int>& nums, int k) {
        priority_queue<int> mnHeap;
        for(auto x : nums) {
            mnHeap.push(-x);
            if (mnHeap.size() > k) mnHeap.pop();
        }
        return -mnHeap.top();
    }
};
```
