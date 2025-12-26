---
layout: post
title : "Leetcode::problem n queens"
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
date: "2025-12-25"
---

# Leetcode::n queens
- [Link : Leetcode:n queens](https://leetcode.com/problems/n-queens/description/)
- Solved, 10 30 15 15 5
- level : hard

# Problem Description
- The n-queens puzzle is the problem of placing n queens on an n x n chessboard such that no two queens attach each other.
- Given an integer n, return all distinct solutions to the n-queens puzzle.
- You may return the answer in any order.

# How to solve
- It takes some time to figure out below factors.
    - We can not do brute force naively, because n x n matrix has n^2 cells.
    - We have to somehow put a queen on a designated cell by our rule.
- What if we put a queen that can not be attacked from previous queens?
- How do we make a solution with above approach?
- The answer is,
    - Every time we put a queen, we check columns and rows and diagonal, and anti-diagnoal.
    - So, if there is no queens on the paths, we decide to put a queen at a cell.
    - To acheive this, we bring visited structure so we can check which column, which diagonal, whcih anti-diagonal is taken so far.
- With this approach, whenever we get to the end point(end row), that's one of the answer.

# Big O (Time, Space)
- TIME : O(N!)
- SPACE : O(N^2)

# Code

```cpp
class Solution {
public:
    void dfs(int n, int row, vector<string>& curr, vector<bool>& visitedCol, vector<bool>& lDiag, vector<bool>& rDiag, vector<vector<string>>& ret) {
        if (row == n) {
            ret.push_back(curr);
            return;
        }
        for (int j = 0; j < n; j++) if (visitedCol[j] == false) {
            // Checking right Diagonal
            int rD = row - j;
            if (rD <= 0) rD *= -1;
            else rD += (n - 1);
            if (rDiag[rD]) continue;

            // Checking left Diagonal
            int lD = row + j;
            if (lDiag[lD]) continue;

            visitedCol[j] = true;
            rDiag[rD] = true;
            lDiag[lD] = true;
            curr[row][j] = 'Q';
            dfs(n, row + 1, curr, visitedCol, lDiag, rDiag, ret);
            curr[row][j] = '.';
            lDiag[lD] = false;
            rDiag[rD] = false;
            visitedCol[j] = false;
        }
    }
    vector<vector<string>> solveNQueens(int n) {
        vector<vector<string>> ret;
        vector<string> poss;
        string tmp = "";
        for(int i = 0; i < n; i++) tmp += '.';
        for(int i = 0; i < n; i++) {
            poss.push_back(tmp);
        }

        vector<bool> visitedCol(n, false), rDiag(n, false), lDiag(n, false);
        dfs(n, 0, poss, visitedCol, rDiag, lDiag, ret);
        return ret;
    }
};
```