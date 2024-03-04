---
layout: post
title : "Leetcode::problem(36) Valid Sudoku"
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
date: "2023-07-03"
---

# Leetcode::Valid Sudoku
- [Link : Leetcode::Valid Sudoku](https://leetcode.com/problems/valid-sudoku/description/?envType=study-plan-v2&envId=apple-spring-23-high-frequency)

- level : medium

# point
- A 9x9 sudoku board is given.
- Find it is valid one

# Design
- For checking if is valid or not, we need to count how many same numbers appear
- Obvously, there shouldn't be any same numbers on the same row, on the same column, on the same 3x3 box
- Now we brute force with above concept with a map to check if there's any same numbers popped up

# Big O(time)
- O(NM)

# Code

```cpp
class Solution {
public:

    bool check(vector<vector<char> > board, int stx, int sty) {
        map<char, int>  mp;
        for(int i = stx; i < stx + 3; i++) {
            for(int j = sty; j < sty + 3; j++) if (board[i][j] != '.') {
                if (mp.find(board[i][j]) != mp.end()) return false;
                mp[board[i][j]]++;
            }
        }
        return true;
    }
    bool isValidSudoku(vector<vector<char>>& board) {
        int n = board.size(), m = board[0].size();
        map<char,int> mp;
        // row
        for(int i = 0; i < n; i++) {
            mp.clear();
            for(int j = 0; j < m; j++) if (board[i][j] != '.') {
                if (mp.find(board[i][j]) != mp.end()) return false;
                mp[board[i][j]]++;
            }
        }

        // column
        for(int j = 0; j < m; j++) {
            mp.clear();
            for(int i = 0; i < n; i++) if (board[i][j] != '.') {
                if (mp.find(board[i][j]) != mp.end()) return false;
                mp[board[i][j]]++;
            }
        }
        
        // sub box
        for(int i = 0; i < 3; i++) {
            for(int j = 0; j < 3; j++) {
                if (check(board, i * 3, j * 3) == false) return false;
            }
        }
        return true;
    }
};
```
