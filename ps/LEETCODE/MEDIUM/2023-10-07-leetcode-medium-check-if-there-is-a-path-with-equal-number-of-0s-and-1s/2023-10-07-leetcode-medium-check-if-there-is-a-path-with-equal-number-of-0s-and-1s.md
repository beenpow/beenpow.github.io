---
layout: post
title : "Leetcode::problem(2510) Check if there is a Path with equal number of 1's and 0's"
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
date: "2023-10-07"
---

# Leetcode::Check if there is a path with equal number of 1's and 0's
- [Link : Leetcode::Check if there is a path with queal number of 1's and 0's](https://leetcode.com/problems/check-if-there-is-a-path-with-equal-number-of-0s-and-1s/description/?envType=study-plan-v2&envId=google-spring-23-high-frequency)

- level : medium

# point
- Given a m x n binary matrix, find if there's a path with equal number of 1's and 0's

# Design
- The thing to notice is that we can't solve this problem with DFS or BFS.
- It will be O(2^(NM)) because we have to re-visit cells for different paths

## O(NM * (N+M))
- This is simple design
- We just iterate every possible ways
- This is possible because, NM * (N+M) is only upto 7 figures
- We set dp(i)(j)(k) as true
  - if there is a path that has k number of 1's from (i,j) to (n-1, m-1)
- We can solve this with top-down method
  - First we set base condition for dp(n-1)(m-1)(0) or dp(n-1)(m-1)(1)
	- Then iterate down to bottom and see if there's a way from (0, 0) to (n-1, m-1) with nm/2 number of 1's in it.

## O(NM)
- This solution is tricky
- We should get the intuition that
  - If there are paths that has A number of 1's and B number of 1's, there should be ways that has x number of 1's (A <= x <= B)
- Now we can solve this problem by only stacking minimum number of 1's and maximum number of 1's
- dp(i)(j)(0) : minimum number of 1's within ways from (0,0) to (i, j)
- dp(i)(j)(1) : maximum number of 1's within ways from (0,0) to (i, j)

# Big O(time)
- O(NM * (N+M))
- O(NM)

# Code

## O(NM* (N+M)) solution

```cpp
class Solution {
public:
    bool isThereAPath(vector<vector<int>>& grid) {
        int n = grid.size(), m = grid[0].size();
        int nm = n + m - 1;
        if (nm % 2) return false;
        vector<vector<vector<int> > > dp(n + 1, vector<vector<int> >(m + 1, vector<int>(nm + 1, false)));


        // dp[i][j][L] is true, if there's a path from (i, j) to (n-1, m-1) that has L number 1's.
        if (grid[n-1][m-1])
            dp[n-1][m-1][1] = true;
        else
            dp[n-1][m-1][0] = true;

        dp[n-1][m][0] = dp[n][m-1][0] = true;

        for(int i = n-1; i >= 0; i--) {
            for(int j = m-1; j >=0; j--) {
                for(int k = 0; k <= nm; k++) {
                    if (grid[i][j]) {
                        if (k == 0)
                            dp[i][j][k] = false;
                        else
                            dp[i][j][k] = dp[i+1][j][k-1] | dp[i][j+1][k-1];
                    }
                    else {
                        dp[i][j][k] = dp[i+1][j][k] | dp[i][j+1][k];
                    }
                }
            }
        }

        return dp[0][0][nm / 2];
    }
};
```

## O(NM) solution

```cpp
class Solution {
public:
    bool isThereAPath(vector<vector<int>>& grid) {
        int n = grid.size(), m = grid[0].size();
        if ((n + m - 1) % 2) return false;
        
        int nice = (n + m) / 2;
        auto dp = vector(n + 1, vector(m + 1, vector(2, 0)));
        
        for(int i = 0; i < n; i++) {
            for(int j = 0; j < m; j++) {
                dp[i+1][j+1][0] = min(dp[i+1][j][0], dp[i][j+1][0]);
                dp[i+1][j+1][1] = max(dp[i+1][j][1], dp[i][j+1][1]);

                if (grid[i][j]) {
                    dp[i+1][j+1][0]++;
                    dp[i+1][j+1][1]++;
                }
            }
        }
        return dp[n][m][0] <= nice  && nice <= dp[n][m][1];
    }
};
```
