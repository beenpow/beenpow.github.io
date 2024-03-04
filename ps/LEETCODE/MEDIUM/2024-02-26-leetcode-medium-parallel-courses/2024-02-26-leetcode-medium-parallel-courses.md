---
layout: post
title : "Leetcode::problem(1136) Parallel Courses"
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
date: "2024-02-26"
---

# Leetcode::Parallel Courses
- [Link : Leetcode::Parallel Courses](https://leetcode.com/problems/parallel-courses/description/)

- level : medium
- 20mins to solve

# point
  - You are given an integer n, which indicates that there are n courses labeled from 1 to n.
  - You are also given an array relations where relations[i] = [prevCourse, nextCourse], representing a prerequisite relationship between course prevCourse and nextCourse.
  - prevCourse has to be taken before nextCourse
  - return the minimum number of semesters needed to take all courses. If there is no possible way to take all the courses, return -1

# Design
  - This problem is telling us about prerequisite courses which comes down to ‘Directted Acyclic Graph’.
  - To be able to take all the courses of directed graph, the graph must not have cycle.
  - Let’s suppose that there’s no cycle, then the problem is narrowed down to solving ‘DAG’ problem.
  - When it ‘DAG’ problem and we are able to use ‘Topological sort’
  - One way of doing topological sort is like below.
    - Count inorder and outorder count for each node
    - Put every node that has no inorder count into queue, because they have to prerequisite nodes now.
    - Pop each node from the queue
      - Delete the edge between current one and connected ones, and if any of connected ones becoming to have no inorder edge put this one to queue
  - While doing above work, we are able to notice if there’s cycle by checking below factor.
    - How many nodes have we used from the queue
  - Since it’s DAG, all nodes should be visited, otherwise there is at least one cycle.
  - Also, it’s necessary to check the depth of nodes because we need to return how many semesters take

# Big O(time)
- Time : O(VE) where V stands for the number of nodes, E stands for the number of edges
- Space : O(N)

# Code

```cpp
class Solution {
public:
    int minimumSemesters(int n, vector<vector<int>>& relations) {
        queue<int> q;
        vector<vector<int> > graph(n+1);

        // count inorder and outorder of each node
        vector<int> _in (n + 1, 0), _out(n + 1, 0);
        for(auto x : relations) {
            // x[0] -> x[1]
            _in[x[1]]++;
            _out[x[0]]++;
            graph[x[0]].push_back(x[1]);
        }

        // find any nodes that has zero inorder
        for(int i = 1; i < n + 1; i++) if (_in[i] == 0) {
            q.push(i);
        }

        int countNodes = 0, countDepth = 0;
        while(!q.empty()) {
            countDepth++;
            int sz = q.size();
            while(sz--) {
                countNodes++;
                int x = q.front(); q.pop();
                for(int i = 0; i < graph[x].size(); i++) {
                    int y = graph[x][i];
                    _out[x]--;
                    _in[y]--;
                    if (_in[y] == 0) q.push(y);
                }
            }
        }
        return countNodes < n ? -1 : countDepth;
    }
};
```
