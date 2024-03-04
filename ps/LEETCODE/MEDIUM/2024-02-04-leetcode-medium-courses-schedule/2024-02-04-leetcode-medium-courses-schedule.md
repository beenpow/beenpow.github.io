---
layout: post
title : "Leetcode::problem(207) Course Schedule"
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
date: "2024-02-04"
---

# Leetcode::Course Schedule
- [Link : Leetcode::Course Schedule](https://leetcode.com/problems/course-schedule/description/)

- level : medium
- failed : 120
- Solved with edit's way

# point
- numCourses and prerequisites are given, find if all courses can be finished.

# Design
- This problem can be defined as finding a cycle in a directed graph
  - Because of the relation between prerequisite subjects
- There are two ways to finding a cycle in a directed graph

## Kahn's algorithm
- It's well known fact that if we are able to topological sort, the graph is DAG ( Directed Acycle Graph )
- Topological sort
  - Let's say there are i, i+1, i+2, ..., j-1, j nodes and the array is topologically sorted
	- Which means, the direction of all the edges are same
	- If we take x, y edge ( x < y) from the given nodes, then x has outbound connection to y
	- There's no certain thing x > y and x has outbound connection to y

- Kahn's algorithm advanced topological sort to find if cycles exist in a directed graph
- [LINK](https://www.cs.princeton.edu/~wayne/kleinberg-tardos/pdf/03Graphs.pdf)
- The logic is simple
  - We find nodes that has no indegree
	- From the nodes, find neighbors with them and decrease indegree
	- If the neighbo has 0 indegree we do it again
  - If we visited as numCourses it not a cyclic graph
	- If not, it's cyclic

## DFS
- It's simple dfs with two more of vectors
- One is visited vector which is set when you visit any nodes
- Another one is 'inStack' vector
  - If it is set, it means you visited this node on the path
	- If it is clear, it means you did not visited this node on the path
	- To acheive this, you set it when you visit nodes and unset when you return from the node
	- We notice if it's cyclic by checking inStack when we get to the node
	  - If it is set, we know we already visited on the path which means it's cyclic
- So the solution simply can be defined like 'We can re-visit any nodes, but we must not be able to re-visit the node we stacked on the way here'

# Big O(time)
- Kahn's algorithm : O(N + M)
- DFS : O(N + M)
- Where N is the count of nodes and M is the count of edges

# Code

## Kahn's algorithm

```cpp
class Solution {
public:
    bool canFinish(int numCourses, vector<vector<int>>& prerequisites) {
        vector<int> indegree(numCourses, 0);
        vector<vector<int> > adj (numCourses);

        for(auto x : prerequisites) {
            adj[x[1]].push_back(x[0]);
            indegree[ x[0] ]++;
        }

        queue<int> q;
        for(int i = 0; i < numCourses; i++) if (indegree[i] == 0) q.push(i);

        int visited = 0;
        while(!q.empty()) {
            visited++;
            int cur = q.front();
            q.pop();

            for(auto nxt : adj[cur]) {
                indegree[nxt]--;
                if (indegree[nxt] == 0) q.push(nxt);
            }
        }
        return visited == numCourses;
    }
};
```


## DFS

```cpp
class Solution {
public:

// return if it's cyclic
bool dfs(int cur, vector<vector<int> > & adj, vector<bool>& track, vector<bool>& visited) {
    if (track[cur]) return true;
    if (visited[cur]) return false;

    visited[cur] = true;
    track[cur] = true;

    for(auto nxt : adj[cur]) {
        if (dfs(nxt, adj, track, visited)) return true;
    }

    track[cur] = false;
    return false;
}
    bool canFinish(int numCourses, vector<vector<int>>& prerequisites) {
        vector<vector<int> > adj(numCourses);
        for(auto x : prerequisites) {
            adj[x[1]].push_back(x[0]);
        }

        vector<bool> track(numCourses, false);
        vector<bool> visited(numCourses, false);
        for(int cur = 0; cur < numCourses; cur++) {
            if (dfs(cur, adj, track, visited)) return false;
        }
        return true;
    }
};
```
