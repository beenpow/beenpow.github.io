---
layout: post
title : "Leetcode::problem max stack"
subtitle: "Leetcode ps hard"
type: "Leetcode hard"
hard: true
ps: true
leetcode: true
text: true
author: "beenpow"
post-header: true
header-img: ""
order: 1
date: "2026-01-07"
---

# Leetcode::max stack
- [Link : Leetcode:max stack](https://leetcode.com/problems/max-stack)
- Solved, 5 20 15 12 3
- level : hard

# Problem Description
- Design a max stack data structure that supports the stack operations and supports finding the stack's maximum element.
- You must come up with a solution that support O(1) for each top call and O(logN) for each other call.

# How to solve
- As we see the name of the problem, we get the idead of using 'stack'.
- Also, we have to consider how to manipulate the stack to make the peekMax() and popMax() functions work.
- The main idea of how to handle them is marking each pushed number with uniqueId.
- This makes it easier to erase elements.
- With a list we can achieve both.
    - Stack input elements.
    - Locating and erasing elements when pop() is called.
- Specifically, we use list as stack, so we push and pop as the order of the elements.
- We use a map so we get the sorted values in O(logN), and we are able to erase one element on the list by utilizing list's iterator.
- With this approach, it is not hard to solve the problem.


# Big O (Time, Space)
- TIME
    - O(1) for top() and peekMax()
    - O(logN) for push(), pop(), popMax()
- SPACE
    - O(N)

# Code

```cpp
class MaxStack {
public:
    int uniqueId;
    list<pair<int,int> > li; // value, uniqueId
    map<pair<int, int>, list<pair<int,int> >::iterator> mp;

    MaxStack() {
        uniqueId = 0;
        li.clear();
        mp.clear();    
    }
    
    void push(int x) {
        li.push_back({x, uniqueId});
        mp[{x, uniqueId}] = --li.end();
        uniqueId++;
    }
    
    int pop() {
        if (li.empty()) return -1;
        int val = li.back().first;
        int idx = li.back().second;
        mp.erase({val, idx});
        li.pop_back();
        return val;
    }
    
    int top() {
        if (li.empty()) return -1;
        return li.back().first;
    }
    
    int peekMax() {
        if (mp.empty()) return -1;
        return mp.rbegin()->first.first;
    }
    
    int popMax() {
        if (mp.empty()) return -1;
        auto it = --mp.end();
        int ret = it->first.first;
        li.erase(it->second);
        mp.erase(it);
        return ret;
    }
};
```