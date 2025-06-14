---
layout: post
title : "Leetcode::problem house robber 2"
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
date: "2025-06-14"
---

# Leetcode::house robber 2
- [Link : Leetcode:house robber 2](https://leetcode.com/problems/house-robber-ii/description/)
- Solved, algorithm 60
- level : medium

# Problem Description
- Given an integer array nums representing the amount of money of each house, return the maximum amount of money you can rob tonight without alerting the police.
- If you rob adjacent houses police will be notified.
- Houses are positioned as a circular shape.

# How to solve
- It seems a simple dynamic programming problem.
- Here's the logic that we can create to solve the problem.
    - DP(i)(0) : Maximal sum of taken money that does not include i-th house.
    - DP(i)(1) : Maximal sum of taken money that does include i-th house.
    - DP(i)(0) = max(DP(i-1)(0), DP(i-1)(1))
    - DP(i)(1) = DP(i-1)(0) + arr(i)
- But there is another problem that we need to figure out.
- The problem is that houses are positined as a circualr shape.
- So the first and the last houses are connected.
- To make up this, I've thought about using like DP(i)(3) shapes so I can have a flag if the current sum includes the first house's money or not.
- But it is not calculated that easily.
- To know if it contains the first house's money, we need to know the list of houses we rub.
- The editorial suggests a brilliant way to make this problem very simple.
- We find answer for (1~(n-1)) and (0~(n-2)), then we get the max value between them.
- By simply divide to two simple dynamic programming problems, we get the answer.

# Big O (Time, Space)
- Time : O(N)
- Space : O(1)

# Code

```cpp
class Solution {
public:
    int rob(vector<int>& nums) {
        if (nums.size() == 1) return nums[0];
        int mx1 = rob_sub(nums, 1, nums.size() - 1);
        int mx2 = rob_sub(nums, 0, nums.size() - 2);
        return max({mx1, mx2});
    }
    int rob_sub(vector<int>& nums, int st, int en) {
        int yesMoney = 0;
        int noMoney = 0;
        for(int i = st; i <= en; i++) {
            int tempYesMoney = yesMoney;
            yesMoney = noMoney + nums[i];
            noMoney = max(noMoney, tempYesMoney);
        }
        return max(yesMoney, noMoney);
    }
};
```