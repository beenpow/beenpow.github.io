---
layout: post
title : "Leetcode::problem minimum number of operations to make elements in array distinct"
subtitle: "Leetcode ps easy"
type: "Leetcode easy"
easy: true
ps: true
leetcode: true
text: true
author: "beenpow"
post-header: true
header-img: ""
order: 1
date: "2025-04-13"
---

# Leetcode::minimum number of operations to make elements in array distinct
- [Link : Leetcode:minimum number of operations to make elements in array distinct](https://leetcode.com/problems/minimum-number-of-operations-to-make-elements-in-array-distinct/description/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, 3 15 5 0 5
- level : easy

# point
- You are given an integer array nums. You need to ensure that the elements in the array are distinct.
    - Operation : Remove 3 elements from the beginning of the array. If the array has fewer than 3 elements, remove all remaining elements.

# Design
- There can be many solutions to solve this problem with O(N).
- To make things easier we need to count from the back. (Refer to the second code)
- Plus, if we utilize the fact the input number range which is from 0 to 100, we can check if a number is used once or not.


# Big O(time)
- TIME : O(N)
- SPACE : O(N)

# Code

```cpp
class Solution {
public:
    int minimumOperations(vector<int>& nums) {
        int n = nums.size();

        map<int,int> mp;
        vector<int> cnt(n+1, 0);
        for(int i = n - 1; i >= 0; i--) {
            mp[nums[i]]++;
            cnt[i] = max(mp[nums[i]], cnt[i+1]);
        }

        int i = 0, ret = 0;
        while(i < n) {
            if (i < n && cnt[i] > 1) {
                i += 3;
                ret++;
            }
            else if (i + 1 < n && cnt[i+1] > 1) {
                i += 3;
                ret++;
            }
            else if (i + 2 < n && cnt[i+2] > 1) {
                i += 3;
                ret++;
            } else {
                break;
            }
        }

        return ret;
    }
};
```

```cpp
class Solution {
public:
    int minimumOperations(vector<int>& nums) {
        vector<bool> seen(101, false);
        for(int i = nums.size() -1; i >= 0; i--) {
            if (seen[nums[i]])
                return i/3 + 1;
            seen[nums[i]] = true;
        }
        return 0;
    }
};
```