---
layout: post
title : "Leetcode::problem(417) Pacific Atlantic Water Flow"
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
date: "2024-03-29"
---

# Leetcode::Pacific Atlantic Water Flow
- [Link : Leetcode::Pacific Atlantic Water Flow](https://leetcode.com/problems/pacific-atlantic-water-flow/description/)

- level : medium

# point
- There is an m x n rectangluar island that borders both the Pacific OCean and Atlantic Ocean
- The Pacfic Ocean touches the island's left and top edges, and the Atlantic Ocean touches the island's right and bottom edges
- Return a 2D list of grid coordinates result where result[i] = [r_i, c_i] denotes that rain water can flow from cell (r_i, c_i) to both the Pacific and Atlantic oceans.

# Design
- We need to find cells where rain can fall through them to the both oceans.
- It's possible to approach this problem as it is
- However, it's easier consider it like, Ocean water goes up to the cells
- For example, let's say ocean water's heights are same as 0
- Since it's 0, it can move to adjacent cells if the cells has greater or equal to '0'.
- For above approach, BFS can do the job
- Since we need to check both Oceans, doing BFS twice will make the result

# Big O(time)
- O(NM)

# Code

```cpp
const int dx[] = {-1, 0, 1, 0}, dy[] = {0, 1, 0, -1};
class Solution {
public:
    int n, m;
    queue<pair<int,int>> q;
    vector<vector<int>> a;
    vector<vector<bool>> visited;
    void VISIT(const int x, const int y) {
        visited[x][y] = true;
        a[x][y]++;
    }
    void bfs(const vector<vector<int>>& heights) {
        while(!q.empty()) {
            pair<int,int> cur = q.front(); q.pop();
            for(int d = 0; d < 4; d++) {
                int nx = cur.first + dx[d], ny = cur.second + dy[d];
                if (nx < 0 || ny < 0 || nx >= n || ny >= m) continue;
                if (visited[nx][ny]) continue;
                if (heights[cur.first][cur.second] <= heights[nx][ny]) {
                    q.push({nx, ny});
                    VISIT(nx, ny);
                }
            }
        }
    }
    vector<vector<int>> pacificAtlantic(vector<vector<int>>& heights) {
        n = heights.size(), m = heights[0].size(); // 1 <= m, n
        a = vector<vector<int>> (n, vector<int>(m, 0));

        // Pacific Ocean
        visited = vector<vector<bool>>(n, vector<bool>(m, false));
        for(int i = 0; i < n; i++) {q.push({i, 0}); VISIT(i, 0);}
        for(int j = 1; j < m; j++) {q.push({0, j}); VISIT(0, j);}
        bfs(heights);

        // Atlantic Ocean
        visited = vector<vector<bool>>(n, vector<bool>(m, false));
        for(int i = 0; i < n; i++)   {q.push({i, m - 1}); VISIT(i, m-1);}
        for(int j = 0; j < m-1; j++) {q.push({n-1, j});   VISIT(n-1, j);}
        bfs(heights);

        vector<vector<int>> ret;
        for(int i = 0; i < n; i++) for(int j = 0; j < m; j++) if (a[i][j] == 2) ret.push_back({i, j});

        return ret;
    }
};
```
