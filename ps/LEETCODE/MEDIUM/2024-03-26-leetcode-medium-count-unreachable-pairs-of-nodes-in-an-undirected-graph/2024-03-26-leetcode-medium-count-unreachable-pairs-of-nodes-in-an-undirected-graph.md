---
layout: post
title : "Leetcode::problem(2316) Count Unreachable Pairs of Nodes in an Undirected Graph"
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
date: "2024-03-26"
---

# Leetcode::Count Unreachable pairs of nodes in an undirected graph
- [Link : Leetcode::Count unreachable pairs of nodes in an undirected graph](https://leetcode.com/problems/count-unreachable-pairs-of-nodes-in-an-undirected-graph/)

- level : medium

# point
- You are given an integer n
- Return the number of pairs of different nodes that are unreachable from each other

# Design
- Defining 'unreachable'
  - If nodes u and v are in different component group, and there's no edges between these groups, we say it's unreachable
- Now we figured it's about how many component groups exist
- Since it's grouping problem, there can be two logic to getting groups
  - one : by doing DFS OR BFS, we get groups by traversaling
	- two : using union-find, we get groups by using 'parent'
- After getting groups of components, count number of pairs
- Nodes in one group can be treated as same ones, which means only count of nodes in one group matters

# Big O(time)
- TIME : O(V + E)
- SPACE : O(V + E)

# Code

```cpp
class Solution {
public:
    vector<vector<int> > grp;
    vector<bool> visited;
    
    int cCnt = 0;
    vector<vector<int> > components;
    
    void dfs(int cur, const int cNum) {
        visited[cur] = true;
        components[cNum].push_back(cur);
        for(auto nxt : grp[cur]) {
            if (visited[nxt] == false) {
                dfs(nxt, cNum);
            }
        }
    }
    
    long long countPairs(int n, vector<vector<int>>& edges) {
        grp = vector<vector<int> > (n);
        visited = vector<bool> (n);
        components = vector<vector<int> > (n);

        for(auto x : edges) {
            grp[x.front()].push_back(x.back());
            grp[x.back()].push_back(x.front());
        }

        for(int i = 0; i < n; i++) {
            if (visited[i] == false) {
                dfs(i, cCnt++);
            }
        }

        long long ret = 0;
        for(int i = 0; i < cCnt; i++) {
            ret += (n - components[i].size()) * (components[i].size());
            n -= components[i].size();
        }
        return ret;
    }
};
```
