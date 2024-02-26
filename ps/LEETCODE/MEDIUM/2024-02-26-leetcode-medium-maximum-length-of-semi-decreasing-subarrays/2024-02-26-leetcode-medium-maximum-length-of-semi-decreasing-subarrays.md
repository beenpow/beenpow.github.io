---
layout: post
title : "Leetcode::problem(2863) Maximum Length of Semi-Decreasing Subarrays"
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
date: "2024-02-26"
---

# Leetcode::Maximum Length of Semi-Decreasing Subarrays
- [Link : Leetcode::Maximum Length of Semi-Decreasing Subarrays](https://leetcode.com/problems/maximum-length-of-semi-decreasing-subarrays/description/)

- level : medium
- 47mins to solve

# point
  - You are given an integer array nums
  - return the length of the longest semi-decreasing subarray of nums, and 0 if there is no such subarrays.
    - A subarray is a contiguous non-empty sequence of elements within an array
    - A non-empty array is semi-decreasing if its first element is strictly greater than its last element

# Design
  - This problem is bit tricky
  - Let’s say we iterate each element from the given array nums.
    - All we need to do at point i is that find a node that has smaller value and greater position
  - It’s possible solve this problem by brute forcing, but it’s over time limit of the problem
  - There was a idea to solve this problem but I thought that it would be over the time limit
  - However, as I tested by simulation with the given test case, I noticed that it only take O(1) for the comparison part which was considered to take O(N).
  - Here’s how I solved the problem
    - We need sorted array by it’s value and position simultaneously which is impossible.
    - But there’s a one way of implementations to approach this kind of problem.
    - Which is we maintain two sorted array by adding the current value to a certain array
    - For example with this problem,
      - We sort the given array nums with index, so it will be pair<int,int> which indicates index and value
      - Now we have value-sorted array and need to find a node that has smaller value than the current one and bigger index
      - To achieve this goal, we update current value’s index as ‘maxPos’ after each iteration
        - To understand this easily, you can have a map that has index - value, and use the first element as ‘maxPos’
        - By doing this we are able to keep the greatest index that’s always smaller than the current value
        - I thought that this would take O(N) as maximum since I considered that it’s possible to iterate all of the members of the map which is not true.
      - All we need to do is comparing current value’s index and ‘maxPos’
    - There’s one edge case that we should make sure, which is holding maxPos for the same values
    - Since they have same values but diffent index, we should not make them use same value’s any information
      - If we let same value use the information of another same value, it won’t meet the requirement of ‘semi-decreasing’


# Big O(time)
- Time : O(NlogN)
- Space : O(N)

# Code

```cpp

class Solution {
public:
    int maxSubarrayLength(vector<int>& nums) {
        int n = nums.size();
        vector<pair<int,int> > vp;
        for(int i = 0; i < n; i++) vp.push_back({nums[i], i});

        sort(vp.begin(), vp.end());

        int ret = 0; // return 0 if there's no such subarrays
        int maxPos = -1;
        int holdMaxPosForSameVal = -1;
        for(int i = 0; i < n; i++) {
            int val = vp[i].first, id = vp[i].second;
            int d = ((id > maxPos) ? 0 : maxPos - id + 1);
            ret = max(ret, d);
            holdMaxPosForSameVal = max(holdMaxPosForSameVal, id);

            if (i == n-1) {
                // do nothing
            } else {
                if (val != vp[i+1].first) {
                    maxPos = max(maxPos, holdMaxPosForSameVal);
                    holdMaxPosForSameVal = -1;
                }
            }
        }
        return ret;
    }
};
```
