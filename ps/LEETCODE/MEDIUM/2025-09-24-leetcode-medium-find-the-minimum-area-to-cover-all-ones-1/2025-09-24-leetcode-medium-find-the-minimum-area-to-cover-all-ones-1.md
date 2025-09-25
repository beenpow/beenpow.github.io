---
layout: post
title : "Leetcode::problem find the minimum area to cover all ones 1"
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
date: "2025-09-24"
---

# Leetcode::find the minimum area to cover all ones 1
- [Link : Leetcode:find the minimum area to cover all ones 1]()
- Solved, 3 3 3 0 0
- level : medium

# Problem Description
- You are given a 2D binary array grid. Find a rectangle with horizontal and vertical sides with the smallest area, such that all the 1's in grid lie inside this rectangle.
- Return the minimum possible area of the rectangle.

# How to solve
- For this problem, we can simply find the answer by brute force.
- If we iterate the entire given matrix, and keep updating the minimum and maximum rows and colums that has '1' at the cell.
- So this will only take one full iteration.
- However, I've tried with at most four full iterations.
- What I come up with is iterating the given matrix from four diffrent edges.
- Simply, finding the leftmost point, rightmost point, topmost point and bottommost point.
- If we find the cell has '1', we stop iterating for that specific process.
- So it can save sometime in some cases, but not that much sometimes.

# Big O (Time, Space)
- TiME
    - O(NM)
- SPACE
    - O(1)

# Code

```cpp
class Solution {
public:
    int getFirstRowFromTop(vector<vector<int>>& grid, int n, int m) {
        for (int i = 0; i < n; i++) for (int j = 0; j < m; j++) if (grid[i][j]) {
            return i;
        }
        return -1;
    }
    int getFirstRowFromBottom(vector<vector<int>>& grid, int n, int m) {
        for (int i = n-1; i >= 0; i--) for (int j = 0; j < m; j++) if (grid[i][j]) {
            return i;
        }
        return -1;
    }
    int getFirstColFromLeft(vector<vector<int>>& grid, int n, int m) {
        for (int j = 0; j < m; j++) for (int i = 0; i < n; i++) if (grid[i][j]) {
            return j;
        }
        return -1;
    }
    int getFirstColFromRight(vector<vector<int>>& grid, int n, int m) {
        for (int j = m-1; j >= 0; j--) for (int i = 0; i < n; i++) if (grid[i][j]) {
            return j;
        }
        return -1;
    }
    int minimumArea(vector<vector<int>>& grid) {
        int n = grid.size(), m = grid[0].size();
        int rmn = -1, rmx = -1, cmn = -1, cmx = -1;
        rmn = getFirstRowFromTop(grid, n, m);
        rmx = getFirstRowFromBottom(grid, n, m);
        cmn = getFirstColFromLeft(grid, n, m);
        cmx = getFirstColFromRight(grid, n, m);

        return (rmx - rmn + 1) * (cmx - cmn + 1);
    }
};
```