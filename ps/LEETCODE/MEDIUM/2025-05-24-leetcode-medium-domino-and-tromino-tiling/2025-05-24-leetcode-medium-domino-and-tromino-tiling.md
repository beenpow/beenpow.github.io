---
layout: post
title : "Leetcode::problem domino and tromino tiling"
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
date: "2025-05-24"
---

# Leetcode::domino and tromino tiling
- [Link : Leetcode:domino and tromino tiling](https://leetcode.com/problems/domino-and-tromino-tiling/description/)
- Solved, algorithm 180
- level : medium

# point
- You have two types of tiles: a 2 x 1 domino shape and a tromino shape. You may need to use multiple tiles of one shape to cover the entire floor.
- Given an integer n, return the number of ways to tile an n x 2 board. Since the answer may be very large, return it modulo 10^9 + 7.

# Design
- It's obviously dynamic programming problem.
- We need two types of dp array.
    - dp[i] : the number of ways to tile an i x 2 board.
    - p[i] : the number of ways to tile an i x 2 board.
        - One of either lines has i cells filled.
        - The other line has i-1 cells filled.
        - So it is partially filled.
- Let's define the recurrence relation.
    - dp[i] = dp[i-1] + dp[i-2] + p[i-1] * 2
        - dp[i-1] : the number of ways to tile an i-1 x 2 board.
            - We add vertical domino to the end of the board.
        - dp[i-2] : the number of ways to tile an i-2 x 2 board.
            - We add horizontal domino (2 x 2) to the end of the board.
        - p[i-1] * 2 : the number of ways to tile an i-1 x 2 board.
            - We add vertical domino to previous board.
            - Since there can be two cases, we multiply 2.
    - p[i] = p[i-1] + dp[i-2]
        - p[i-1] : the number of ways to tile an i-1 x 2 board partially filled.
        - dp[i-2] : the number of ways to tile an i-2 x 2 board.
            - We add tromino on dp[i-2] board.
- It's important to fully understand p[i].
- p[i] means that one of either lines has i cells filled, and the other line has i-1 cells filled.
- For the line that has i-1 cells filled, we do not know where the empty cell is.
- It could be any of columns on the line that has i-1 cells filled.
- But the fact is this does not matter.
- It's great to understand the recurrence relation.

# Big O
- Dynamic programming
    - Time : O(n)
    - Space : O(n)
- Dynamic programming + optimized memory
    - Time : O(n)
    - Space : O(1)

# Code

## dynamic programming

```cpp
#define MOD 1'000'000'007

class Solution {
public:
    int numTilings(int n) {
        vector<int> dp (n + 1, 0);
        vector<int>  p (n + 1, 0);

        dp[0] = 1;
        dp[1] = 1;
        for (int i = 2; i <= n; i++) {
            dp[i] = (1L * dp[i-1] + dp[i-2] + p[i-1] * 2) % MOD;
            p[i] = (1L * p[i-1] + dp[i-2]) % MOD;
        }
        return dp[n];
    }
};
```

## dynamic programming + optimized memory

```cpp
#define MOD 1'000'000'007

class Solution {
public:
    int numTilings(int n) {
        long long dpPrev = 1L;
        long long dpCurr = 1L;
        long long fCurr  = 0L;
        for (int i = 2; i <= n; i++) {
            long long tmp = dpCurr;
            dpCurr = (dpCurr + dpPrev + fCurr * 2) % MOD;
            fCurr  = (fCurr + dpPrev) % MOD;
            dpPrev = tmp;
        }
        return dpCurr;
    }
};
```