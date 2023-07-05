---
layout: post
title : "Leetcode::problem(206) Reverse Linked List"
subtitle: "Leetcode ps easy"
type: "Leetcod easy"
easy: true
ps: true
leetcode: true
text: true
author: "beenpow"
post-header: true
header-img: "https://www.spotebi.com/wp-content/uploads/2019/01/one-day-day-one-workout-motivation-spotebi.jpg"
order: 1
date: "2023-07-03"
---

# Leetcode::Reverse Linked List
- [Link : Leetcode::Reverse Linked List](https://leetcode.com/problems/reverse-linked-list/description/?envType=study-plan-v2&envId=apple-spring-23-high-frequency)

- level : easy

# point
- Reverse the given linked list

# Design
- First of all, we get values by iterating through from head to tail
- Then we put the numbers backward by iterating from head to tail again

# Big O(time)
- O(N)

# Code

```cpp
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode() : val(0), next(nullptr) {}
 *     ListNode(int x) : val(x), next(nullptr) {}
 *     ListNode(int x, ListNode *next) : val(x), next(next) {}
 * };
 */
class Solution {
public:
    ListNode* reverseList(ListNode* head) {
        vector<int> v;
        ListNode* realHead = head;

        while(head != nullptr) {
            v.push_back(head->val);
            head = head->next;
        }
        head = realHead;
        for(int i = v.size() - 1; i>=0; i--) {
            head->val = v[i];
            head = head->next;
        }
        return realHead;
    }
};
```
