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
- Given two strings word1 and word2, return the minimum number of operations required to convert word1 to word2.
- You have the following three operations permitted on a word:
    - Insert a character
    - Delete a character
    - Replace a character

# How to solve
- At first glance, we can think about recursive solution.
- We choose the operations that can be applied to the word1 and word2 in every step.
- Before that, we need to make sure how we do the operations.
- Let me clarify three operations.
    - Let's say we have two strings word1 as "apc" and word2 as "aqe".
    - Also, we compare the strings from the back.
    - For the 'insert' operation,
        - We insert 'e' to the end of word1.
        - Now, word1 is "apce" and word2 is "aqe".
        - Then we call next recursive functions with "apc" and "aq", because "e" is already matched.
        - Why don't we skip this part and pretend we added 'e' to the end of word1?
        - Then we don't actually need to 'insert' on this step.
        - In a nutshell, for insert operation for "apc" and "aqe", we just call next recursive functions with "apc" and "aq".
    - For the 'delete' operation,
        - We delete 'c' from the end of word1.
        - Now, word1 is "ap" and word2 is "aqe".
        - Then we call next recursive functions with "ap" and "aqe".
    - For the 'replace' operation,
        - We replace 'c' with 'e' in word1.
        - Now, word1 is "ape" and word2 is "aqe".
        - Then we call next recursive functions with "ape" and "aqe".
        - Why don't we skip this part and pretend we replaced 'c' with 'e' in word1?
        - Then we don't actually need to 'replace' on this step.
        - In a nutshell, for replace operation for "apc" and "aqe", we just call next recursive functions with "ap" and "aq".
- With this information, we simply to math on each recursive function.
- Furthermore, when we draw a tree of recursive calls, we can see that there are many overlapping subproblems.
- So, we can use DP to solve this problem.
- Since we start from the end of the strings, we can use a 2D array to store the minimum number of operations required to convert word1 to word2.
- As a similar way, we can use Bottom-up DP to solve this problem.
- By solving smallest subproblems, we can solve the original problem.
- Specifically, we draw 2D array and fill it with the minimum number of operations required to convert word1 to word2.
- Let's say we have "apc" and "aqe".
- Then we can fill the 2D array as follows.

|       | ""| "a" | "aq" | "aqe" |
|---    |---|---  |---   |---|
| ""    | 0 | 1   | 2    | 3 |
| "a"   | 1 | 0   | 1    | 2 |
| "ap"  | 2 | 1   | 1    | 2 |
| "apc" | 3 | 2   | 2    | 2 |

- The answer is 2.
- dp(i, j) is the minimum number of operations.
    - dp(i, j) = min(dp(i-1, j-1), dp(i, j-1), dp(i-1, j)) + 1 if word1(i-1) != word2(j-1)
        - dp(i-1, j-1) : replace
        - dp(i, j-1) : insert
        - dp(i-1, j) : delete
- So, we can solve this problem with DP.


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