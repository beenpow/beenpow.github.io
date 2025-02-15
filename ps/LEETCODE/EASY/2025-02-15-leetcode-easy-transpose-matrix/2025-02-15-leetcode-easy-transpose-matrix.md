---
layout: post
title : "Leetcode::problem transpose matrix"
subtitle: "Leetcode ps easy"
type: "Leetcode easy"
easy: true
ps: true
leetcode: true
text: true
author: "beenpow"
post-header: true
header-img: ""
order: 1
date: "2025-02-15"
---

# Leetcode::transpose matrix
- [Link : Leetcode:transpose matrix](https://leetcode.com/problems/transpose-matrix/description/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, 5 3 2 0 0
- level : easy

# point
- Given a 2D integer array matrix, return the transpose of matrix.

# Design
- The thing we need to notice is that the length of columns and rows can be different.
- If they are same, we can solve this problem in-place.
- Otherwise, we create a vector and put the transposed values by iterating the given vector.


# Big O(time)
- TIME : O(NM)
- SPACE : O(NM)

# Code

```cpp
class Solution {
public:
    vector<vector<int>> transpose(vector<vector<int>>& matrix) {
        int n = matrix.size(), m = matrix[0].size();
        vector<vector<int>> ret(m, vector<int>(n));
        for(int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                ret[j][i] = matrix[i][j];
            }
        }
        return ret;
    }
};
```
