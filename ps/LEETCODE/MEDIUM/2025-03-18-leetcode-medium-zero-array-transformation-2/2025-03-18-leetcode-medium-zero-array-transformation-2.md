---
layout: post
title : "Leetcode::problem zero array transformation 2"
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
date: "2025-03-18"
---

# Leetcode::zero array transformation 2
- [Link : Leetcode:zero array transformation 2](https://leetcode.com/problems/zero-array-transformation-ii/description/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, 5 60 25 0 30
- level : medium

# point
- You are given an integer array nums of length n and a 2d array queries, where queries[i] = [l_i, r_i, val_i]
- Each queries[i], you can decrement the value at each index in the range [l_i, r_i].
- Return the minimum possible non-negative value of k, such that after processing the first k queries in sequence, nums becomes a Zero Array.
- If no such k exists, retun -1.

# Design
- At first I was thking about using Segment Tree.
- But Segment Tree can not update values in a range, only able to update a value.
- Second approach using binary search is a quite similar method of solving 'zero array transformation 1'.
  - Basically, we use 'mid' queires and see it is enough to make nums to '0'.
- Thir approach is very interesting which is 'line sweeping'.
- We sweep both nums and queries at the same time.
- Specifically, we iterate the given nums.
- Meanwhile, we iterate the queries until the summation of values at this index is enough to make current value of nums to '0'.
- Also, we make sure to store the queried values on a vector.

# Big O(time)
- N : nums.size()
- M : q.size()

- Binary Search
  - TIME : O(logM * max(N, M))
	- SPACE : O(N)
- Line sweep
  - TIME : O(max(N, M))
	- SPACE : O(N)

# Code

## Binary Search

```cpp
class Solution {
public:
    bool possible(int k, vector<int>& nums, vector<vector<int>>& q) {
        vector<int> cnt(nums.size() + 1, 0);
        map<int, int> ri;
        for (int i = 0; i < k; i++) {
            int le = q[i][0], ri = q[i][1], value = q[i][2];
            cnt[le] += value;
            cnt[ri + 1] -= value;
        }
        int goThrough = 0;
        for (int i = 0; i < nums.size(); i++) {
            goThrough += cnt[i];
            if (nums[i] > goThrough) {
                return false;
            }
        }
        return true;
    }
    int minZeroArray(vector<int>& nums, vector<vector<int>>& queries) {
        int ret = queries.size() + 1;
        int le = 0, ri = queries.size();
        while(le <= ri) {
            int mid = (le + ri) / 2;
            if (possible(mid, nums, queries)) {
                ri = mid - 1;
                ret = min(ret, mid);
            }
            else le = mid + 1;
        }
        return ret == (queries.size() + 1) ? -1 : ret;
    }
};
```

## Line sweep

```cpp
class Solution {
public:
    int minZeroArray(vector<int>& nums, vector<vector<int>>& queries) {
        vector<int> cnt(nums.size() + 1, 0);
        int qId = 0, sum = 0, i = 0;
        for (i = 0; i < nums.size(); i++) {
            sum += cnt[i];
            while (sum < nums[i]) {
                if (qId == queries.size()) return -1;
                int left = queries[qId][0], right = queries[qId][1], val = queries[qId][2];
                cnt[left] += val;
                cnt[right + 1] -= val;

                if (left <= i && i < right + 1) sum += val;
                qId++;
            }
        }
        return qId;
    }
};
```
