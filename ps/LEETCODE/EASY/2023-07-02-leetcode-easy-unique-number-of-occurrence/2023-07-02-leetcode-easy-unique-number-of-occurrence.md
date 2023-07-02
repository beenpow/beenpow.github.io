---
layout: post
title : "Leetcode::problem(1207) Unique Number of Occurrences"
subtitle: "Leetcode ps easy"
type: "Leetcode easy"
easy: true
ps: true
leetcode: true
text: true
author: "beenpow"
post-header: true
header-img: "https://global-uploads.webflow.com/63f6e52346a353ca1752970e/643e349f60c00b508219836f_what-is-strategy-1.jpeg"
order: 1
date: "2023-07-02"
---

# Leetcode::Unique Number of Occurences
- [Link : Leetcode::Unique Number of Occurrences](https://leetcode.com/problems/unique-number-of-occurrences/description/?envType=study-plan-v2&envId=apple-spring-23-high-frequency)

- level : easy

# point
- Find if the given array has unique number of occurrences

# Design
- We can achieve the goal by using map two times
- First one would have [value, occurrences]
- Second one would have [occurrences, count]


# Big O(time)
- O(NlogN)

# Code

```cpp
class Solution {
public:
    bool uniqueOccurrences(vector<int>& arr) {
        map<int, int> x1, x2;
        for(auto x : arr) {
            x1[x]++;
        }
        for(auto it = x1.begin(); it != x1.end(); it++) {
            x2[it->second]++;
        }
        for(auto it = x2.begin(); it != x2.end(); it++) {
            if (it->second > 1) return false;
        }
        return true;
    }
};
```
