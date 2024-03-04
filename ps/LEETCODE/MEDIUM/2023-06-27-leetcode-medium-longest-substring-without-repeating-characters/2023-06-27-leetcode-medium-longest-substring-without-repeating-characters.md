---
layout: post
title : "Leetcode::problem(3) Longest Substring Without Repeating Characters"
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
date: "2023-06-27"
---

# Leetcode::Longest Substring Without Repeating Characters
- [Link : Leetcode::Longest Substring Without Repeating Characters](https://leetcode.com/problems/longest-substring-without-repeating-characters/)

- level : medium
- 15 mins to solve

# point
- Find the longest substring without repeating characters

# Design
- We can solve this problem by using sliding window method
- We just iterate numbers, and stack the string we have
  - Then if we meet a character that we've met before, we need to move the start point of the stack by pulling out numbers from the front
  - We only keep non-repeating substring while sliding

# Big O(time)
- O(NlogN)

# Code

```cpp
class Solution {
public:
    int lengthOfLongestSubstring(string s) {
        map<char, int> mp;
        int st = 0, mxLen = 0;
        for(int i = 0; i < s.size(); i++) {
            if (mp.find(s[i]) == mp.end()) {
                mp[s[i]] = 1;
            } else {
                while(s[st] != s[i]) {
                    mp.erase(s[st]);
                    st++;
                }
                st++;
            }
            mxLen = max(mxLen, i - st + 1);
        }
        return mxLen;
    }
};
```
