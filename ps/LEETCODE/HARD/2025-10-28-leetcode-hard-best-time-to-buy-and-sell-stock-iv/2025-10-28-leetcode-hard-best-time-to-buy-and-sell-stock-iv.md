---
layout: post
title : "Leetcode::problem best time to buy and sell stock iv"
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
date: "2025-10-28"
---

# Leetcode::best time to buy and sell stock iv
- [Link : Leetcode:best time to buy and sell stock iv](https://leetcode.com/problems/best-time-to-buy-and-sell-stock-iv)
- Solved, 10 20 10 10 0
- level : hard

# Problem Description
- You are given an integer array prices where prices(i) is the price of a given stock on the i-th day, and an integer k.
- Find the maximum profit you can achieve.
- You may complete at most k transactions.

# How to solve
- The first version of this problem is famous.
- But this problem has 'k' which makes it as 'Hard'.
- To solve DP problems, first thing we need to is defining the OPT(or DP) definition.
- I defined as below.
- OPT(i, h_i, LBC_i)
    - The maximum profit when we are at position i(started from 0) and we have still LBC_i (Left buy count) count when we are h_i status.
    - To be specifically, 
        - i : index i
        - h_i : holding status (0 : no hold, 1 : hold)
        - LBC_i : Left Buy Count at index i
            - The maximum value of this is k.
            - Since buying can be done only one more time than selling, one parameter is enough to indicate how many times left to buy.
- Then we define the recurrence relation like below.
- OPT(i, h_i, LBC_i)
    - When h_i == 0 (EMPTY)
        - max
            - OPT(i-1, 0, LBC_i) // passed
            - OPT(i-1, 1, LBC_i) + price(i) // sold at price(i)
    - When h_i == 1 (HOLDING)
        - max
            - OPT(i-1, 1, LBC_i) // passed
            - OPT(i-1, 0, LBC_i + 1) - price(i) // bought at price(i)
- Now we define Base case for the OPT.
    - OPT(0, 0, k) = 0
    - OPT(0, 1, k-1) = -price(i)
    - There are only two things that we can do at index 0, buy or sell.
- Now we solve the problem based on the above things.
- There's one more thing we need to focus on, which is initializing all of OPT elements as -inf.
- Because there are only small amount of paths.
- For example, OPT(0, 1, 3) can not exist when k = 5.
    - Because we can buy at most one time at each index, 5 can only be 5 or 4. (Not 3)
- Ohter than that, it's pretty much about the recurrence relation.

# Big O (Time, Space)
- TIME : O(N * 2 * k) ~= O(Nk)
- SPACE : O(N * 2 * k) ~= O(NK)

# Code

```cpp
class Solution {
public:
#define EMPTY 0
#define HOLD 1
    
    int maxProfit(int k, vector<int>& prices) {
        int n = prices.size();
        int nInf = -1e9;
        vector<vector<vector<int>>> OPT(n, vector<vector<int>>(2, vector<int>(k + 1, nInf)));

        // base case
        OPT[0][EMPTY][k] = 0;
        OPT[0][HOLD][k-1] = -prices[0];

        // recurrence relation
        for (int i = 1; i < n; i++) {
            // LBC : Left Buy Count
            for (int LBC = k; LBC >= 0; LBC--) {
                OPT[i][EMPTY][LBC] = max(OPT[i-1][EMPTY][LBC] != nInf ? OPT[i-1][EMPTY][LBC] : nInf, OPT[i-1][HOLD][LBC] != nInf ? OPT[i-1][HOLD][LBC] + prices[i] : nInf);
                OPT[i][HOLD][LBC]  = max(OPT[i-1][HOLD][LBC] != nInf ? OPT[i-1][HOLD][LBC] : nInf,  LBC < k && OPT[i-1][EMPTY][LBC + 1] != nInf ? OPT[i-1][EMPTY][LBC + 1] - prices[i] : nInf);
            }
        }
        int ans = 0;
        for(int LBC = 0; LBC <= k; LBC++) ans = max(ans, max(OPT[n-1][EMPTY][LBC], OPT[n-1][HOLD][LBC]));
        return ans;
    }
};
```