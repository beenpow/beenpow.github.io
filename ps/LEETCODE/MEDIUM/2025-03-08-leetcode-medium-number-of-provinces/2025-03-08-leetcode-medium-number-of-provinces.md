---
layout: post
title : "Leetcode::problem number of provinces"
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
date: "2025-03-08"
---

# Leetcode::number of provinces
- [Link : Leetcode:number of provinces](https://leetcode.com/problems/number-of-provinces/)
- Solved, 5 10 5 5 2
- level : medium

# point
- There are n cities, some of them are connected.
- Return the total number of provinces.

# Design
- To find the total number of provinces, roughly there are two ways.
- First one is using DFS.
  - With the given connections, we are able to traverse between cities.
  - We count cities that hasn't been connected.
- Second one is using Union-Find.
  - Whenever we know there's a connection between two cities, we put one of parents to indicate the other.
  - After connecting all cities, we count unique numbers in parents group.

# Big O(time)
- TIME : O(N^2)
- SPACE :O(N)

# Code

```cpp
class Solution {
public:
    vector<int> parent;
    int find(int u) {
        if (u == parent[u]) return parent[u];
        return parent[u] = find(parent[u]);
    }
    int findCircleNum(vector<vector<int>>& isConnected) {
        int n = isConnected.size();
        parent = vector<int>(n + 1);
        for (int i = 0; i < n; i++) parent[i] = i;

        for (int u = 0; u < n; u++) {
            for (int v = u + 1; v < n; v++) {
                if (isConnected[u][v] || isConnected[v][u]) {
                    int pu = find(u);
                    int pv = find(v);
                    if (pu == pv) continue;
                    parent[pu] = pv;
                }
            }
        }
        int ans = 0;
        map<int,int> cnt;
        for(int i = 0; i < n; i++){
            int pi = find(parent[i]);
            if (cnt.find(pi) == cnt.end()) {
                ans++;
                cnt[pi] = 1;
            }
        }
        return ans;
    }
};
```
