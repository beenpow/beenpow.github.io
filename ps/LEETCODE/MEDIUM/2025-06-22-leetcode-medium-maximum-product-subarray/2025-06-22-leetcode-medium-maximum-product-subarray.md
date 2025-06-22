---
layout: post
title : "Leetcode::problem maximum product subarray"
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
date: "2025-06-22"
---

# Leetcode::maximum product subarray
- [Link : Leetcode:maximum product subarray](https://leetcode.com/problems/maximum-product-subarray/description/)
- Solved, 5 20 18 0 10
- level : medium

# Problem Description
- Given an integer array nums, find a subarray that has the largest product, and return the product.

# How to solve
- MySolution - between zeros
    - I've opted out the possibility of appearing zeros.
    - So that I can use two pointer method between zeros.
    - Applying two pointer between zeros is simple.
    - I checked the count of all negative values between the given zeros.
    - If the count is even, we have to calculate until we count all the negative values on the two pointer window.
    - If the count is odd, we have to calculate until we cound (count - 1) negative values on the two pointer window.
    - With this approach we can get the answer, but we use O(N) Space to store the position of zeros.

- EditSolution - easy DP
    - Using simple dynamic programming is incredible.
    - It only spends O(1) space.
    - We simple store maximum product and minimum product.
    - maximum product is among
        - current number
        - current number * maximum product
        - current number * minimum product
    - minimum product is among
        - current number
        - current number * maximum product
        - current number * minimum product
    - It is very simple dp, but hard to come up and prove it contains all the possible products of subarrays.

# Big O (Time, Space)
- MySolution - two pointer between zeros
    - TIME : O(N)
    - SPACE : O(N)
- EditSolution - easy DP
    - TIME : O(N)
    - SPACE : O(1)

# Code

## MySolution - two pointer between zeros

```cpp
class Solution {
public:
    long long maxProduct(vector<int>& nums, int st, int en) {
        if (st + 1 == en) return 0;

        long long ret = -1e8;
        int negCnt = 0;
        for (int i = st + 1; i < en; i++) {
            if (nums[i] < 0) negCnt++;
        }
        if (negCnt % 2 == 0) {
            ret = 1;
            for(int i = st + 1; i < en; i++) ret *= nums[i];
        } else {
            int cnt = 0, le = st + 1;
            long long curr = 1;
            for(int ri = st + 1; ri < en; ri++) {
                curr *= nums[ri];
                ret = max(ret, curr);
                if (nums[ri] < 0) cnt++;
                while (cnt == negCnt && le <= ri) {
                    if (nums[le] < 0) cnt--;
                    curr /= nums[le++];
                }
                if (le < ri)
                    ret = max(ret, curr);
            }
        }
        return ret;
    }
    int maxProduct(vector<int>& nums) {
        long long ans = -1e8;
        for(auto x : nums) ans = max((int)ans, x);

         vector<int> zeros;
         if (nums[0] != 0) nums.insert(nums.begin(), 0);
         if (nums.back() != 0) nums.push_back(0);
         for(int i = 0; i < nums.size(); i++) if (nums[i] == 0) zeros.push_back(i);


         for(int i = 0; i < zeros.size() - 1; i++) {
            ans = max(ans, maxProduct(nums, zeros[i], zeros[i+1]));
         }
         return ans;
    }
};
```

## EditSolution - easyDP

```cpp
class Solution {
public:
    int maxProduct(vector<int>& nums) {
        int mx = nums[0];
        int mn = nums[0];
        int ret = mx;

        for(int i = 1; i < nums.size(); i++) {
            auto num = nums[i];
            int temp_mx = mx;
            mx = max({num,      mx * num, mn * num});
            mn = min({num, temp_mx * num, mn * num});
            ret = max(ret, mx);
        }
        return ret;
    }
};
```