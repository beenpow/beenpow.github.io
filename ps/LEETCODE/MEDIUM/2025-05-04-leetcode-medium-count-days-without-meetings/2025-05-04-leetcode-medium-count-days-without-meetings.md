---
layout: post
title : "Leetcode::problem count days without meetings"
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
date: "2025-05-04"
---

# Leetcode::count days without meetings
- [Link : Leetcode:count days without meetings](https://leetcode.com/problems/count-days-without-meetings/description/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, 2 5 20 0 15
- level : medium

# point
- You are given a positive integer days representing the total number of days an employee is available for work.
- You are also given a 2D array meetings of size n where, meetings[i] = (start_i, end_i) represents the starting and ending days of meetings i (inclusive).
- Return the count of days when the employee is available for work but no meetings are scheduled.

# Design
- I've solved with 'sorting'.
    - After we sort the given array 'meetings', we check adjacent relations only.
    - For example, we check range (i) and range (i+1).
        - If they have common part between them, they can be merged into one range.
        - Otherwise, they are seperated, so we add the days between those two ranges.
- Also, I suggest to solve with 'Line sweeping' which is provided on Editorial.
    - We use 'map' to mark where each meeting starts and ends.
    - For the starting point, we add 1.
    - For the ending point+1, we decrease 1.
    - While we iterate with the map(map is sorted automatically), if the sum of marked values is equal to 0 we know this position relates to 'available work day'.
    - Because all ranges end here.

# Big O(time)
- Line sweeping
    - TIME : O(NlogN)
    - SPACE : O(N)
- Sorting
    - TIME : O(NlogN)
    - Space : O(logN)
        - Using 'sort' can take O(logN) space at worst scenario.

# Code

## Line sweeping

```cpp
class Solution {
public:
    int countDays(int days, vector<vector<int>>& meetings) {
        map<int,int> dayMap;
        int prefixSum = 0, previous = days;
        for (auto meeting : meetings) {
            previous = min(previous, meeting[0]);
            dayMap[meeting[0]]++;
            dayMap[meeting[1] + 1]--;
        }

        int ans = previous - 1;
        for(auto day : dayMap) {
            int currentDay = day.first;
            if (prefixSum == 0)
                ans += (currentDay - previous);
            
            prefixSum += day.second;
            previous = currentDay;
        }

        ans += (days - previous + 1);
        return ans;
    }
};
```

## Sorting

```cpp
class Solution {
public:
    int countDays(int days, vector<vector<int>>& meetings) {
        sort(meetings.begin(), meetings.end());

        int le = meetings[0][0], ri = meetings[0][1];
        int ans = le - 1;
        for(int i = 1; i < meetings.size(); i++) {
            if (ri < meetings[i][0]) {
                ans += (meetings[i][0] - ri - 1);
                le = meetings[i][0], ri = meetings[i][1];
            } else {
                ri = max(ri, meetings[i][1]);
            }
        }
        ans += (days - ri);

        return ans;
    }
};
```