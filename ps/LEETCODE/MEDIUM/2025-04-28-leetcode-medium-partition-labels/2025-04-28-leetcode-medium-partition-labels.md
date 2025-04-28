---
layout: post
title : "Leetcode::problem partition labels"
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
date: "2025-04-28"
---

# Leetcode::partition labels
- [Link : Leetcode:partition labels](https://leetcode.com/problems/partition-labels/description/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, 5 15 10 4 5
- level : medium

# point
- You are given a string s.
- We want you to parition the string into as many parts as possible so that each letter appears in at most one part.
- Return a list of integers representing the size of these parts.

# Design
- We store each alphabet's last appeared positions.
- After that we iterate the given string s.
- While we iterate, we keep the maximum index of end points from the appeared alphabets.
- If current index is same as the maximum value, it means that end points in the partition are equal to or less than the current index.
- So we update the length of the partion.
- Repeate above implementation until the end.

# Big O(time)
- TIME : O(N)
- SPACE : O(M)
    - M is a contant size as 26.

# Code

```cpp
class Solution {
public:
#define END 1
    vector<int> partitionLabels(string s) {
        vector<int> ans;

        // Update start and end point of english letters
        vector<int> en(26, -1);
        int n = s.size();
        for(int i = 0; i < n; i++) {
            // update en.
            en[s[i] - 'a']= i;
        }

        int prev = 0, mxEndPoint = 0;
        for(int i = 0; i < n; i++) {
            // add idx
            int idx = (s[i] - 'a');
            mxEndPoint = max(mxEndPoint, en[idx]);

            if (i == mxEndPoint) {
                ans.push_back(i - prev + 1);
                prev = i + 1;
            }
        }
        return ans;
    }
};
```