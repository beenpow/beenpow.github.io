---
layout: post
title : "Leetcode::problem rotate array"
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
date: "2025-02-19"
---

# Leetcode::rotate array
- [Link : Leetcode:rotate array](https://leetcode.com/problems/rotate-array/description/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, 5 30 1 0 0
- level : medium

# point
- Given an integer array nums, rotate the array to the right by k steps, where k is non-negative.

# Design
- There are incredible solution for this problem.
- Using 'reverse'.
  - This will be the simplest way to solve the problem in-place.
	- However, coming up with this idea is tough.
	- Once we get the idea of using 'reverse', solving the problem is not that hard.
- Using 'Cyclic Replacements'.
  - It's very interesting to use 'cyclic replacements'.
	- We have to understand how it works and keep in mind to reuse on other problems.
	- Basically, we replace based on jumping k steps until we find the start point. (Cyclic)
	- Then we move to the next one.

# Big O(time)
- TIME : O(N)
- SPACE : O(1)

# Code

## Using 'reverse'

```cpp
class Solution {
public:
    void rotate(vector<int>& nums, int k) {
        int sz = nums.size();
        k = k % sz;
        reverse(nums.begin(), nums.end());
        reverse(nums.begin(), nums.begin() + k);
        reverse(nums.begin() + k, nums.end());
    }
};
```

## Using 'Cyclic Replacements'

```cpp
class Solution {
public:
    void rotate(vector<int>& nums, int k) {
        int sz = nums.size();
        k = k % sz;
        int start = 0, count = 0;
        while(count < sz) {
            int curId = start, prev = nums[curId];
            do {
                int next = (curId + k) % sz;
                int temp = nums[next];
                nums[next] = prev;

                prev = temp;
                curId = next;
                count++;
            } while (curId != start);
            start++;
        }
    }
};
```
