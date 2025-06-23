---
layout: post
title : "Leetcode::problem remove nodes from linked list"
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
date: "2025-06-23"
---

# Leetcode::remove nodes from linked list
- [Link : Leetcode:remove nodes from linked list](https://leetcode.com/problems/remove-nodes-from-linked-list/description/)
- Solved, 5 15 10 0 60
- level : medium

# Problem Description
- You are given the head of a linked list.
- Remove every node which has a node with a strictly greater value anywhere to the right side of it.
- Return the head of the modified linked list.

# How to solve
- MySolution is using extra memory.
    - I've stored all the values in a vector.
    - Then I've iterated the vector from the end to the start.
    - If the current value is less than the maximum value, I've set the current value to be negative.
    - Otherwise, I've set the maximum value to the current value.
    - Then I've iterated the vector from the start to the end.
    - If the current value is negative, I've skipped it.
    - Otherwise, I've added it to the new linked list.

- EditSolution is using reverse list without extra memory.
    - I've reversed the linked list, so that I won't use extra memory.
    - Then I've iterated the linked list from the start to the end.
    - If the current value is less than the maximum value, I've removed it.
    - Otherwise, I've set the maximum value to the current value.
    - Then I've reversed the linked list again.

# Big O (Time, Space)

- MySolution - Using a extra memory
    - TIME : O(N)
    - SPACE : O(N)
- EditSolution - reverse list
    - TIME : O(N)
    - SPACE : O(1)

# Code

## MySolution - Using extra memory

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
    ListNode* removeNodes(ListNode* head) {
        vector<int> values;
        ListNode* horse = head;
        while(horse != nullptr) {
            values.push_back(horse->val);
            horse = horse->next;
        }

        int mx = -1;
        for(int i = values.size() - 1; i >= 0; i--) {
            if (values[i] < mx) {
                values[i] *= -1;
            } else mx = values[i];
        }

        ListNode* newHead = nullptr;
        horse = nullptr;
        bool nextRemoved = false;
        for(int i = 0; i < values.size(); i++) {
            if (values[i] < 0) {
                nextRemoved = true;
            } else {
                nextRemoved = false;
                if (newHead == nullptr) {
                    newHead = horse = head;
                }
                else {
                    horse->next = head;
                    horse = horse->next;
                }
            }
            head = head->next;
        }
        if (nextRemoved) horse->next = nullptr;

        return newHead;
    }
};
```

## EditSolution - reverse list

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
        ListNode* prev = head;
        ListNode* curr = head->next;
        ListNode* next = nullptr;
        while (curr != nullptr) {
            next = curr->next;
            curr->next = prev;
            if (prev == head) prev->next = nullptr;
            prev = curr;
            curr = next;
        }
        return prev;
    }
    ListNode* removeNodes(ListNode* head) {
        if (head->next == nullptr) return head;

        head = reverseList(head);

        int mx = head->val;
        ListNode* prev = head;
        ListNode* curr = head->next;
        ListNode* next = nullptr;
        while(curr != nullptr) {
            next = curr->next;
            if (curr->val < mx) {
                prev->next = next;
                //delete curr;
                curr = next;
            } else {
                mx = curr->val;
                prev = curr;
                curr = prev->next;
            }
        }
        head = reverseList(head);
        return head;
    }
};
```