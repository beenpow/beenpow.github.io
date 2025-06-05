---
layout: post
title : "Leetcode::problem the latest time to catch a bus"
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
date: "2025-06-05"
---

# Leetcode::the latest time to catch a bus
- [Link : Leetcode:the latest time to catch a bus](https://leetcode.com/problems/the-latest-time-to-catch-a-bus/description/)
- Solved, algorithm 180
- level : medium

# Problem Description
- You are given two integer arrays `buses` and `passengers`.
- `buses[i]` is the time when the `i`-th bus arrives.
- `passengers[j]` is the time when the `j`-th passenger arrives.
- You are also given an integer `capacity` which is the maximum number of passengers that can be on a bus.
- Return the latest time you can arrive at the bus station to catch a bus.
- All buses and passengers are unique.

# How to solve
- Utilizing a set makes this problem easier.
- However, if we can not come up with using a set, it is not easy to solve this problem.
- To solve this problem, we need to find the latest time to catch a bus.
    - First, we need to sort the buses and passengers.
    - Then, we create a set of passengers to check if a passenger is on the bus.
    - We iterate through the buses and put passengers on the bus.
    - Interatestingly, from above iteration, we only utilize the last passenger's time and the last bus's passenger count.
    - Then we backtrack from this.
    - If the last bus has less than `capacity` passengers, the latest time to catch a bus is the last bus's time.
    - If the last bus has `capacity` passengers, the latest time to catch a bus is the time of the last passenger - 1.
    - Then we need to check if the latest time is in the set of passengers.

# Big O (Time, Space)
- n : size of buses
- m : size of passengers
- Time : O(MAX(nlogn, mlogm))
- Space : O(m)

# Code

```cpp
class Solution {
public:
    int latestTimeCatchTheBus(vector<int>& buses, vector<int>& passengers, int capacity) {
        sort(buses.begin(), buses.end());
        sort(passengers.begin(), passengers.end());
        unordered_set<int> passen(passengers.begin(), passengers.end());
        int n = buses.size(), m = passengers.size();

        int j = 0;
        int lastPassenger = -1;
        int lastBusCnt = -1;
        for(auto bus : buses) {
            int cnt = 0;
            while(j < m && cnt < capacity && passengers[j] <= bus) {
                lastPassenger = passengers[j];
                j++;
                cnt++;
            }
            if (bus == buses.back())
                lastBusCnt = cnt;
        }

        int candidate;
        if (lastBusCnt < capacity) {
            candidate = buses.back();
        } else {
            candidate = lastPassenger - 1;
        }
        while (passen.count(candidate)) {
            candidate--;
        }
        return candidate;
    }
};
```