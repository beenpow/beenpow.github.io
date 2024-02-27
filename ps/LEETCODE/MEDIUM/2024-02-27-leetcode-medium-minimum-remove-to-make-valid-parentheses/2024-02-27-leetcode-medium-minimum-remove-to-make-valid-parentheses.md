---
layout: post
title : "Leetcode::problem(1249) minimum remove to make valid parentheses"
subtitle: "Leetcode ps medium"
type: "Leetcode medium"
medium: true
ps: true
leetcode: true
text: true
author: "beenpow"
post-header: true
header-img: "https://www.spotebi.com/wp-content/uploads/2019/01/one-day-day-one-workout-motivation-spotebi.jpg"
order: 1
date: "2024-02-27"
---

# Leetcode::Minimum Remove to Make Valid Parentheses
- [Link : Leetcode::Minimum Remove to Make Valid Parentheses](https://leetcode.com/problems/minimum-remove-to-make-valid-parentheses/description/)

- level : medium
- 10 mins to solve

# point
- Given a string s of '(', ')' and lowercase English characters.
- Your task is to remove the minimum number of parentheses '(' or ')', in any position, so that the resulting parentheses string is valid and return any valid string.

# Design
- It's okay to forget about english characters at first.
- We focus on paring left brackets and right brackets.
- Since it has to valid one, we follow the legacy way of solving this parentheses problem.
  - Which is, while iterating,
	  - If we encounter 'left' bracket, save it
		- If we encounter 'right' bracket, we use saved 'left' bracket.
		  - If we lack of 'left' ones, this 'right' bracket can not be used. delete it.
		- If there's 'left' brackets left after iteration, delete them.
- Now we retuen the string consisting of non-deleted characters.


# Big O(time)
- Time : O(N)
- Space : O(N)

# Code

```cpp
class Solution {
public:
    string minRemoveToMakeValid(string s) {
        vector<int> le;
        for(int i = 0; i < s.size(); i++) {
            if (s[i] == '(') {
                le.push_back(i);
            } else if (s[i] == ')') {
                if (le.empty()) s[i] = '#';
                else le.pop_back();
            }
        }
        for (int i = 0; i < le.size(); i++) s[le[i]] = '#';

        string ret = "";
        for(int i = 0; i < s.size(); i++) {
            if (s[i] != '#') ret += s[i];
        }
        return ret;
    }
};
```
