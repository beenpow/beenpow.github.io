---
layout: post
title : "Leetcode::problem non overlapping intervals"
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
date: "2025-06-19"
---

# Leetcode::non overlapping intervals
- [Link : Leetcode:non overlapping intervals](https://leetcode.com/problems/non-overlapping-intervals/description/)
- Solved, 3 15 8 2 10
- level : medium

# Problem Description
- Given an array of intervals where intervals(i) = (start_i, end_i).
- Return the minimum number of intervals you need to remove to make the rest of the intervals non-overlapping.

# How to solve
- This problem is very similar with the problem as 'scheduling maximum number of meetings'.
- Let's say each interval represents the time of a meeting(start, end).
- To schedule as many as meetings, we need to sort them by the end time and greedily choose meetings.
- The reason why we sort them by their end times is like below.
    - Because we have to set a certain criteria between meetings.
    - But if  we sort them by their start times, we can not choose meetings greedily.
- After sort them by their end times, we iterate the array.
    - During iteration, theare are only two cases.
    - 1. Current interval overlaps with the previous chosen interval.
    - 2. Current interval does not overlap with the previous chosen interval.
- So if there is no verlapping interval like 2,
- We put current interval to the back of the chosen intervals.
- If there is an overlap, we discard current one.
- There can be two common situations during iteration.
    - The first case is, (1, 2), (2, 5), (3, 5), (4, 5).
        - Let's say we chose (1, 2).
        - Then what we have to choose among three pairs?
        - We choose the first one (2, 5).
        - Then we skip others because they have same end point.
    - The second case is, (1, 3), (2, 4), (3, 4).
        - Let's say we chose (1, 3).
        - When we consider (2, 4), do we have to put this in and pop (1,3) out?
        - No.
        - Since (1, 3) is chosen, (2,4) has overlapping interval with that.
        - So, we discard (2, 4).
        - And we chose (3, 4) because it does not overlap with (1, 3).

- In a nutshell, we sort the given array based on the end time.
- Then, we decide what to choose by comparing the previous chosen interval and current one during iteration.

# Big O (Time, Space)
- TIME : O(NlogN)
- SPACE : O(1)

# Code

```cpp
class Solution {
public:
    static int COMP(const vector<int>& a, const vector<int>& b) {
        if (a[1] != b[1]) return a[1] < b[1];
        return a[0] < b[0];
    }
    int eraseOverlapIntervals(vector<vector<int>>& intervals) {
        sort(intervals.begin(), intervals.end(), COMP);

        int ans = 1;
        pair<int,int> lastIn = {intervals[0][0], intervals[0][1]};
        for (int i = 1; i < intervals.size(); i++){
            if (lastIn.second == intervals[i][1]) {
                continue;
            } else {
                if (lastIn.second > intervals[i][0]) {
                    continue;
                } else {
                    ans++;
                    lastIn = {intervals[i][0], intervals[i][1]};
                }
            }
        }
        return intervals.size() - ans;
    }
};
```