---
layout: post
title : "Leetcode::problem snakes and ladders"
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
date: "2025-06-18"
---

# Leetcode::snakes and ladders
- [Link : Leetcode:snakes and ladders](https://leetcode.com/problems/snakes-and-ladders/)
- Solved, 5 60 30 13 60
- level : medium

# Problem Description
- You are given an n x n integer matrix board where the cells are labeled from 1 to n^2.
- You start on square 1 of the board.
- Return the least number of dice rolls required to reach the square n^2.

# How to solve
- It seems a simple simulation problem with BFS.
- But manipulating row and colum values can be treaky.
- Important fact that we have to deal with is that 'you only take a snake or ladder at most once per dice roll'.
- Due to this, there can be two different ways to get to a point 'X'.
    - One comes from a normal dice roll.
    - Another comes from a normal dice roll and a ladder or snake.
- To handle this, we can use a vector like, visited(n * n)(normal or normal with ladder or snake).
- But if we handle the case of using a ladder or snake wisely, we only need n * n vector for visited.
- Specifically, we need to mark either of them, not both.
    - Mark on the one that came out from a dice roll.
    - Mark on the end of ladder or snake after a dice roll.
- Then the rest of the problem is bfs.

# Big O (Time, Space)
- TIME : O(N^2)
- SPACE : O(N^2)

# Code

```cpp
class Solution {
public:
    int snakesAndLadders(vector<vector<int>>& board) {
        int n = board.size();

        queue<int> q;
        vector<int> dist(n * n + 1, -1);

        q.push(1);
        dist[1] = 0;
        const int TARGET = n * n;

        int cnt = 0;
        while(!q.empty()) {
            int curr = q.front(); 
            q.pop();

            bool isRightWay = (((curr-1) / n) %2 == 0);
            int r = n - 1 - ((curr-1) / n);
            int c = isRightWay ? (curr - 1) % n : n - 1 - ((curr - 1) % n);

            for(int dx = 1; dx <= 6; dx++) {
                int next = curr + dx;
                bool isNextRightWay = (((next-1) / n) %2 == 0);
                int nr = n - 1 - ((next-1) / n);
                int nc = isNextRightWay ? (next - 1) % n : n - 1 - ((next - 1) % n);
                if (next > TARGET ) continue;

                int destination = board[nr][nc] != -1 ? board[nr][nc] : next;

                if (dist[destination] == -1) {
                    dist[destination] = dist[curr] + 1;
                    q.push(destination);
                }

            }
        }
        return dist[n * n];
    }
};
```