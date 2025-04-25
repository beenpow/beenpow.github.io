---
layout: post
title : "Leetcode::problem search a 2d matrix"
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
date: "2025-04-25"
---

# Leetcode::search a 2d matrix
- [Link : Leetcode:search a 2d matrix](https://leetcode.com/problems/search-a-2d-matrix/description/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, 2 3 5 20 3
- level : medium

# point
- You are given an m*n integer matrix with the following two properties:
    - Each row is sorted in non-decreasing order.
    - The first integer of each row is greater than the last integer of the previous row.
- Given an integer target, return true if target is in matrix.

# Design
- Since there's decsription about limited time coplexity which is O(log(m * n)), I was able to come up with binary search.
- But the problem was log(m * n) part.
- Then I decided to break it down to (log(m) + log(n)).
- So, I solved with two binary search each take O(log(m)) and O(log(m)).
- It is treaky to handle a whole row, so it may take some time to wisely deal with the exceptional cases.
- Anyway, we can also solve the problem with one binary search too by utilizing 'mid' as a value that has row and column together.

# Big O(time)
- TIME : O(log(NM))
- SPACE : O(1)

# Code

## Two BS
```cpp
class Solution {
public:
    bool searchMatrix(vector<vector<int>>& matrix, int target) {
        int n = matrix.size(), m = matrix[0].size();

        int row = -1;
        int lo = 0, hi = n - 1;
        while(lo < hi) {
            int mid = (lo + hi) >> 1;
            if (matrix[mid][0] <= target && target <= matrix[mid][m-1]) {
                row = mid;
                break;
            }
            else if (matrix[mid][m-1] < target) lo = mid + 1;
            else hi = mid - 1;
        }
        // It means, either n is 0 or the last calculated lo and hi are row.
        if (row == -1) row = lo;

        int col = -1;
        lo = 0, hi = m - 1;
        while(lo < hi) {
            int mid = (lo + hi) >> 1;
            if (matrix[row][mid] == target) {
                col = mid;
                break;
            }
            else if (matrix[row][mid] > target) hi = mid - 1;
            else lo = mid + 1;
        }
        // It means, either m is 0 or the last calculated lo and hi are row.
        if (col == -1) col = lo;
        return matrix[row][col] == target;
    }
};
```

## One BS

```cpp
class Solution {
public:
    bool searchMatrix(vector<vector<int>>& matrix, int target) {
        int n = matrix.size(), m = matrix[0].size();
        int lo = 0, hi = n * m - 1;
        while(lo <= hi) {
            int mid = (lo + hi) >> 1;
            int x = matrix[mid/m][mid%m];
            if (x == target) return true;
            else if (x < target) lo = mid + 1;
            else hi = mid - 1;
        }
        return false;
    }
};
```