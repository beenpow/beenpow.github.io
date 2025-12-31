---
layout: post
title : "Leetcode::problem shortest distance from all buildings"
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
date: "2025-12-31"
---

# Leetcode::shortest distance from all buildings
- [Link : Leetcode:shortest distance from all buildings](https://leetcode.com/problems/shortest-distance-from-all-buildings)
- Solved, 5 10 7 0 5
- level : hard

# Problem Description
- You are given an m x n grid of values 0, 1, or 2, where:
    - Each 0 marks an empty land that you can pass by freely
    - Each 1 marks a building that you cannot pass through
    - Each 2 marks an obstacle that you cannot pass through
- Return the shortest travel distance for such a house.

# How to solve
- Based on the constraints, m and n are up to 50.
- So, it's kind of simulation problem with BFS.
- There are a few ways to do BFS.
    - Starting from every empty cell.
    - Starting from every building cell.
- But they will have same result.
- Only thing we can optimize other than just running the BFS is the memory.
- Because the given grid has only 0, 1, or 2, we can utilize this vector to work as 'counting' or 'visiting' check.
    - For example, to solve this problem we need to make sure if every building can visit this current empty cell.
    - To know that, we need to check the count of paths comes from each building.
    - If we count them as deducting 1 from the grid, grid will be below 0 only if the cell was empty originally.
    - So if the grid value * -1 is equal to the building numbers this cell can be approached from all the buildings.

# Big O (Time, Space)
- TIME : O(N^2 x M^2)
- SPACE : O(NM)

# Code

```cpp
class Solution {
public:
    int n, m;
    const int dx[4] = {-1, 0, 1, 0};
    const int dy[4] = {0, 1, 0, -1};

    void BFS(int sx, int sy, vector<vector<int>>& grid, vector<vector<int>>& sum) {
        vector<vector<bool>> visited(n, vector<bool>(m, false));
        queue<pair<int,int>> q;
        q.push({sx, sy});
        visited[sx][sy] = true;
        // no need to count on the building spot : (X) cnt[sx][sy]++;

        int dist = 0;
        while(!q.empty()) {
            dist += 1;
            int sz = q.size();
            while(sz--) {
                int x = q.front().first;
                int y = q.front().second;
                q.pop();

                for (int d = 0; d < 4; d++) {
                    int nx = x + dx[d], ny = y + dy[d];
                    if (nx < 0 || ny < 0 || nx >= n || ny >= m) continue;
                    if (visited[nx][ny] || grid[nx][ny] > 0) continue;
                    q.push({nx, ny});
                    visited[nx][ny] = true;
                    grid[nx][ny]--;
                    sum[nx][ny] += dist;
                }                
            }
        }
    }
    int shortestDistance(vector<vector<int>>& grid) {
        n = grid.size(), m = grid[0].size();
        vector<vector<int>> sum(n, vector<int>(m, 0));

        // 1. BFS from all the buildings.
        int cntBuildings = 0;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                if (grid[i][j] == 1) {
                    cntBuildings++;
                    BFS(i, j, grid, sum);
                }
            }
        }

        int ret = 50 * 50 * 50 * 50;
        // 2. Find min sum from all the empty spots.
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                if (grid[i][j] < 0) {
                    if (grid[i][j] == cntBuildings) {
                        ret = min(ret, sum[i][j]);
                    }
                }
            }
        }
        if (ret == 50 * 50 * 50 * 50) return -1;
        else return ret;
    }
};
```