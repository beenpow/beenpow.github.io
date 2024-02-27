---
layout: post
title : "Leetcode::problem(678) Valid Parenthesis String"
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

# Leetcode::Valid Parenthesis String
- [Link : Leetcode::Valid Parenthesis String](https://leetcode.com/problems/valid-parenthesis-string/)

- level : medium
- 10mins to solve

# point
- Given a string s containing only three types of characters: '(', ')' and " * ", return true if s is valid
- ' * " could be treated as a single right parenthesis ')' or a single left parenthesis '(' or an empty string ''.

# Design
- As it is well known problem, we all know that we need to count left brackets and the asterisks.
- Then, every time we encounter right bracket while iterating, we use either of left bracket or asterisk.
- Since asterisk can be anything, it's more convenient to use left bracket first.
- Now we need to handler unused left brackets and asterisks after above iteration, this is important part.
- It's important to use them as it has index, because right bracket can only be on the right side of left bracket.
- To meet this alignment, it's necessary to have index for left brackets and asterisks.
- After that, parining them is all we need to do


# Big O(time)
- Time : O(N)
- Space : O(N)

# Code

```cpp
class Solution {
public:
    bool checkValidString(string s) {
        vector<int> le, any;
        for(int i = 0; i < s.size(); i++) {
            if (s[i] == '(')       le.push_back(i);
            else if (s[i] == '*')  any.push_back(i);
            else {
                if (le.empty()) {
                    if (any.empty()) return false;
                    any.pop_back();
                }
                else le.pop_back();
            }
        }
        while(!le.empty() && !any.empty()) {
            if (le.back() > any.back()) return false;
            le.pop_back();
            any.pop_back();
        }
        if (!le.empty()) return false;
        return true;
    }
};
```
