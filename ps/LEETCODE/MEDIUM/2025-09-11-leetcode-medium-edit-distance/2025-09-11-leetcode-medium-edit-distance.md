---
layout: post
title : "Leetcode::problem edit distance"
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
date: "2025-09-11"
---

# Leetcode::edit distance
- [Link : Leetcode:edit distance](https://leetcode.com/problems/edit-distance/description/)
- Solved, algorithm 120
- level : medium

# Problem Description

# How to solve


# Big O (Time, Space)
- Recursive : O(3^N)
- DP - Top-down : O(N^2)
- DP - Bottom-up : O(N^2)

# Code

## Recursive

```cpp
class Solution {
public:

    int findMinDist(string word1, string word2, int idx1, int idx2) {
        if (idx1 == 0) return idx2;
        if (idx2 == 0) return idx1;
        if (word1[idx1 - 1] == word2[idx2 - 1]) {
            return findMinDist(word1, word2, idx1 - 1, idx2 - 1);
        } else {
            int mn = min ( min (
                findMinDist(word1, word2, idx1 - 1, idx2 - 1),
                findMinDist(word1, word2, idx1, idx2 - 1)), 
                findMinDist(word1, word2, idx1 - 1, idx2)
             ) + 1;
            return mn;
        }
    }
    int minDistance(string word1, string word2) {
        int ret = findMinDist(word1, word2, word1.size(), word2.size());
        return ret;
    }
};
```

## DP - Top-down

```cpp
class Solution {
public:
    vector<vector<int>> dp;
    int findMinDist(string word1, string word2, int idx1, int idx2) {
        if (idx1 == 0) return idx2;
        if (idx2 == 0) return idx1;
        if (dp[idx1][idx2] != -1) return dp[idx1][idx2];

        int ret = 0;
        if (word1[idx1 - 1] == word2[idx2 - 1]) {
            ret = findMinDist(word1, word2, idx1 - 1, idx2 - 1);
        } else {
            ret = min ( min (
                findMinDist(word1, word2, idx1 - 1, idx2 - 1),
                findMinDist(word1, word2, idx1, idx2 - 1)), 
                findMinDist(word1, word2, idx1 - 1, idx2)
             ) + 1;
        }
        return dp[idx1][idx2] = ret;
    }
    int minDistance(string word1, string word2) {
        dp = vector<vector<int>>(word1.size() + 1, vector<int>(word2.size() + 1, -1));
        int ret = findMinDist(word1, word2, word1.size(), word2.size());
        return ret;
    }
};
```

## DP - Bottom-up

```cpp
class Solution {
public:
    int minDistance(string word1, string word2) {
        int n = word1.size(), m = word2.size();
        if (n == 0) return m;
        if (m == 0) return n;

        int MX = max(n, m) + 1;
        vector<vector<int>> dp(n+1, vector<int>(m+1, MX));

        dp[0][0] = 0;
        for (int i = 1; i < n; i++)
            dp[i][0] = dp[i-1][0] + 1;
        for (int j = 1; j < m; j++) 
            dp[0][j] = dp[0][j-1] + 1;
        
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= m; j++) {
                if (word1[i - 1] == word2[j - 1]) {
                    dp[i][j] = dp[i-1][j-1];
                } else {
                    dp[i][j] = min(min(
                        dp[i-1][j] + 1,    // delete
                        dp[i][j-1] + 1),   // insert
                        dp[i-1][j-1] + 1); // replace
                }
            }
        }
        return dp[n][m];
    }
};
```