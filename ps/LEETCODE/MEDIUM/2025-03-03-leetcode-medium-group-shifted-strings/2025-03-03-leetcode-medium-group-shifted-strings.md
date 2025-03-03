---
layout: post
title : "Leetcode::problem group shifted strings"
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
date: "2025-03-03"
---

# Leetcode::group shifted strings
- [Link : Leetcode:group shifted strings](https://leetcode.com/problems/group-shifted-strings/description/?envType=company&envId=google&favoriteSlug=google-three-months)
- Solved, 5 5 5 0 5
- level : medium

# point
- You are given an array of strings, groupt together all strings[i] that belong to the same shifting sequence.
  - Right shift, Left shift.
- You may return the answer in any order.

# Design
- There can be several ways to solve this problem.
- To solve this problem, it's necessary to find a common value from each string.
- To achieve that, I've used map as a data structure.
- I calculated shifted counts of strings[i], so before the shifts, the first element of the string is 'a'.
- Then I used the string that starts with 'a' as a hashkey for mapping strings.

# Big O(time)
- N = strings.length
- K = strings[i].length
- TIME : O(NK)
- SPACE : O(NK)


# Code

```cpp
class Solution {
public:
    int ALPHABETS = 26;
    vector<vector<string>> groupStrings(vector<string>& strings) {
        vector<vector<string>> ret;
        map<string, vector<string>> msv;
        for(auto str : strings) {
            string ori = str;
            int cnt = str[0] - 'a';
            for(int i = 0; i < str.size(); i++) {
                ori[i] = (ori[i] - cnt);
                if (ori[i] < 'a') ori[i] += ALPHABETS;
            }
            msv[ori].push_back(str);
        }
        for(auto it = msv.begin(); it != msv.end(); it++) {
            ret.push_back(it->second);
        }
        return ret;
    }
};
```
