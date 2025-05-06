---
layout: post
title : "Leetcode::problem partition equal subset sum"
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
date: "2025-05-06"
---

# Leetcode::partition equal subset sum
- [Link : Leetcode:partition equal subset sum](https://leetcode.com/problems/partition-equal-subset-sum/description/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, algorithm 90
- level : medium

# point
- Given an integer array nums, return true if you can parition the array into two subsets such that the sum of the elements in both subsets is equal or false otherwise.

# Design
- We are required to check if there is a subset that can make the half of the total sum.
- Because, there is no such comment, like 'use consecutive numbers', we know that it has to be dynamic programming if there is no certain tricks.
- The first memoization tree for the dp that I thought about was
    - DP(N)(SubSetSum)
    - It looks good, but I thought about using n-children tree.
    - So, there are N-children on a root.
        - ex) SubSetSum - a(1), SubSetSum - a(2), ...
    - This method make things hard.
- Here's what Editorial suggests.
- It's a binary tree when we think about all the nodes we would visit with dfs.
- So, it's either using a(i) or not.
- Since it's dp problem, we can solve with both top-down and bottom-up ways.
- Plus, using only 1d array seems incredible too.
- Because we only refer to the previous memory only, we only need 1d array.
- Other that these factors, it's typical dynamic programming problem.

# Big O(time)
- N : nums.size();
- M : subSetSum(upto 200 * 100)
- DP - topdown
    - TIME : O(NM)
    - SPACE : O(NM)

- DP - bottomup
    - TIME : O(NM)
    - SPACE : O(NM)

- DP - bottmup - using 1d array
    - TIME : O(NM)
    - SPACE : O(M)

# Code

## DP - topdown

```cpp
class Solution {
public:
    bool dfs(vector<int>& nums, vector<vector<optional<bool>>>& memo, int idx, int subSetSum) {
        if (subSetSum == 0) return true;
        if (subSetSum < 0 || idx == 0) return false;
        if (memo[idx][subSetSum] != nullopt) return (memo[idx][subSetSum] == true);
        bool result = dfs(nums, memo, idx-1, subSetSum) | dfs(nums, memo, idx-1, subSetSum - nums[idx-1]);
        memo[idx][subSetSum] = result;
        return result;
    }

    bool canPartition(vector<int>& nums) {
        int subSetSum = 0;
        for(auto x : nums) subSetSum += x;
        if (subSetSum %2) return false;

        subSetSum /= 2;
        int n = nums.size();

        vector<vector<optional<bool>>> memo(n + 1, vector<optional<bool>>(subSetSum + 1, nullopt));
        return dfs(nums, memo, n-1, subSetSum);
    }
};
```

## DP - bottomup

```cpp
class Solution {
public:
    bool canPartition(vector<int>& nums) {
        int subSetSum = 0;
        for(auto x : nums) subSetSum += x;
        if (subSetSum %2) return false;
        subSetSum /=2 ;

        int n = nums.size();
        vector<vector<bool>> memo(n+1, vector<bool>(subSetSum+1, false));
        memo[0][0] = true;
        for (int i = 1; i <= n; i++) {
            for (int j = 0; j < subSetSum+1; j++) {
                if (j >= nums[i-1])
                    memo[i][j] = memo[i-1][j-nums[i-1]] || memo[i-1][j];
                else 
                    memo[i][j] = memo[i-1][j];
            }
        }

        return memo[n][subSetSum];
    }
};
```

## DP - bottomup - using 1D array

```cpp
class Solution {
public:
    bool canPartition(vector<int>& nums) {
        int subSetSum = 0;
        for(auto x : nums) subSetSum += x;
        if (subSetSum %2) return false;
        subSetSum /=2 ;

        int n = nums.size();
        vector<bool>memo(subSetSum+1, false);
        memo[0] = true;
        for (auto curr : nums) {
            for (int j = subSetSum; j >= curr; j--) {
                memo[j] = memo[j] || memo[j - curr];
            }
            // no need to do memo[j] = memo[j] for (j < curr), since they are not changed it goes as same value.
        }

        return memo[subSetSum];
    }
};
```