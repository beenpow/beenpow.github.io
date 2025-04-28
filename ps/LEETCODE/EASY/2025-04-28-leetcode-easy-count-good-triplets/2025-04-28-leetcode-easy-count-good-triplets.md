---
layout: post
title : "Leetcode::problem count good triplets"
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
date: "2025-04-28"
---

# Leetcode::count good triplets
- [Link : Leetcode:count good triplets](https://leetcode.com/problems/count-good-triplets/description/)
- Solved, 3 3 3 0 0
- level : easy

# point
- Return the number of good triplets.
    - A good triplet (arr[i], arr[j], arr[k])
        - 0 <= i < j < j < arr.length
        - abs(arr[i] - arr[j]) <= a
        - abs(arr[j] - arr[k]) <= b
        - abs(arr[i] - arr[k]) <= c

# Design
- It's necessary to check all the triplets if they are good or not.
- So we need three for-loops.

# Big O(time)
- TIME : O(N^3)
- SPACE : O(1)

# Code

```cpp
class Solution {
public:
    int countGoodTriplets(vector<int>& arr, int a, int b, int c) {
        int ans = 0;
        for(int i = 0; i < arr.size(); i++) {
            for(int j = i + 1; j < arr.size(); j++) {
                for(int k = j + 1; k < arr.size(); k++){
                    if (abs(arr[i] - arr[j]) <= a && abs(arr[j] - arr[k]) <= b &&
                    abs(arr[i] - arr[k]) <= c) ans++;
                }
            }
        }
        return ans;
    }
};
```