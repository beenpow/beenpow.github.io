---
layout: post
title : "Leetcode::problem(75) Sort colors"
subtitle: "Leetcode ps medium"
type: "Leetcode medium"
medium: true
ps: true
leetcode: true
text: true
author: "beenpow"
post-header: true
header-img: "https://www.asics.com/dw/image/v2/BCRJ_PRD/on/demandware.static/-/Sites-asics-au-Library/default/dw6eebafa4/firstspirit/media/new_folder/new_folder_99/proper-running-form-desktop.png"
order: 1
date: "2023-11-21"
---

# Leetcode::Sort Colors
- [Link : Leetcode::Sort Colors](https://leetcode.com/problems/sort-colors/description/)

- level : medium

# point
- Given an array nums with n objects colored red, white, or blue
- Sort them in-place

# Design
- This can be solved many ways, ex : qsort
- But the intended way of solving this problem is O(N) iteration.
- We can solve this like below logic
  - Focus on seperating a array into three regions, so we would like to have pointer p0, p2
	  - Where p0 points the end point of consecutive 0s from the beginning
		- Where p2 points the start point of consecutive 2s from the end
	- Now we iterate the given array nums with index 'curr'
	- If the value of curr is '0' it can be swapped to p0 position
	- If the value of curr is '2' it can be swapped to p2 position
	- ...
	- Then only 1s will be remained in the middle of the array


# Big O(time)

# Code

## O(N) iteration

```cpp
class Solution {
public:
    void sortColors(vector<int>& nums) {
        int p0 = 0, p2 = nums.size() - 1;
        int curr = 0;
        while(curr <= p2) {
            if (nums[curr] == 0) {
                // The reason why only this circumstance we add one to curr is that
                // curr can be behind of p0 if not.
                swap(nums[curr++], nums[p0++]);
            }
            else if (nums[curr] == 2) {
                swap(nums[curr], nums[p2--]);
            }
            else curr++;
        }
    }
};
```

## O(NlogN) qsort

```cpp

void _qsort(int le, int ri, vector<int>& nums) {
    if (le >= ri) return;
    int i = le, j = ri;
    int pivot = nums[(le + ri) / 2];

    while(i <= j) {
        while(nums[i] < pivot) i++;
        while(pivot < nums[j]) j--;
        if (i <= j) {
            swap(nums[i], nums[j]);
            i++, j--;
        }
    }
    if (i < ri) _qsort(i, ri, nums);
    if (le < j) _qsort(le, j, nums);
}
class Solution {
public:
    void sortColors(vector<int>& nums) {
        _qsort(0, nums.size() - 1, nums);
    }
};
```
