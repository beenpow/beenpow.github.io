---
layout: post
title : "Leetcode::problem trapping rain water ii"
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
date: "2026-01-01"
---

# Leetcode::trapping rain water ii
- [Link : Leetcode:trapping rain water ii](https://leetcode.com/problems/trapping-rain-water-ii)
- Solved, algorithm 120
- level : hard

# Problem Description
- Given m x n integer matrix heightMap representing the height of each unit cell in a 2D elevation map.
- Return the volume of water it can trap after raining.

# How to solve
- I was not able to come up with a clear solution, although I thought about two methods.
    - One starts from the lowest level of cells.
    - The other starts from the boundary of the given matrix.
- To solve this problem clearly, we need a priority queue, like min-heap.
- Also, we starts from the boundary of the given matrix.
- Because those cells can not trap water.
- Then we move keep inward of the matrix by checking adjacent neighbors.
- Because we have min-heap, we check the smallest possible cell first.
- After popping this cell, we check it's neighbors.
- If there are cells around that has shorter height, we know this cell can trap the water, amount of (current cell - neighbor cell).
- How can we assure this?
- Don't we need to check the possible boundaries of this neighbor cell to confirm it can trap water with that amount of water?
- Then answer is no.
- Because we starts from the boundary of the given matrix and we pop the smallest possible height first.
- Specifically, the neighbor cell is surrounded by cells that has bigger height. (min-heap makes it possible.)
- With the min-heap, it lets us to know the possible water height of each trap.

# Big O (Time, Space)
- TIME : O(NM * log(NM))
- SPACE : O(NM)

# Code

```cpp
class Solution {
public:
    int n, m;
    const int dx[4] = {-1, 0, 1, 0};
    const int dy[4] = {0, 1, 0, -1};
    int trapRainWater(vector<vector<int>>& heightMap) {
        n = heightMap.size(), m = heightMap[0].size();
        vector<vector<bool>> visited(n, vector<bool>(m, false));
        priority_queue<Cell> pq;

        for (int j = 0; j < m; j++) {
            pq.push(Cell(heightMap[0][j], 0, j));
            visited[0][j] = true;

            pq.push(Cell(heightMap[n-1][j], n-1, j));
            visited[n-1][j] = true;
        }
        for (int i = 1; i < n - 1; i++) {
            pq.push(Cell(heightMap[i][0], i, 0));
            visited[i][0] = true;

            pq.push(Cell(heightMap[i][m-1], i, m-1));
            visited[i][m-1] = true;
        }

        int totWater = 0;
        while(!pq.empty()) {
            Cell curr = pq.top(); pq.pop();
            int x = curr.x, y = curr.y, h = curr.height;
            for (int d = 0; d < 4; d++) {
                int nx = x + dx[d], ny = y + dy[d];
                if (nx < 0 || ny < 0 || nx >= n || ny >= m) continue;
                if (visited[nx][ny]) continue;

                int nh = heightMap[nx][ny];
                if (h > nh) totWater += h - nh;

                pq.push(Cell(max(h, nh), nx, ny));
                visited[nx][ny] = true;
            }
        }
        return totWater;
    }

private:
    class Cell {
        public:
        int height;
        int x;
        int y;

        Cell(int _h, int _x, int _y) : height(_h), x(_x), y(_y){}
        bool operator < (const Cell& other) const {
            return height >= other.height;
        }
    };
};
```