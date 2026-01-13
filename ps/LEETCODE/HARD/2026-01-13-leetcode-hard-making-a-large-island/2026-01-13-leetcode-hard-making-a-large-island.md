---
layout: post
title : "Leetcode::problem making a large island"
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
date: "2026-01-13"
---

# Leetcode::making a large island
- [Link : Leetcode:making a large island](https://leetcode.com/problems/making-a-large-island)
- Solved, 5 15 10 26 5
- level : hard

# Problem Description
- You are given an n x n binary matrix grid. You are allowed to change at most one 0 to be 1.
- Return the size of the largest island in grid after applying this operation.
- An island is a 4-directionally connected group of 1s.

# How to solve
- Finding islands can be done by DFS.
- When we find a island, I changed it's given value which is 1 to it's islands number.
- Also, I stored each island's size.
- After that I tried with depth = 2 BFS to merge islands.
- But this process is unnecessary.
- Because we don't have to find a merge point from each island's adjacent water.
- Reversely, We can simply find adjacent islands from each water.
- With this approach, it becomes very simple.

# Big O (Time, Space)
- TIME : O(NM)
- SPACE : O(NM)

# Code

```cpp
class Solution {
public:
    const int dx[4] = {-1, 0, 1, 0};
    const int dy[4] = {0, 1, 0, -1};

    int n, m;
    vector<vector<pair<int, int>>> components;
    void dfs(int x, int y, vector<vector<int>>& grid, vector<vector<bool>>& vis,
             const int compoNo) {
        vis[x][y] = true;
        grid[x][y] = -compoNo - 1;
        components[compoNo].push_back({x, y});
        for (int d = 0; d < 4; d++) {
            int nx = x + dx[d], ny = y + dy[d];
            if (nx < 0 || ny < 0 || nx >= n || ny >= m)
                continue;
            if (grid[nx][ny] == 0 || vis[nx][ny])
                continue;
            dfs(nx, ny, grid, vis, compoNo);
        }
    }
    
    int largestIsland(vector<vector<int>>& grid) {
        int cnt0 = 0;
        n = grid.size(), m = grid[0].size();
        vector<vector<bool>> visited(n, vector<bool>(m, false));

        int cnt = 0;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                if (grid[i][j] == 0)
                    cnt0++;

                if (grid[i][j] == 1 && !visited[i][j]) {
                    components.resize(components.size() + 1);
                    dfs(i, j, grid, visited, cnt++);
                }
            }
        }
        if (cnt0 == 0)
            return components[0].size();
        if (cnt0 == n * m)
            return 1;

        int ans = 0;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                unordered_set<int> unq;
                int sum = 1;
                if (grid[i][j] == 0) {
                    for (int d = 0; d < 4; d++) {
                        int nx = i + dx[d], ny = j + dy[d];
                        if (nx < 0 || ny < 0 || nx >= n || ny >= m) continue;
                        if (grid[nx][ny] < 0 ) {
                            int compoNo = -grid[nx][ny] - 1;
                            if (unq.find(compoNo) != unq.end()) continue;
                            sum += components[compoNo].size();
                            unq.insert(compoNo);
                        }
                    }
                }
                ans = max(ans, sum);
            }
        }


        return ans;
    }
};
```