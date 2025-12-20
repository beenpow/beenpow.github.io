---
layout: post
title : "Leetcode::problem spiral matrix ii"
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
date: "2025-12-19"
---

# Leetcode::spiral matrix ii
- [Link : Leetcode:spiral matrix ii](https://leetcode.com/problems/spiral-matrix-ii/description/)
- Solved, 1 2 3 0 0
- level : medium

# Problem Description
- Given a positive integer n, generate an n x n matrix filled with elements from 1 to n^2 in spiral order.

# How to solve
- It's a simulation problem where n <= 20.
- With dx and dy arrays, we can simply traverse the array by spiral way.
- If we set dx and dy arrays properly,
    - dx(0) and dy(0) means going right.
    - dx(1) and dy(1) means going down.
    - dx(2) and dy(2) means goind left.
    - dx(3) and dy(3) means going up.
- So, whenever we go over the given n x n matrix size or we visit the same place again, we change the direction.
- Simply adding 1 to the direction will make the way as sprial.
- Only thing we need to be careful is d = (d + 1) % 4, because there are only four directions and they are intentionally ordered.

# Big O (Time, Space)
- TIME : O(N^2)
- SPACE : O(N^2)

# Code

```cpp
class Solution {
public:
    bool over(int x, int y, int n){return x < 0 || y < 0 || x >= n || y >= n;}
    vector<vector<int>> generateMatrix(int n) {
        // a[x][y] != 0 -> visited
        vector<vector<int>> a(vector<vector<int>>(n, vector<int>(n, 0)));
        const int dx[] = {0, 1, 0, -1};
        const int dy[] = {1, 0, -1, 0};

        int num = 1;
        int x = 0, y = 0, d = 0;
        while (num <= n * n) {
            a[x][y] = num++;
            int nx = x + dx[d], ny = y + dy[d];
            if (over(nx, ny, n) || a[nx][ny] > 0) {
                d = (d + 1) % 4;
                nx = x + dx[d], ny = y + dy[d];
                if (over(nx, ny, n) || a[nx][ny] > 0) break;
            }
            x = nx, y = ny;
        }

        return a;
    }
};
```