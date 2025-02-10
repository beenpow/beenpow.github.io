---
layout: post
title : "Leetcode::problem rotting oranges"
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
date: "2025-02-10"
---

# Leetcode::rotting oranges
- [Link : Leetcode:rotting oranges](https://leetcode.com/problems/rotting-oranges/description/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, 5 5 15 5 3
- level : medium

# point
- You are given m x n grid where each cell can have one of three values:
  - 0 : representing an empty cell
	- 1 : representing a fresh orange
	- 2 : representing a rotten orange
- Every minute, any fresh orange that is 4-directionally adjacent to a rotten orange becomes rotten.
- Return the minimum number of minutes that mush elapse until no cell has a fresh orange.

# Design
- Simple BFS problem.
- We should stick to the basic tho.
- I like to define each status like "EMPTY, FRESH, ROTTEN", not to be confused.
- Also, I like to define dx, dy which are the ones to be added on the (x, y)
- First of all, we stack the rotten oranges into a Q
- Then we do BFS.
- Only thing we need to consider is how many days do we have to count.
- Since there can be a -1 or 0 or 1 margin, it's important to check it perfectly with the given example.


# Big O(time)
- TIME : O(NM)
- SPACE : O(NM)

# Code

```cpp
class Solution {
public:
#define EMPTY  0
#define FRESH  1
#define ROTTEN 2
int dx[4] = {-1, 0, 1, 0};
int dy[4] = {0, -1, 0, 1};


    int n, m;
    bool over(int x, int y) {return (x < 0 || y < 0 || x >= n || y >= m);}
    int orangesRotting(vector<vector<int>>& grid) {
        n = grid.size(), m = grid[0].size();

        int FRESH_SZ = 0;

        // init
        int days = 0;
        queue<pair<int,int> > q;
        for(int i = 0; i < n; i++) for(int j = 0; j < m; j++) {
            if (grid[i][j] == ROTTEN) {
                q.push({i, j});
            } else if(grid[i][j] == FRESH) {
                FRESH_SZ++;
            }
        }

        while(!q.empty()) {
            int sz = q.size();
            while(sz--) {
                pair<int, int> p = q.front();
                q.pop();
                for(int m = 0; m < 4; m++) {
                    int nx = p.first + dx[m];
                    int ny = p.second + dy[m];
                    if (over(nx, ny)) continue;
                    if (grid[nx][ny] == FRESH) {
                        FRESH_SZ--;
                        grid[nx][ny] = ROTTEN;
                        q.push({nx, ny});
                    }
                }
            }
            if (!q.empty()) days++;
        }
        
        if (FRESH_SZ > 0) days = -1;
        return days;
    }
};
```
