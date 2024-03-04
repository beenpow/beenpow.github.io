---
layout: post
title : "Leetcode::problem(57) Insert Interval"
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
date: "2023-11-19"
---

# Leetcode::Insert Interval
- [Link : Leetcode::Insert Interval](https://leetcode.com/problems/insert-interval/description/)

- level : medium
  - fail to solve

# point
	- You are given an array of non-overlapping intervals and new interval
	- Insert new interval into intervals and merge overlapping intervals

# Design
- This problem seems easy, but it took so much time to make the logic
- There's simple rule to make this problem easier
  - First, insert the new interval into intervals as a way of maintaing the sorted order for intervals start point
	- Second, merge adjacent intervals if it's overlapped.

# Big O(time)
- O(N)

# Code

```cpp
class Solution {
public:
    vector<vector<int>> insert(vector<vector<int>>& intervals, vector<int>& newInterval) {
        
        // insert by making the start position as sorted order
        bool f = false;
        vector<vector<int>> newInt;
        int st = newInterval[0], en = newInterval[1];
        for(int i = 0; i < intervals.size(); i++) {
            if (f) newInt.push_back(intervals[i]);
            else if (st <= intervals[i][0]) {
                f = true;
                newInt.push_back(newInterval);
                newInt.push_back(intervals[i]);
            }else newInt.push_back(intervals[i]);
        }
        if (!f) newInt.push_back(newInterval);

        // newInt is sorted by start point. But end point can be random
        // If adjacent two ranges are overlapped, merge them
        int n = newInt.size();
        intervals.clear();

        intervals.push_back(newInt[0]);
        for (int i = 1; i < n; i++) {
            // {back} < {i}
            if(intervals.back()[1] < newInt[i][0]) {
                intervals.push_back(newInt[i]);
            }
            // overlap
            else {
                intervals.back()[0] = min(intervals.back()[0], newInt[i][0]);
                intervals.back()[1] = max(intervals.back()[1], newInt[i][1]);
            }
        }
        return intervals;
    }
};
```
