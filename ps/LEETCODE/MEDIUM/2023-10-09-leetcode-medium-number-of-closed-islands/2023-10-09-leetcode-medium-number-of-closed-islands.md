---
layout: post
title : "Leetcode::problem(1254) Number of Closed Islands"
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
date: "2023-10-09"
---

# Leetcode::Number of Closed Islands
- [Link : Leetcode::Number of Closed Islands](https://leetcode.com/problems/number-of-closed-islands/)

- level : medium

# point
- Given a 2D grid consists of 0s (land) and 1s (water).
- An island is a maximal 4-directionally connected group of 0s and a closed island is an island totally (all left, top, right, bottom) surrounded by 1s.

# Design
- To solve the problem I need to find how many islands exist
- Each island has connected lands
- The key to distinguish between just island and closed island is edge
- If there is at least one land on edge, the islands that has this land can not be the closed island.
- Rest of the logic is just dfs.


# Big O(time)
- O(NM)

# Code

```cpp
#define LAND 0
#define WATER 1
class Solution {
public:
    const int dx[4] = {-1, 0, 1, 0}, dy[4] = {0, 1, 0, -1};
    bool isValid(int x, int y){return (x >= 0 && x < n && y >= 0 && y < m);}
    bool isSurroundedByWater(int x, int y, vector<vector<int>> grid, 
                                    vector<vector<bool>>& visited) {
        bool ret = true;
        visited[x][y] = true;
        for(int i = 0; i < 4; i++) {
            int nx = x + dx[i], ny = y + dy[i];
            if(isValid(nx, ny) == false) {
                ret = false;
                continue;
            }
            if (grid[nx][ny] == LAND && visited[nx][ny] == false) {
                ret &= isSurroundedByWater(nx, ny, grid, visited);
            }
        }
        return ret;
    }
    int n, m;
    int closedIsland(vector<vector<int>>& grid) {
        int count = 0;
        n = grid.size(), m = grid[0].size();
        vector<vector<bool>> visited(n, vector<bool>(m, false));
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                if (grid[i][j] == LAND && visited[i][j] == false) {
                    count++;
                    if (!isSurroundedByWater(i, j, grid, visited))
                        count--;
                }
            }
        }
        return count;
    }
};
```
