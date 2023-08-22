---
layout: post
title : "Leetcode::problem(1020) Number of Enclaves"
subtitle: "Leetcode ps medium"
type: "Leetcode medium"
medium: true
ps: true
leetcode: true
text: true
author: "beenpow"
post-header: true
header-img: "https://www.spotebi.com/wp-content/uploads/2019/01/one-day-day-one-workout-motivation-spotebi.jpg"
order: 1
date: "2023-08-21"
---

# Leetcode::Number of Enclaves
- [Link : Leetcode::Number of Enclaves](https://leetcode.com/problems/number-of-enclaves/?envType=study-plan-v2&envId=google-spring-23-high-frequency)

- level : medium

# point
- Find the number of land cells in grid for which we cannot walk off the boundary of the grid in any number of moves
  - 1 : land, 0 : sea

# Design
- Since we are able to walk on the boundary, we can find any land by doing bfs from here
- Then we cound the lands that we couldn't reach

# Big O(time)
- O(NM)


# Code

```cpp
int n, m;
const int dx[4] = {-1, 0, 1, 0}, dy[4] = {0, 1, 0, -1};
priority_queue<pair<int,int> > pq;
class Solution {
public:
    int numEnclaves(vector<vector<int>>& grid) {
        n = grid.size(), m = grid[0].size();
        vector<vector<int> > visited(n, vector<int>(m, false));
        
        auto bfs = [](int sx, int sy, vector<vector<int>> grid, vector<vector<int>>& vis) {
            vis[sx][sy] = true;
            pq.push({sx, sy});
            while(!pq.empty()) {
                int x = pq.top().first, y = pq.top().second; pq.pop();
                for(int k = 0; k < 4; k++) {
                    int nx = x + dx[k], ny = y + dy[k];
                    if (nx < 0 || ny < 0 || nx >= n || ny >= m) continue;
                    if (grid[nx][ny] == 0 || vis[nx][ny]) continue;
                    vis[nx][ny] = true;
                    pq.push({nx, ny});
                }
            }
            return 0;
        };

        for(int j = 0; j < m; j++) {
            if (grid[0][j]   && visited[0][j]   == false) bfs(0,   j, grid, visited);
            if (grid[n-1][j] && visited[n-1][j] == false) bfs(n-1, j, grid, visited);
        }
        for(int i = 0; i < n; i++) {
            if (grid[i][0]  && visited[i][0]   == false) bfs(i,   0, grid, visited);
            if (grid[i][m-1]&& visited[i][m-1] == false) bfs(i, m-1, grid, visited);
        }

        int ans = 0;
        for(int i = 0; i < n; i++) {
            for(int j = 0; j < m; j++) if (grid[i][j] == 1 && visited[i][j] == false) ans++;
        }
        return ans;
    }
};
```
