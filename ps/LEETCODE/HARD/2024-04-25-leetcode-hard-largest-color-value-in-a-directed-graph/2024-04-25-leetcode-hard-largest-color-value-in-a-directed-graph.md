---
layout: post
title : "Leetcode::problem(1857) Largest Color Value in a Directed Graph"
subtitle: "Leetcode ps hard"
type: "Leetcod hard"
hard: true
ps: true
leetcode: true
text: true
author: "beenpow"
post-header: true
header-img: ""
order: 1
date: "2024-04-27"
---

# Leetcode::Largest Color Value in a Directed Graph
- [Link : Leetcode::Largest Color Value in a Directed Graph](https://leetcode.com/problems/largest-color-value-in-a-directed-graph)

- level : hard
- took 1 hour and 18 mins to solve

# point
- There is a directed graph of n colored nodes a m edges from 0 to m-1
- Return the largest color value of any valid path in the given graph, or -1 if the graph contains a cycle

# Design
- It's a great problem to think about dynamic programing
- The points that we have to fully understadn and figure are like below.
  - First of all, if there's any cycles, we return -1
  - Then, we have to check every path and compare the result
- For the logic of finding cycles, I've used topological sort in a DAG.
  - If it's not a DAG, we ended up knowing there are some values still on the queue
  - Then, we return -1
- For going to every path,
	- This is tricky part
	- Because to go to every path, we should visit same nodes again, which means time complexity will rise
	- But if we draw every path on a given graph, we understand there are same partial paths are used for many times
	- This is the point we have to get advantage of.
	- We start dfs from root nodes (no indegree nodes)
  - If we define a memoization DP like below, it's possible not to follow same partial paths every time we visit the same node
	- DP(u)(k)
	  - At node u, for color k, this is suffix max value
		- Meaning, there are many ways starts from node u.
		- From all of the paths, we check the maximum color counts for each color
	- With this memoization, we are able to visit each node once, since we store the momizational result as DP

# Big O(time)
- TIME
	- Visiting every node once takes O(N)
	- Transferring values from the given graph to adj takes O(M)
	- As a result, it takes O(N + M)
- SPACE
  - adj will take O(M)
	- DP will take O(N * 26)
	- As a result, it takes O(N + M) space

# Code

```cpp
class Solution {
public:
    const int ALPHABETS = 26;
    int n = 0;
    int mxCnt = 0;
    vector<vector<int> > DP;
    vector<bool> hasMemo;
    vector<vector<int> > adj;

    vector<int> _innerCnt;
    vector<int> _innerTmp;


    int largestPathValue(string colors, vector<vector<int>>& edges) {
        // find 'n'
        for (int i = 0; i < edges.size(); i++) {
            if (n < edges[i].front()) n = edges[i].front();
            if (n < edges[i].back()) n = edges[i].back();
        }
        n += 1;
        vector<int> in_degree(n, 0);
        adj = vector<vector<int> > (n);

        // check in_degree and see if there's any node that has '0' as indegree
        for(int i = 0; i < edges.size(); i++) {
            in_degree[edges[i].back()]++;

            adj[edges[i].front()].push_back(edges[i].back());
        }

        queue<int> q;
        vector<int> entryPoint;
        for(int i = 0; i < n; i++) if (in_degree[i] == 0) {
            q.push(i);
            entryPoint.push_back(i);
        }
        if (q.empty()) return -1;
        // check if it's DAG with topological sort
        while (!q.empty()) {
            int u = q.front();
            q.pop();
            for (auto v : adj[u]) if (in_degree[v] > 0) {
                in_degree[v]--;
                if (in_degree[v] == 0) q.push(v);
            }
        }
        for(int i = 0; i < n; i++) if (in_degree[i] > 0) {
            return -1;
        }


        // now, it's confirmed the graph is acycle
        hasMemo = vector<bool> (n, false);
        DP = vector<vector<int> > (n, vector<int>(ALPHABETS));

        _innerCnt = vector<int> (ALPHABETS, 0);
        _innerTmp = vector<int> (ALPHABETS, 0);

        for (auto u : entryPoint) {
            vector<bool> visited(n, false);
            vector<int> cnt = dfs(u, visited, colors);

            for(int j = 0; j < ALPHABETS; j++) mxCnt = max(mxCnt, cnt[j]);
        }
        

        return mxCnt;
    }

    vector<int> dfs(int cur, vector<bool> &visited, string& colors) {
        if (hasMemo[cur]) return DP[cur];

        visited[cur] = true;

        for (int j = 0; j < ALPHABETS; j++) _innerCnt[j] = 0;

        for(auto nxt : adj[cur]) if (visited[nxt] == false) {
            _innerTmp = dfs(nxt, visited, colors);
            
            for (int j = 0; j < ALPHABETS; j++) _innerCnt[j] = max(_innerCnt[j], _innerTmp[j]);
        }
        _innerCnt[colors[cur] - 'a']++;

        visited[cur] = false;
        hasMemo[cur] = true;

        for(int j = 0; j < ALPHABETS; j++) DP[cur][j] = _innerCnt[j];
        return DP[cur];
    }

};
```
