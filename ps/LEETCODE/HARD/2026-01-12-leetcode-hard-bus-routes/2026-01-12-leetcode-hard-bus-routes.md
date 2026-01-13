---
layout: post
title : "Leetcode::problem bus routes"
subtitle: "Leetcode ps hard"
type: "Leetcode hard"
hard: true
ps: true
leetcode: true
text: true
author: "beenpow"
post-header: true
header-img: ""
order: 1
date: "2026-01-12"
---

# Leetcode::bus routes
- [Link : Leetcode:bus routes](https://leetcode.com/problems/bus-routes)
- Solved, 5 40 20 10 45
- level : hard

# Problem Description

# How to solve
- I've solved with 'BFS with Stops as Nodes' way, and I figured solving with 'BFS with Routes as Nodes' is good too.
- So, let me introducce both of them.
- BFS with Stops as Nodes
    - I created a 'unordered_map<int, vector<int> > stops' to have a list of routes that are connected by this stop.
    - With this structure, we can run BFS like below.
        - Starts from multi-source routes.
            - Iterates all the stops in the popped route.
            - At each stop, iterate all the possible routes which is connected from current route.
- BFS with Routes as Nodes
    - I tried to utilize this approach at first, but it was hard to come up with a clear solution that can run in the given time complexity.
    - As I figured with Editorial, it uses a clever way!
    - It sorts all the stops in each route first!
    - Then, compare them in O(N + N) way. (Like the way of solving 'merging two sorted lsits'.)
    - With this trick, other parts of solving the problem become easier, because it lets us to think about only routes.

# Big O (Time, Space)
- N : size of routes, M : size of routes(i).
- BFS with Bus Stops as Nodes
    - TIME : O(M x N^2)
    - SPACE : O(MN)
- BFS with Routes as Nodes
    - TIME : O(M x N^2 + N x MlogM)
    - SPACE : O(N^2)

# Code

## BFS with Bus Stops as Nodes

```cpp
class Solution {
public:
    int numBusesToDestination(vector<vector<int>>& routes, int source, int target) {
        if (source == target) return 0;

        int n = routes.size();
        vector<vector<int> > buses(n, vector<int>(n, 0));
        unordered_map<int, vector<int>> stops;
        unordered_set<int>visitBus;
        unordered_set<int>visitStops;

        queue<int> q; // bus

        // 1. Update route list on each stop
        for(int i = 0; i < n; i++) {
            bool pushed = false;
            for (int j = 0; j < routes[i].size(); j++) {
                stops[routes[i][j]].push_back(i);
                if (!pushed && source == routes[i][j]) {
                    q.push(i);
                    pushed = true;
                }
            }
            if (pushed) {
                q.push(i);
                visitBus.insert(i);
            }
        }
        
        // 2. Run BFS
        int len = 0;
        while (!q.empty()) {
            int sz = q.size();
            len++;
            while(sz--) {
                int b = q.front(); q.pop();
                for(auto stop: routes[b]) {
                    if (visitStops.find(stop) != visitStops.end()) continue;
                    if (stop == target) {
                        return len;
                    }
                    for(auto nextB : stops[stop]) {
                        if (visitBus.find(nextB) != visitBus.end()) continue;
                        q.push(nextB);
                        visitBus.insert(nextB);
                    }
                    visitStops.insert(stop);
                }
            }
        }

        return -1;
    }
};
```

## BFS with Routes as Nodes

```cpp
class Solution {
public:
    bool haveInCommon(const vector<int>& routeA, const vector<int>& routeB) {
        int i = 0, j = 0;
        while (i < routeA.size() && j < routeB.size()) {
            if (routeA[i] == routeB[j]) return true;

            if (routeA[i] < routeB[j]) i++;
            else j++;
        }
        return false;
    }
    int numBusesToDestination(vector<vector<int>>& routes, int source,
                              int target) {
        if (source == target) return 0;

        const int MAX_ROUTES = 501;
        vector<vector<int>> rGrp(MAX_ROUTES);

        // 1. sort stops in each route
        int n = routes.size();
        for (int i = 0; i < n; i++)
            sort(routes[i].begin(), routes[i].end());

        // 2. create a routes garph
        for (int i = 0; i < n; i++) {
            for (int j = i + 1; j < n; j++) {
                if (haveInCommon(routes[i], routes[j])) {
                    rGrp[i].push_back(j);
                    rGrp[j].push_back(i);
                }
            }
        }

        queue<int> q;
        unordered_set<int> rTarget;
        // 3. find starting routes.
        for (int i = 0; i < n; i++) {
            for (auto stop : routes[i]) {
                if (stop == source) {
                    q.push(i);
                }
                if (stop == target) {
                    rTarget.insert(i);
                }
            }
        }

        // 4. run BFS
        int len = 0;
        vector<bool> visited(MAX_ROUTES, false);
        while(!q.empty()) {
            len++;
            int sz = q.size();
            while(sz--) {
                int curr = q.front(); q.pop();
                if (rTarget.find(curr) != rTarget.end()) return len;
                for (auto nxt : rGrp[curr]) {
                    if (visited[nxt] == false) {
                        visited[nxt] = true;
                        q.push(nxt);
                    }
                }
            }
        }
        return -1;
    }
};
```