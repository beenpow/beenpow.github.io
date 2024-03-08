---
layout: post
title : "Leetcode::problem(833) Find And Replace in String"
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
date: "2024-03-08"
---

# Leetcode::Find and replace in string
- [Link : Leetcode::Find and replace in string](https://leetcode.com/problems/find-and-replace-in-string/description/)

- level : medium
- 47 mins to solve

# point
- You are given a string s that you must perform k replacement operations
- Return a string after conducting possible replacement operations

# Design
- This is implementation problem, and you have to make sure to notice
  - Indicies are not sorted
	- Same indices can exist
- I forgot to check one of them which makes me to take longer time to solve
- Anyway, if we srot the given { indices, sources, targets }, it becomes an implementation problem
  - While iterating the given string s, we check if any of indices is same to the current position
	- If it matches, we check if it has same sources for certain amount of lenghts
  - If it has same, we replace
    - Otherwise, change the pointer for next indices

# Big O(time)
- TIME : max( O(KlogK), O(NK) )
- SPACE : O(N)

# Code

```cpp
class Solution {
public:

    string findReplaceString(string s, vector<int>& indices, vector<string>& sources, vector<string>& targets) {
        int SZ = sources.size();
        vector<pair<int,int> > vp(SZ);
        for(int i = 0; i < SZ; i++) vp[i] = {indices[i], i};
        
        sort(vp.begin(), vp.end());
        
        string ret = "";
        int id = 0, i = 0;

        while(id < SZ) {
            while(i <indices[ vp[id].second ]) ret += s[i++];

            // check if replacement operations is possible
            if (s.substr(i, sources[ vp[id].second ].size()) == sources[ vp[id].second ]) {
                ret += targets[ vp[id].second ];
                i += sources[ vp[id].second ].size();
            }
            id++;
        }
        while (i < s.size()) ret += s[i++];
        return ret;
    }
};
```
