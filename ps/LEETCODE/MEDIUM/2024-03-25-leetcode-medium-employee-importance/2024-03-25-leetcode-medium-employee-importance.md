---
layout: post
title : "Leetcode::problem(690) Employee Importance"
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
date: "2024-03-25"
---

# Leetcode::Employee Importance
- [Link : Leetcode::Employee Importance](https://leetcode.com/problems/employee-importance/)

- level : medium
- 20 mins to solve

# point
- A data structure of employee importance is given
- Given an integer id, return the sum of importance of id's subordinate and id

# Design
- If we are given the information as tree that has left, right pointer it has to be solved as traversal tree problem.
- But we have all the information as vector, which makes us a lot easier to solve the problem.
- Since it's only a grph problem, it's clear to sovle the problem like below
  - Make a vector that includes all the connection between nodes
	- Summing importance by traverling the graph with dfs

# Big O(time)
- TIme : O(N)
- Space : O(N)

# Code

```cpp
/*
// Definition for Employee.
class Employee {
public:
    int id;
    int importance;
    vector<int> subordinates;
};===≠≠
*/

class Solution {
public:
    vector<vector<int> > grp;
    vector<bool> visited;
    vector<int> imp;

    int dfs(int id) {
        int ret = 0;
        visited[id] = true;
        for(auto nxt : grp[id]) {
            if (visited[nxt] == false) {
                ret += dfs(nxt);
            }
        }
        return ret + imp[id];
    }
    int getImportance(vector<Employee*> employees, int id) {
        grp = vector<vector<int> > (2001);
        visited = vector<bool>(2001, false);
        imp = vector<int> (2001, 0);

        for(auto cur : employees) {
            imp[cur->id] = cur->importance;
            for(auto nxt : cur->subordinates) {
                grp[cur->id].push_back(nxt);
            }
        }

        int ret = dfs(id);
        return ret;

        return 1;
    }
};
```
