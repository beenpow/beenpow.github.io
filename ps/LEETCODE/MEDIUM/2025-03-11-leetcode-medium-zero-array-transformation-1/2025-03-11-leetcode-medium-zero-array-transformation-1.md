---
layout: post
title : "Leetcode::problem zero array transformation 1"
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
date: "2025-03-11"
---

# Leetcode::zero array transformation 1
- [Link : Leetcode:zero array transformation 1](https://leetcode.com/problems/zero-array-transformation-i/description/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, 2 7 3 0 30
- level : medium

# point
- You are given an integer array nums of length n and 2d array queires, where queries[i] = [l_i, r_i]
  - Decrement the values in the range of [l_i, r_i] indices by 1.
- Return true if it is possible to transform nums into a Zero Array after processing all the queries sequentially, otherwise return false.

# Design
- Single Pass
  - It is incredible way and used very often.
	- We can think a query like, open and close.
	- Whenever we open we increase 1 at the index of le.
	- Whenever we close we decrease 1 at the next index of ri.
	- Then we calculate prefix sum to know how many queires are opened at an index.
- with Sort
  - I've solved with this approach.
	- After sorting the given queires, we can calculate how many queries contain a index.
	- To achieve that, we maintain the r_i groups in a map, then it's time to close the query, subtract them.

# Big O(time)
- Single pass
  - Time : max(O(N), O(Q))
	- Space : max(O(N), O(Q))
- with Sort
  - Time : max(O(NlogQ), O(QlogQ)
  - Space : O(Q)

# Code
## single pass

```cpp
class Solution {
public:
    bool isZeroArray(vector<int>& nums, vector<vector<int>>& queries) {
        vector<int> v(nums.size() + 1);
        for(int i = 0; i < queries.size(); i++) {
            v[queries[i][0]]++;
            v[queries[i][1] + 1]--;
        }
        vector<int> pSum(nums.size() + 1);
        pSum[0] = v[0];
        for(int i = 1; i < nums.size(); i++) pSum[i] = pSum[i-1] + v[i];
        for(int i = 0; i < nums.size(); i++) if (nums[i] > pSum[i]) return false;
        return true;
    }
};
```

## with Sort

```cpp
class Solution {
public:
    bool isZeroArray(vector<int>& nums, vector<vector<int>>& queries) {
        int n = nums.size(), qSz = queries.size();
        sort(queries.begin(), queries.end());

        int qId = 0;
        int inTheRangeCount = 0;
        map<int,int> theRanges;
        for(int i = 0; i < n; i++) {
            while(qId < qSz && queries[qId].front() == i) {
                inTheRangeCount++;
                theRanges[queries[qId].back()]++;
                qId++;
            }
            if (nums[i] > inTheRangeCount) return false;

            auto it = theRanges.begin();
            if (it != theRanges.end() && it->first == i) {
                inTheRangeCount -= it->second;
                theRanges.erase(it);
            }
        }
        return true;
    }
};
```
