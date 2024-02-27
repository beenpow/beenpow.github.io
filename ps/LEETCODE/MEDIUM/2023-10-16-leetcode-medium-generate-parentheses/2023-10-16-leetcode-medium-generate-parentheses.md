---
layout: post
title : "Leetcode::problem(22) Generate Parentheses"
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
date: "2023-10-16"
---

# Leetcode::Generate Parentheses
- [Link : Leetcode::Generate Parentheses](https://leetcode.com/problems/generate-parentheses/description/)

- level : medium

# point
- Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

# Design
- Here's what well-formed parentheses
  - Let's say '(' as left bracket, ')' as right bracket
	- To be well-formed, leftmost character of the string should be '(' and rightmost should be ')'.
	- While iterating through from left to right, the count of right brackets can not be greater than the count of left brackets
	- The total number of left brackets and right brackets should be same
- We can make any set of brackets if above statements hold
- To make them simply, we can use dfs by adding '(' or ')' to the string


# Big O(time)
- O(2^(2N))

# Code

```cpp
class Solution {
public:
    int N;
    vector<string> ans;
    void _put(string cur, int len, int depth) {
        if (depth < 0 || depth > N/2) return;
        if (len == N) {
            if (depth == 0) {
                ans.push_back(cur);
            }
            return ;
        }
        // cur + "("
        _put(cur + "(", len + 1, depth + 1);

        // cur + ")"
        _put(cur + ")", len + 1, depth - 1);
    }
    vector<string> generateParenthesis(int n) {
        N = n * 2;
        _put("(", 1, 1);
        return ans;
    }
};
```
