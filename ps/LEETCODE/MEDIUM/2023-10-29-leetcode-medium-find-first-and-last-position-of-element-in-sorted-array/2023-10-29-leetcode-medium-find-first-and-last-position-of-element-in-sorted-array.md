---
layout: post
title : "Leetcode::problem(34) Find First and Last Position of Element in Sorted Array"
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
date: "2023-10-29"
---

# Leetcode::Find First and Last Position of Element in Sorted Array
- [Link : Leetcode::Find First and Last Position of Element in Sorted Array](https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/description/)

- level : medium

# point
- non-descending array and target value are given, find the range of target values on the array

# Design

```txt
To find range [t, t] in
[ ... , x, y, t, t, t, t, z, a, b, ...],

It's necessary to do binary search to find start point and end point each.
So total iteration with binary search will be twice.

To find the start point, I gotta find [not t, t] point
To find the end   point, I gotta find [t, not t] point
```


# Big O(time)
- O(logN)

# Code

```cpp
class Solution {
public:
    int find_st(vector<int> nums, int st, int en, int target) {
        while(st <= en) {
            int mid = (st + en) / 2;
            if (nums[mid] == target) {
                if(mid == 0) {
                    // can't be
                    static_assert("wrong", "can not");
                } else {
                    if (nums[mid-1] != target) return mid;
                    else {
                        en = mid-1;
                    }
                }
            }
            else if (nums[mid] < target) {
                st = mid + 1;
            }
            else {
                en = mid - 1;
            }
        }
        return -1;
    }
    int find_en(vector<int> nums, int st, int en, int target) {
        while(st <= en) {
            int mid = (st + en) / 2;
            if (nums[mid] == target) {
                if (mid == nums.size() - 1) {
                    // can't be
                    static_assert("wrong", "can not");
                } else {
                    if (nums[mid+1] != target) return mid;
                    else {
                        st = mid + 1;
                    }
                }
            }
            else if (nums[mid] < target) {
                st = mid + 1;
            }
            else {
                en = mid - 1;
            }
        }
        return -1;
    }


    vector<int> searchRange(vector<int>& nums, int target) {
        vector<int> ret;
        int st = -1, en = -1, sz = nums.size();
        ret.push_back(st);
        ret.push_back(en);
        if (sz == 0) return ret;


        if (nums[0] == target) ret[0] = 0;
        else ret[0] = find_st(nums, 0, sz - 1, target);

        if(nums[sz - 1] == target) ret[1] = sz - 1;
        else ret[1] = find_en(nums, 0, sz - 1, target);

        return ret;
    }
};

```
