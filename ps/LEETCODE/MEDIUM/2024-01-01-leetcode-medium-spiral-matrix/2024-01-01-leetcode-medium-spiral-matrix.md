---
layout: post
title : "Leetcode::problem(54) Spiral Matrix"
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
date: "2024-01-01"
---

# Leetcode::Spiral Matrix
- [Link : Leetcode::Spiral Matrix](https://leetcode.com/problems/spiral-matrix/description/)

- level : medium

# point
- Given an m x n matrix, return all elements of the matrix in spiral order

# Design
- There can be many ways to solve this problem
- But I think using DFS is the easiest way
- The only thing we need to focus while using dfs is direction
- Whenever the head of a path hits a wall, it has to change it's direction by following order
  - right -> down -> left -> up -> right -> ...


# Big O(time)
- O(NM)

# Code

```cpp
class Solution {
public:
int n, m;
int dx[4] = {0, 1, 0, -1};
int dy[4] = {1, 0, -1, 0};
vector<vector<int> > visit;
vector<int> ret;
bool over(int x, int y){return (x < 0 || y < 0 || x >= n || y >= m);}
    void dfs(int dir, int x, int y, vector<vector<int>> matrix) {
        visit[x][y] = true;
        ret.push_back(matrix[x][y]);

        for(int i = 0; i < 2; i++) {
            int nx = x + dx[dir], ny = y + dy[dir];
            if (!over(nx, ny) && visit[nx][ny] == false) {
                dfs(dir, nx, ny, matrix);
                break;
            }

            dir = (dir + 1) % 4;
        }

    }
    vector<int> spiralOrder(vector<vector<int>>& matrix) {
        n = matrix.size();
        m = matrix[0].size();

        visit = vector<vector<int> > (n, vector<int>(m, false));

        dfs(0, 0, 0, matrix);
        return ret;
    }
};
```
