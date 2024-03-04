---
layout: post
title : "Leetcode::problem(946) Validate Stack Sequence"
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
date: "2023-08-22"
---

# Leetcode::Validate Stack Sequence
- [Link : Leetcode::Validate Stack Sequence](https://leetcode.com/problems/validate-stack-sequences/description/?envType=study-plan-v2&envId=google-spring-23-high-frequency)

- level : medium

# point
- Given two integer arrays pushed and popped.
- return true if this could have been the result of a sequence of push and pop operations on an initially empty stack

# Design
- Here's the logic that I've made
- When pop's front == stack.back
  - Good! pop back from the stack

- When pop's front != stack.back
  - When pop's front exist on the stack
    - return false // It means, pop's front value exist somewhere inside stack not the back. 
  - Else
    - push push's value to the stack until we found pop's front value on stack's back

# Big O(time)
- O(len(pushed) + len(popped))

# Code

```cpp
class Solution {
public:
    bool validateStackSequences(vector<int>& pushed, vector<int>& popped) {
        map<int,int> met;
        int n = pushed.size(), m = popped.size();
        vector<int> stk;

        int pushId = 0;
        for(int i = 0; i < m; i++) {
            if (stk.size() == 0 || popped[i] != stk.back()) {
                if (met.find(popped[i]) != met.end()) {
                    return false; // back 이 아닌 곳에 존재 
                } else {
                    while(pushId < n && ((stk.size() == 0) || (stk.back() != popped[i]) )) {
                        stk.push_back(pushed[pushId]);
                        met[pushed[pushId]] = 1;
                        pushId++;
                    }
                    if (stk.back() == popped[i]) {
                        stk.pop_back();
                    }else return false;
                }
            }
            else {
                stk.pop_back();
            }
        }
        return true;
    }
};
```
