---
layout: post
title : "Leetcode::problem find closest node to given two nodes"
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
date: "2025-06-25"
---

# Leetcode::find closest node to given two nodes
- [Link : Leetcode:find closest node to given two nodes](https://leetcode.com/problems/find-closest-node-to-given-two-nodes/description/)
- Solved, 7 10 5 0 0
- level : medium

# Problem Description
- You are given a directed graph with n nodes labeled from 0 to n - 1, where each node has at most one outgoing edge.
- Return the index of the node that can be reached by both node1 and node2, such that the distance between them is minimized.

# How to solve
- I've used dfs to get the distance from the given two nodes.
- Since each node has at most one outgoing edge, we can simply find the closest node to the given two nodes without knowing the graph structure.
- After getting the distance from the given two nodes, we choose the node that has the minimum distance from the given two nodes.

# Big O (Time, Space)
- TIME : O(N)
- SPACE : O(N)

# Code

```cpp
class Solution {
public:
    void dfs (int curr, int depth, vector<bool>&visited, vector<int>&edges, vector<int>&dist) {
        visited[curr] = true;
        dist[curr] = depth;

        if (edges[curr] != -1 && visited[edges[curr]] == false) {
            dfs(edges[curr], depth + 1, visited, edges, dist);
        }
    }
    int closestMeetingNode(vector<int>& edges, int node1, int node2) {
        int n = edges.size();
        vector<int> dist1(n, n), dist2(n, n);
        vector<bool> visited(n, false);

        // dist from node1
        dfs(node1, 0, visited, edges, dist1);

        // dist from node2
        visited = vector<bool>(n, false);
        dfs(node2, 0, visited, edges, dist2);

        int d = n, id = -1;
        for (int i = 0; i < n; i++) {
            if (dist1[i] == -1 || dist2[i] == -1) continue;
            int m = max(dist1[i], dist2[i]);
            if (m < d) {
                d = m;
                id = i;
            }
        }
        return id;
    }
};
```