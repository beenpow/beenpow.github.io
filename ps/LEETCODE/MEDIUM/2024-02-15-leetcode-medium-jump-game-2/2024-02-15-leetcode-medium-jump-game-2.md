---
layout: post
title : "Leetcode::problem(45) Jump Game 2"
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
date: "2024-02-15"
---

# Leetcode::Jump Game 2
- [Link : Leetcode::Jump Game 2](https://leetcode.com/problems/jump-game-ii/description/)

- level : medium

# point
  - You are given an 0-indexed array of integers nums of length n
  - You are initially positioned at nums[0]
  - Return the minimum number of jumps to reach nums[n-1]

# Design
  * It’s necessary to know both ways of solving the problem
  * The main idea of solving this problem is that we don’t have to make perfect steps to index (n-1), we only need to use fastest jumps as much we can take
    * -> It’s same meaning to get to the index (n-1) as fast as possible
  * Naive
    * We know that
      * 1 <= nums.length <= 10^4
      * 0 <= nums[i] <= 1000
    * It means that we can visit every index and try every possible ways of jumps
    * Then, only remain the minimum number of jumps at each index
  * Optimal
    * At index i, we are able to jump 1 to nums[i]
    * So we have nums[i] opportunies to get to the farthest index from current range
    * Which means, we check every opportunities and see how much farther we can go

# Big O(time)
- Time
  - Naive : O(NM)
	- Optimal : O(N)

# Code

## Optimal

```cpp
class Solution {
public:
    int jump(vector<int>& nums) {
        int sz = nums.size();
        int bigJump = 0;

        int bestFar = 0, bigJumpEnd = 0;
        for(int i = 0; i < sz - 1 ; i++) {
            bestFar = max(bestFar, i + nums[i]);

            // from previous bigJumpEnd to current bigJumpEnd
            // We've tried every opportunity, and we want to decide only one of them as choseon one
            // It's not necessary to pick one but it means like that.
            if (i == bigJumpEnd) {
                bigJump++;
                bigJumpEnd = bestFar;
            }
        }
        return bigJump;
    }
};
```


## Naive

```cpp
class Solution {
public:
    int jump(vector<int>& nums) {
        int sz = nums.size();
        vector<int> dp(sz, 1e8);
        dp[0] = 0;
        for(int i = 0; i < sz; i++) {
            int mx = nums[i];
            for(int j = 1; j <= mx && i + j < sz; j++) {
                dp[i + j] = min(dp[i + j], dp[i] + 1);
            }
        }
        return dp[sz-1];
    }
};
```
