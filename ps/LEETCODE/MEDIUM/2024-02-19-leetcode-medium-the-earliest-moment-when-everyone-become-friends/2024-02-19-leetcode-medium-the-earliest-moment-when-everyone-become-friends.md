---
layout: post
title : "Leetcode::problem(1101) The Earliest Moment When Everyone Become Friends"
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
date: "2024-02-19"
---

# Leetcode::The Earliest Moment When Everyone Become Friends
- [Link : Leetcode::The Earliest Moment When Everyone Become Friends](https://leetcode.com/problems/the-earliest-moment-when-everyone-become-friends/description/)

- level : medium

# point
- There are n people in a social group labeled from 0 to n-1
  - You are given an array logs where logs[i] = [timestamp, x, y] indicates that x and y will be friends at the time timestamp.
  - Return the earliest time for which every person became acquainted with every other person.

# Design
  - Becoming friends make nodes merged
  - This kind of problem is considered to think about disjoint set
  - At first each node are disjointed and they become jointed
  - To solve disjoint set problem, we can use union-find method
  - Let’s say each node has parent and if two nodes have same parent, they are considered as jointed set.
  - It’s our job to see if all node’s parent become the same one.
  - If there are n nodes, it’s certain that it takes (n-1) merging situation for making one big jointed set.
  - Since every merge take two disjointed sets, it takes (n-1) merge
  - Now we noticed that whether merge has been done upto (n-1) times or not on every iteration
  - At each iteration, we do what usual union find function does
    - We would have nodes u and v
    - Find their parents
    - See if their parents are same
    - If it’s not the same one, we merge them

# Big O(time)
  -  N : people, M : logs size
  -  Time
    - O(N) : labeling each node’s parent
    - O(M log M) : sorting
    - O(M * a(N)) : For each iteration of logs, it takes a(N) ( Which is Ackermann function and this can be considered as contant time )
  - Space
    - O(N) : labeled parent

# Code

```cpp
class Solution {
public:
    int mergeCnt = 0; // If mergeCnt equals to (n-1), it means that all became friends.
    vector<int> parent;

    int getParent(int x) {
        if (parent[x] == x) return x;
        return parent[x] = getParent(parent[x]);
    }
    void merge(int u, int v) {
        if (u < v) parent[v] = u;
        else parent[u] = v;
    }
    int earliestAcq(vector<vector<int>>& logs, int n) {
        // set default parent
        parent = vector<int>(n);
        for(int i = 0; i < n;i++) parent[i] = i;

        // sort logs by time
        sort(logs.begin(), logs.end());

        for(int i = 0; i < logs.size(); i++) {
            // Do something
            int _time = logs[i][0], u = logs[i][1], v = logs[i][2];
            
            int pu = getParent(u);
            int pv = getParent(v);
            if (pu == pv) {
                // do nothing
            } else {
                merge(pu, pv);
                mergeCnt++;
                cout << "MERGED : " << pu << ", " << pv << '\n';
            }

            if (mergeCnt == (n - 1)) return _time;
        }

        return -1;
    }
};
```
