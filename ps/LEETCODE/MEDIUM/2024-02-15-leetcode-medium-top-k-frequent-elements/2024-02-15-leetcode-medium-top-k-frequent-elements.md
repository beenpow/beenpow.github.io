---
layout: post
title : "Leetcode::problem(347) Top K Frequent Elements"
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
date: "2024-02-15"
---

# Leetcode::Top K Frequent Elements
- [Link : Leetcode::Top K Frequent Elements](https://leetcode.com/problems/top-k-frequent-elements/description/)

- level : medium

# point
- Given an integer array nums and an integer k, return k most frquent elements


# Design
  - The thing that is very important for this problem is that it is guaranteed that the answer is unique.
  - With this base, we can approach the problem by using map
  - With a map, we are able to know each number’s frquency
  - Then we gether members from the map and push it to a vector as {value, key}
  - Since it’s necessary to sort the array as frequency order, we need to push as {value, key} order. (not {key, value} order )
  - After sorting the vector, use only top k members


# Big O(time)
- Time : O(NlogN)

# Code

```cpp
class Solution {
public:
    vector<int> topKFrequent(vector<int>& nums, int k) {
        map<int,int> mp;
        for(int i = 0; i < nums.size(); i++)
            mp[nums[i]]++;
        
        vector<pair<int,int> > vp;
        for(auto it = mp.begin(); it != mp.end(); it++) {
            vp.push_back({it->second, it->first});
        }

        sort(vp.rbegin(), vp.rend());

        vector<int> ret;
        for(int i = 0; i < k; i++) {
            ret.push_back(vp[i].second);
        }
        return ret;
    }
};
```
