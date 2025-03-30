---
layout: post
title : "Leetcode::problem length of longest fibonacci subsequence"
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
date: "2025-03-30"
---

# Leetcode::length of longest fibonacci subsequence
- [Link : Leetcode:length of longest fibonacci subsequence]()
- Solved, 3 10 5 0 97
- level : medium

# point
- Given a strictly increasing array arr of positive integers forming a sequence, return the length of the longest Fibonacci-like subsequence of arr.
  - Fibonacci-like if:
  - n >= 3, x(i) + x(i+1) == x(i+2) for all i + 2 <= n
- If one does not exist, return 0.

# Design
- Important factor for this problem is that if we find the first x(i) and x(i+1), we can find x(i+2), x(i+3),,, sequentially.
- Because x(i+2) is equal to x(i) + x(i+1).

## Brute force
- While brute forcing the given array with x(i) and x(j), if there is a number in the array as x(i) + x(j), we follow the sequence to count the length.

## Dynamic programming
- We can use N^2 space to utilize Dynamic Programming.
- If we know x(i) and x(i+1) and have counted afterward, we know what's the length from this point.
- So we store this length here, and if we get here again we re-use the stored value which is the point of dp.
- To achieve this goal, we iterate i and j with nested for-loops. (i < j)
- And we try to find prevI which is previous number in a sequence of fibonacci that matches a(prevI) + a(i) == a(j).
- So we get the diff (a(j) - a(i)), and if we have stored this diff in a map, we know that there is a value that matches.
- As a result, dp(i)(j) = dp(prevI)(i) + 1.

## Optimized Dynamic programming
- There is a simpler way to use dynamic programming without using a map to find prevI. (prevI < i < j)
- If we use two-pointer method, it enalbes us to achieve the goal.
- We iterate with an index as j. (prevI < i  < j)
- And we set prevI as index 0, i as index j - 1.
- Now we can wisely modify prevI and I while filling the dynamic programming structure.
- if a(prevI) + a(i) > a(j), i--.
- If a(prevI) + a(i) < a(j), prevI++.
- If a(prevI) + a(i) == a(j), dp(i)(j) = dp(prevI)(i) + 1.
- Such a clever way to solve the problm!


# Big O(time)
- N : length of the given arr
- M : the largest number in arr.
  - Finding all the subsequence from a starting triplet takes O(logM).
  - Because a maximum value can be 1e9 which has 43 terms of fibonacci members.
  - So the maximum value of logM is 43 for this problem.

- Brute force
  - Time : O(N^2logM)
  - Space : O(N)

- Dynamic Programming
  - Time : O(N^2)
  - Space : O(N^2)

- Optimized Dynamic Programming
  - Time : O(N^2)
  - Space : O(N^2)

# Code

## Brute force

```cpp
class Solution {
public:
    int countTillEnd(int x, int y, unordered_map<int,int>& a) {
        int ret = 2;
        while(1) {
            int z = x + y;
            if (a.find(z) == a.end()) break;
            ret++;
            x = y;
            y = z;
        }
        return ret;
    }
    int lenLongestFibSubseq(vector<int>& arr) {
        int ans = 0;
        unordered_map<int,int> a;
        for(int i = 0; i < arr.size(); i++) a[arr[i]] = 1;
        for(int i = 0; i < arr.size(); i++) {
            for(int j = i + 1; j < arr.size(); j++) {
                if (a.find(arr[i] + arr[j]) != a.end()) {
                    ans = max(ans, countTillEnd(arr[i], arr[j], a));
                }
            }
        }
        return ans;
    }
};
```

## Dynamic Programming

```cpp
class Solution {
public:
    int lenLongestFibSubseq(vector<int>& arr) {
        int n = arr.size(), ans = 0;

        unordered_map<int,int> valToIdx;
        vector<vector<int>> dp (n, vector<int>(n, 0));

        // prevI < i < j
        for(int j = 0; j < n; j++) {
            valToIdx[arr[j]] = j;
            for(int i = 0; i < j; i++) {
                int diff = arr[j] - arr[i];
                int prevI = (valToIdx.find(diff) == valToIdx.end()) ? -1 : valToIdx[diff];
                if (diff < arr[i] && prevI >= 0) {
                    dp[i][j] = dp[prevI][i] + 1;
                } else {
                    dp[i][j] = 2;
                }
                ans = max(ans, dp[i][j]);
            }
        }
        return ans > 2 ? ans : 0;
    }
};
```

## Optimized Dynamic Programming

```cpp
class Solution {
public:
    int lenLongestFibSubseq(vector<int>& arr) {
        int n = arr.size();
        vector<vector<int>> dp(n, vector<int>(n, 0));

        int ans = 0;
        // start + end = curr
        for(int curr = 2; curr < n; curr++) {
            int start = 0;
            int end = curr - 1;
            while(start < end) {
                int pairSum = arr[start] + arr[end];
                if (pairSum > arr[curr]) {
                    end--;
                } else if (pairSum < arr[curr]) {
                    start++;
                } else {
                    dp[end][curr] = dp[start][end] + 1;
                    ans = max(ans, dp[end][curr]);
                    end--;
                    start++;
                }
            }
        }
        return ans == 0 ? 0 : ans + 2;
    }
};
```