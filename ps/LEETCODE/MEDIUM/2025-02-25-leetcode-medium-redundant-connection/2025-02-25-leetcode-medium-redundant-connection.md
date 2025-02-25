---
layout: post
title : "Leetcode::problem redundant connection"
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
date: "2025-02-25"
---

# Leetcode::redundant connection
- [Link : Leetcode:redundant connection](https://leetcode.com/problems/redundant-connection/description/)
- Solved, 5 5 30 0 120
- level : medium

# point
- You are given a graph that started as a tree with n nodes labeled from 1 to n, with one additional edge added.
- Return an edge that can be removed so that the resulting graph is a tree of n nodes.
- If there are mnultiple answers, return the answer that occurs last in the input.

# Design
- The problem is about 'Finding a cycle'.
  - So there can be many ways to solve this problem.
  - The only thing we need to after finding a cycle is that we make sure return the edge that occurs last in the input.

- DFS + MAP
  - We use 'trace' to track the visited node when we iterate with DFS.
	- Once we find the one that we already visited, we notice that this node is in the cycle.
	- Also, by using 'trace', we know all the members in the cycle.
	- After that we iterate from the end of the given edge to make sure to find the last added edge.
- DSU (Disjoint Set Union)
  - We use basic form of DSU.
	- But we have to make sure make unions by the order from the input.
	- Then, we can find the edge occurs last in the input.


# Big O(time)
- DFS + MAP1
	- Time : O(NlogN)
	- SPACE : O(N)
- DFS + MAP2
	- Time : O(NlogN)
	- SPACE : O(N)
- DSU
	- Time : O(N x a(N))
	- SPACE : O(N)

# Code

## DFS + MAP1 : O(NlogN)

```cpp
class Solution {
public:

    bool dfs(int prev, int cur, vector<bool> &visited, vector<vector<int> > &grp, vector<int>& trace) {
        bool Found = false;
        if (visited[cur] == true) {
            // Found a cycle, now we have two 'cur' in 'trace'.
            trace.push_back(cur);

            // From index of 'cur' in 'trace' to the end of trace
            reverse(trace.begin(), trace.end());
            while(!trace.empty() && trace.back() != cur) trace.pop_back();
            // No need to reverse back
            //reverse(trace.begin(), trace.end());
            return Found = true;
        }
        visited[cur] = true;
        for(auto nxt : grp[cur]) {
            if (prev == nxt) continue;
            trace.push_back(nxt);
            Found = dfs(cur, nxt, visited, grp, trace);
            if (!Found) trace.pop_back();
            else break;
        }
        return Found;
    }
    vector<int> findRedundantConnection(vector<vector<int>>& edges) {
        int maxDigit = edges.size();
        vector<vector<int> > grp(maxDigit + 1, vector<int>());

        map<pair<int,int>, int> mpIndex;
        for(int i = 0; i < edges.size(); i++) {
            auto node = edges[i];
            grp[node.front()].push_back(node.back());
            grp[node.back()].push_back(node.front());
            mpIndex[{node.front(), node.back()}] = i;
        }
        vector<int> trace;
        vector<bool> visited(maxDigit + 1, false);

        vector<int> ret;
        trace.push_back(1);
        bool Found = dfs(-1, 1, visited, grp, trace);
        if (!Found) {
            // Just in case
            // Do nothing, it will return vector<int>()
        } else {
            int latestIndex = 0;
            for(int i = 0; i < (int)trace.size() - 1; i++) {
                int u = trace[i], v = trace[i+1];
                if (mpIndex.find({u, v}) != mpIndex.end()) 
                    latestIndex = max(latestIndex, mpIndex[{u, v}]);
                else 
                    latestIndex = max(latestIndex, mpIndex[{v, u}]);
            }
            ret.push_back(edges[latestIndex].front());
            ret.push_back(edges[latestIndex].back());
        }

        return ret;
    }
};
```

## DFS + MAP2 : O(NlogN)

```cpp
class Solution {
public:

    bool dfs(int prev, int cur, vector<bool> &visited, vector<vector<int> > &grp, vector<int>& trace) {
        bool Found = false;
        if (visited[cur] == true) {
            // Found a cycle, now we have two 'cur' in 'trace'.
            trace.push_back(cur);

            // From index of 'cur' in 'trace' to the end of trace
            reverse(trace.begin(), trace.end());
            while(!trace.empty() && trace.back() != cur) trace.pop_back();
            // No need to reverse back
            //reverse(trace.begin(), trace.end());
            return Found = true;
        }
        visited[cur] = true;
        for(auto nxt : grp[cur]) {
            if (prev == nxt) continue;
            trace.push_back(nxt);
            Found = dfs(cur, nxt, visited, grp, trace);
            if (!Found) trace.pop_back();
            else break;
        }
        return Found;
    }
    vector<int> findRedundantConnection(vector<vector<int>>& edges) {
        int maxDigit = edges.size();
        vector<vector<int> > grp(maxDigit + 1, vector<int>());

        for(int i = 0; i < edges.size(); i++) {
            auto node = edges[i];
            grp[node.front()].push_back(node.back());
            grp[node.back()].push_back(node.front());
        }
        vector<int> trace;
        vector<bool> visited(maxDigit + 1, false);

        trace.push_back(1);
        bool Found = dfs(-1, 1, visited, grp, trace);
        if (!Found) {
            // Just in case
            // Do nothing, it will return vector<int>()
        } else {
            int latestIndex = 0;
            map<int,int> mp;
            for(auto u : trace) {
                mp[u] = 1;
            }
            for(int i = maxDigit - 1; i >= 0; i--) {
                if (mp.find(edges[i].front()) != mp.end() && mp.find(edges[i].back()) != mp.end()) return edges[i];
            }
        }

        return vector<int>();
    }
};
```


## DSU (Disjoint Set Union) : O(N x a(N))

```cpp
class Solution {
public:
    int n;
    vector<int> sz;
    vector<int> parent;

    int find(int u) {
        if (parent[u] == u) return u;
        return parent[u] = find(parent[u]);
    }

    vector<int> findRedundantConnection(vector<vector<int>>& edges) {
        n = edges.size() + 1;
        parent = vector<int>(n);
        sz = vector<int>(n, 0);

        for(int i = 1; i < n; i++) parent[i] = i, sz[i] = 1;

        for(auto edge : edges) {
            int u = edge.front(), v = edge.back();
            int pu = find(u);
            int pv = find(v);
            if (pu == pv) return edge;
            else {
                if (sz[pu] < sz[pv]) {
                    sz[pv] += sz[pu];
                    parent[pu] = pv;
                } else {
                    sz[pu] += sz[pv];
                    parent[pv] = pu;;
                }
            }
        }
        return vector<int>();
    }
};
```
