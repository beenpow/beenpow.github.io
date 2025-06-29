---
layout: post
title : "Leetcode::problem surrounded regions"
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
date: "2025-06-29"
---

# Leetcode::surrounded regions
- [Link : Leetcode:surrounded regions](https://leetcode.com/problems/surrounded-regions/description/)
- Solved, 5 5 10 5 0
- level : medium

# Problem Description
- Given an m x n matrix board containing 'X' and 'O', capture all regions that are 4-directionally surrounded by 'X'.
- A region is captured by flipping all 'O's into 'X's in that surrounded region.

# How to solve
- We can use DFS to find the regions that are 4-directionally surrounded by 'X'.
- If the region is surrounded by 'X', we can flip all 'O's into 'X's in that region.
- If the region is not surrounded by 'X', we can keep the 'O's in that region.

# Big O (Time, Space)
- Time : O(N * M)
- Space : O(N * M)

# Code

```cpp
class Solution {
public:
    int n, m;
    const int dx[4] = {-1, 0, 1, 0}, dy[4] = {0, 1, 0, -1};
    bool DFS(int x, int y, vector<vector<char>>& board, vector<vector<bool>>& visited, vector<pair<int,int>>& region) {
        region.push_back({x, y});
        visited[x][y] = true;

        bool ret = true;
        for(int d = 0; d < 4; d++) {
            int nx = x + dx[d], ny = y + dy[d];
            if (nx < 0 || ny < 0 || nx >= n || ny >= m) {
                ret = false;
                continue;
            }

            if (board[nx][ny] == 'O' && visited[nx][ny] == false) {
                ret &= DFS(nx, ny, board, visited, region);
            }
        }
        return ret;
    }

    void solve(vector<vector<char>>& board) {
        n = board.size(), m = board[0].size();
        
        vector<pair<int,int>> region;
        vector<vector<bool>> visited(n, vector<bool>(m, false));

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                if (board[i][j] == 'O' && visited[i][j] == false) {
                    region.clear();
                    bool ret = DFS(i, j, board, visited, region);
                    if (ret) {
                        for(auto [x, y] : region) board[x][y] = 'X';
                    }
                }
            }
        }
    }
};
```