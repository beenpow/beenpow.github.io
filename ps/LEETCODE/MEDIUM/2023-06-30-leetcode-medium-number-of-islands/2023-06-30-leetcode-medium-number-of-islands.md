---
layout: post
title : "Leetcode::problem(200) Number of Islands"
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
date: "2023-06-30"
---

# Leetcode::Number of Islands
- [Link : Leetcode::Number of Islands](https://leetcode.com/problems/number-of-islands/description/?envType=study-plan-v2&envId=apple-spring-23-high-frequency)

- level : medium

# point
- Find the number of islands.
  - Island is a land surrounded by water
- land : 1
- water : 0

# Design
- We can simply find islands by bfs or dfs
- The only thing we need to make sure is having a 'visited' array not to visit several times on a cell

# Big O(time)
- O(NM)

# Code

```cpp
class Solution {
public:
    int n, m;
    bool visited[309][309];
    vector<vector<char> > v;
    const int dx[4] = {-1, 0, 1, 0}, dy[4] = {0, 1, 0, -1};

    void dfs(int x, int y) {
        visited[x][y] = true;
        for(int d = 0; d < 4; d++) {
            int nx = x + dx[d], ny = y + dy[d];
            if (nx < 0 || ny < 0 || nx >= n || ny >= m) continue;
            if (!visited[nx][ny] && v[nx][ny] == '1') {
                dfs(nx, ny);
            }
        }
    }
    int numIslands(vector<vector<char>>& grid) {
        v = grid;
        n = grid.size(), m = grid[0].size();

        int ret = 0;
        for(int i = 0; i < n; i++) {
            for(int j = 0; j < m; j++) {
                if (!visited[i][j] && grid[i][j] == '1') {
                    ret++;
                    dfs(i, j);
                }
            }
        }
        return ret;
    }
};
```
