---
layout: post
title : "Leetcode::problem(48) Rotate Image"
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
date: "2023-11-08"
---

# Leetcode::Rotate Image
- [Link : Leetcode::Rotate Image](https://leetcode.com/problems/rotate-image/description/)

- level : medium

# point
- n x n 2D matrix is given, rotate the matrix in-place.

# Design
- As a naive way, we can use 1/4 split method
- We only iterate around 1/4 size of the given matrix and swap related indices
- For example,
	- original index : (i, j)
	- 90  degree turned position : (j, n-i-1)
	- 180 degree turned position : (n-i-1, n-j-1)
	- 270 degree turned position : (n-j-1, i)
- It's easy to shift above four values
- Just one thing to remind is the length of the row.
  - If you make this values same as the length of the column, you'll get WA.
	- It should be shorted than colum size when it comes to n is odd number.


- As a elegant way, did you notice that the answer is same as (digonal swap -> left,right swap) matrix ?
- This is amazing!

# Big O(time)
- O(N^2)

# Code

## Naive way

```cpp
class Solution {
public:
#define a matrix
#define d0   [i][j]
#define d90  [j][n-i-1] 
#define d180 [n-i-1][n-j-1]
#define d270 [n-j-1][i]
    void rotate(vector<vector<int>>& matrix) {
        // use n, rowSz, colSz to make the code have clear view.
        int n = matrix.size();
        int rowSz = (n%2 ? n/2 : (n+1) / 2);
        int colSz = (n + 1) / 2;
        for(int i = 0; i < rowSz; i++) {
            for(int j = 0; j < colSz; j++) {
                // 0`   : a[i]    [j]
                // 90`  : a[j]    [m-i-1] 
                // 180` : a[n-i-1][m-j-1]
                // 270` : a[n-j-1][i]
                
                // 270 -> 0, 180 -> 270, 90 -> 180, backup -> 90
                /*
                int backup      = a d0;
                a d0   = a d270;
                a d270 = a d180;
                a d180 = a d90;
                a d90  = backup;
                */
                swap(a d0, a d90);
                swap(a d0, a d270);
                swap(a d180, a d270);
                
            }
        }
    }
};
```

## Elegant way

```cpp
class Solution {
public:
#define a matrix
    void rotate(vector<vector<int>>& matrix) {
        int n = matrix.size();
        for(int i = 0; i < n; i++) {
            for(int j = i+1; j < n; j++) {
                swap(a[i][j], a[j][i]);
            }
        }
        for(int i = 0; i < n; i++) {
            for(int j = 0; j < n/2; j++) {
                swap(a[i][j], a[i][n-j-1]);
            }
        }
    }
};
```
