---
layout: post
title : "Leetcode::problem(1768) Merge Strings Alternately"
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
date: "2025-02-03"
---

# Leetcode::Merge Strings Alternately
- [Link : Leetcode::Merge Strings Alternately](https://leetcode.com/problems/merge-strings-alternately/description/?envType=company&envId=google&favoriteSlug=google-thirty-days)

- level : easy

# point
- Two strings word1 and word2 are given.
- Merge the strings by adding letters in alternating order, starting with word1.
- Return the merged string.

# Design
- To solve this problem wisely, we have to define constant values for the size of two strings.
- Then we alternately add them to the result string.
- Since we only need one loop and several if statements, it's best to use minimal number of if statments.
- To make the best out of it, I chose to use if/elseif/else statement.

# Big O(time)
- TIME
	- O(N + M)
- SPACE
	- O(N + M)

# Code

```cpp
class Solution {
public:
    string mergeAlternately(string word1, string word2) {
        string ret = "";
        int i = 0, j = 0;
        int len1 = word1.size(), len2 = word2.size();

        for(int k = 0; k < len1 + len2; k++) {
            if (i == len1 && j < len2) {
                ret += word2[j++];
            } else if (i < len1 && j == len2) {
                ret += word1[i++];
            } else {
                if ((i + j) % 2 == 0) ret += word1[i++];
                else ret += word2[j++];
            }
        }
        return ret;
    }
};
```
