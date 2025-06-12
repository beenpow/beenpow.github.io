---
layout: post
title : "Leetcode::problem next greater element 1"
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
date: "2025-06-12"
---

# Leetcode::next greater element 1
- [Link : Leetcode:next greater element 1](https://leetcode.com/problems/next-greater-element-i/description/)
- Solved, algorithm 180
- level : easy

# Problem Description
- The next greater element of some element x in an array is the first greater element that is to the right of x in the same array.
- Return an array ans of length n such that ans[i] is the next greater element as described above for the corresponding element in nums1.

# How to solve
- We can solve this problem with a map but it takes O(NM) time.
- To sovle as a O(N + M) time as suggested on the problem page, we can use a stack.
- Using stack is not easy but it seems that there are many problems that can be solved with stack.
- For this problem, we maintain a stack of elements as in descending order.
- With a stack, it feels like we find the previous less element.
- And less elements are maintained in the stack.
- While we iterate through the nums2, we can find the next greater element by comparing the current element with the top of the stack.
- If the top of the stack is less than the current element, we can pop the top of the stack and set the next greater element of the popped element to the current element.
- This mechanism makes us to find the next greater element in O(N) time.
- Then we fill the ones that has to no greater element with -1.

# Big O (Time, Space)
- Time : O(n + m)
- Space : O(n + m)

# Code

```cpp
class Solution {
public:
    vector<int> nextGreaterElement(vector<int>& nums1, vector<int>& nums2) {
        stack<int> stk;
        unordered_map<int,int> NGE;
        for(auto num : nums2) {
            while(!stk.empty() && num > stk.top()) {
                NGE[stk.top()] = num;
                stk.pop();
            }
            stk.push(num);
        }
        while(!stk.empty()) {
            NGE[stk.top()] = -1;
            stk.pop();
        }

        vector<int> ans;
        for(auto num : nums1) {
            ans.push_back(NGE[num]);
        }
        return ans;
    }
};
```