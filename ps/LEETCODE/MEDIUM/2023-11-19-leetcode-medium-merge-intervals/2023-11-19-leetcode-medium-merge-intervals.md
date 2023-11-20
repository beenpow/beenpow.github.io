---
layout: post
title : "Leetcode::problem(56) Merge Intervals"
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
date: "2023-11-19"
---

# Leetcode::Merge Intervals
- [Link : Leetcode::Merge Intervals](https://leetcode.com/problems/merge-intervals/description/)

- level : medium

# point
- Given an array of intervals
- return an array of non-overlapping intervals

# Design
- It's simple but powerful logic
- Sort the intervals with ascending order of start point
- If adjacent ranges are overlapped, merge them

# Big O(time)
- O(NlogN)

# Code

```cpp
bool _func(const vector<int> x, const vector<int> y) {
    if (x[0] == y[0]) return x[1] < y[1];
    else return x[0] < y[0];
}
class Solution {
public:
    vector<vector<int>> merge(vector<vector<int>>& intervals) {
        sort(intervals.begin(), intervals.end(), _func);

        vector<vector<int>> ret;
        ret.push_back(intervals[0]);
        int n = intervals.size();

        for(int i = 1; i < n; i++) {
            if (ret.back()[1] < intervals[i][0]) {
                ret.push_back(intervals[i]);
            } else {
                ret.back()[0] = min(ret.back()[0], intervals[i][0]);
                ret.back()[1] = max(ret.back()[1], intervals[i][1]);
            }
        }

        return ret;
    }
};
```
