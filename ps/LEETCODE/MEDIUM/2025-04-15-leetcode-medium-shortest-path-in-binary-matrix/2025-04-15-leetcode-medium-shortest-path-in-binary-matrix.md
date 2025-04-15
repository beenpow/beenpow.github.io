---
layout: post
title : "Leetcode::problem shortest path in binary matrix"
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
date: "2025-04-15"
---

# Leetcode::shortest path in binary matrix
- [Link : Leetcode:shortest path in binary matrix](https://leetcode.com/problems/shortest-path-in-binary-matrix/description/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, 5 5 5 0 60
- level : medium

# point
- Given an n x n binary matrix grid, return the length of the shortest clear path in the matrix.
- A clear path in a binary matrix is a path from the top-left cell to the bottom-right cell.

# Design
- It could be solved with a simple BFS.
- The only thing we need to care about is that we need to change the value from the given grid to engrave the fact we visited certain cells.

# Big O(time)
- N : number of cells in the grid.
- TIME : O(N)
- SPACE : O(N)

# Code

```cpp
class Solution {
public:
    int shortestPathBinaryMatrix(vector<vector<int>>& grid) {
        int n = grid.size(), m = grid[0].size();
        if (grid[0][0] != 0 || grid[n-1][m-1] != 0) return -1;

        const int dx[] = {-1, 0, 1, 0, -1, 1, -1, 1};
        const int dy[] = {0, 1, 0, -1, -1, 1, 1, -1};
        queue<pair<int,int>> q;
        q.push({0, 0});

        int ret = 1;
        while(!q.empty()) {
            int sz = q.size();
            while(sz--) {
                int x = q.front().first, y = q.front().second;
                q.pop();
                if (x == n - 1 && y == m - 1) return ret;

                for(int i = 0; i < 8; i++) {
                    int nx = x + dx[i];
                    int ny = y + dy[i];
                    if (nx < 0 || ny < 0 || nx >= n || ny >= m) continue;
                    if (grid[nx][ny] == 0) {
                        grid[nx][ny] = 1;
                        q.push({nx, ny});
                    }
                }
            }
            ret++;
        }
        return -1;
    }
};
```