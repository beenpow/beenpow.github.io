---
layout: post
title : "Leetcode::problem count complete subarrays in an array"
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
date: "2025-05-19"
---

# Leetcode::count complete subarrays in an array
- [Link : Leetcode:count complete subarrays in an array](https://leetcode.com/problems/count-complete-subarrays-in-an-array/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, 5 15 10 0 30
- level : medium

# point
- You are given an array of positive integers.
- Return the number of complete subarrays.
- A subarray is complete if it contains all the integers in the array.

# Design
- Brute Force
    - We can find every subarray if we iterate all the subarray.
    - Since the length of the given array is 1000, it's enough to iterate all the subarray.
    - Plus, we can use a unordered_map to check if the subarray is complete.
- Sliding Window
    - It's very similar to the brute force.
    - When we find a complete subarray, we can add the number of the remaining elements to the answer.
    - And, we can shrink the window from the left side.


# Big O

- Brute Force
    - TIME : O(N^2)
    - SPACE : O(N)
- Sliding Window
    - TIME : O(N)
    - SPACE : O(N)

# Code

## Brute Force

```cpp
class Solution {
public:
    int countCompleteSubarrays(vector<int>& nums) {
        int n = nums.size();
        unordered_map<int,int> mp;
        for(auto x: nums) mp[x]++;
        const int totSz = mp.size();

        int ans = 0;
        for(int st = 0; st < n; st++) {
            mp.clear();
            for(int ri = st; ri < n; ri++) {
                mp[nums[ri]]++;
                if (mp.size() == totSz) {
                    ans += (n - ri);
                    break;
                }
            }
        }
        return ans;
    }
};
```

## Sliding Window

```cpp
class Solution {
public:
    int countCompleteSubarrays(vector<int>& nums) {
        unordered_map<int,int> mp;
        for(auto x : nums) mp[x]++;
        const int totSz = mp.size();
        mp.clear();

        int le = 0, ans = 0, n = nums.size();
        for(int ri = 0; ri < n;) {
            mp[nums[ri]]++;
            ri++;

            while (mp.size() == totSz) {
                ans += (n - ri + 1);
                mp[nums[le]]--;
                if (mp[nums[le]] == 0) mp.erase(nums[le]);
                le++;
            }
        }

        return ans;
    }
};
```