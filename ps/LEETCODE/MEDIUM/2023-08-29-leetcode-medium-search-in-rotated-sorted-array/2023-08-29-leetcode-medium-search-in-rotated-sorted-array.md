---
layout: post
title : "Leetcode::problem(33) Search in Rotated Sorted Array"
subtitle: "Leetcode ps medium"
type: "Leetcode medium"
medium: true
ps: true
leetcode: true
text: true
author: "beenpow"
post-header: true
header-img: "https://www.spotebi.com/wp-content/uploads/2019/01/one-day-day-one-workout-motivation-spotebi.jpg"
order: 1
date: "2023-08-29"
---

# Leetcode::Search in Rotated Sorted Array
- [Link : Leetcode::Search in Rotated Sorted Array](https://leetcode.com/problems/search-in-rotated-sorted-array/?envType=study-plan-v2&envId=google-spring-23-high-frequency)

- level : medium

# point
- A array nums is given
  - nums was sorted array, now it is shifted
- Find if given target exist on the nums array in O(logN)

# Design
- If the given array is sorted array, we can simply binary search and find the target's position in O(logN)
- But the array is shifted, so we gotta find the smallest value's position first
- Then we can seperate the given array into two parts
  - Let's say the smalles value's position is K
  - Then we would have two parts as
    - [0:K) and [K:nums.size())

- Finding K can be achieved by binary search too
- Let's say we have lo, mi, hi
  - If it's normal operation of binary search, we would have two if statements
    - One for [lo:mid] and another for [mid+1:hi]
  - But there can be like below case
    - [3 4 1 2] and mid is pointing '4'.
  - Then we are not going to find the position of '1' forever
  - To avoid this, it's necessary to check if the current position of mid is the largest value

# Big O(time)
- O(logN)

# Code

```cpp
class Solution {
public:
    // shift 된 sorted array가 주어졌을때,
    // 이 array 에 target이 포함되었는지 logN에 검사하라
    int search(vector<int>& nums, int target) {
        // 1. find the pivot
        // [lo, mid, hi]
        /*
        if (a[lo] > a[mid]) : pivot exist between [lo:mid]
        else if (a[mid] > a[mid+1]) found it !
        else                : pivot exist between [mid + 1:hi]

        * Think about exceptional case like below
          mid
           |
           v   
        [3 4 1 2]
        */

        // 2. find target in two sorted arrays

        auto getPivot = [](const vector<int> a) {
            int ret = -1;
            int lo = 0, hi = a.size() - 1;
            while(lo < hi) {
                int mid = (lo + hi) / 2;
                if (a[lo] > a[mid]) {
                    hi = mid;
                } else if (a[mid] > a[mid+1]) {
                    ret = mid + 1;
                    break;
                } else {
                    lo = mid + 1;
                }
            }
            if (ret == -1) ret = 0;
            return ret;
        };
        int pivotIdx = getPivot(nums);
        cout << "Pivot Index : " << pivotIdx << '\n';

        auto bsFind = [](const vector<int> a, int lo, int hi, int tar) {
            if(lo > hi) return -1;
            if(lo == hi) return a[lo] == tar ?  lo : -1;

            int ret = -1;
            while(lo < hi) {
                int mid = (lo + hi) / 2;
                if (a[mid] < tar) lo = mid + 1;
                else if (a[mid] == tar) return mid;
                else hi = mid;
            }
            if (a[lo] == tar) ret = lo;
            return ret;
        };
        int fi = bsFind(nums, 0, pivotIdx - 1, target);
        int se = bsFind(nums, pivotIdx, nums.size() - 1, target);

        if (fi == -1 && se == -1) return -1;
        if (fi != -1) return fi;
        if (se != -1) return se;
        if (fi != -1 && se != -1) static_assert("WRONG!", "EXCEPTION");
        return -999;
    }
};
```
