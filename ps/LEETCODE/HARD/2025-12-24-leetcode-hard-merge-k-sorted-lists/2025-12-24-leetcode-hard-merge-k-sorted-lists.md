---
layout: post
title : "Leetcode::problem merge k sorted lists"
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
date: "2025-12-24"
---

# Leetcode::merge k sorted lists
- [Link : Leetcode:merge k sorted lists](https://leetcode.com/problems/merge-k-sorted-lists/description)
- Solved, 10 15 5 0 30
- level : hard

# Problem Description
- You are given an array of k linked-list lists, each linked-list is sorted in ascending order.
- Merge all the linked-lists into one sorted linked-list and return it.

# How to solve

## Using PQ
- I've solved with a priority queue.
- With the pq, we are able to keep track of each list.
- First of all, we add each list's first node to pq.
- Then we repeat below sequence until the pq is not empty.
    - Pop the top of the pq which will have the smallest number in current pq.
    - Attach this node to the return ListNode*.
    - If the used list is not ended yet, we push back with the next node of the list.

## Using simple merge
- I found out that there is another solution that has similar time complexity.
- We know that merging two sorted lists takes O(N) where N is the total number of nodes from two lists.
- If we merge two list at each stage, we will end up having the same complexity.
- Specifically, 
    - For the first stage, we merge K/2 pair of lists.
    - For the second stage, we merge K/4 pair of lists.
    - For the thir stage, we merge K/8 pair of lists.
    - ...
- Since it's like a reversed binary tree, the depth of the tree is logK.
- Also, each stage takes O(N) time.
- So the total time complexity becomes O(NlogK).

# Big O (Time, Space)
- TIME: O(NlogK)
    - N : length of the output list.
    - K : number of lists.
- SPACE
    - O(N) for the output.
    - O(K) for the priority_queue.

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
    struct cmp {
        bool operator ()(ListNode* a, ListNode* b) {
            return a->val > b->val;
        }
    };
    ListNode* mergeKLists(vector<ListNode*>& lists) {
        ListNode* ret = nullptr, *head = nullptr;
        priority_queue<ListNode*, vector<ListNode*>, cmp> pq;
        int n = lists.size();

        // Initialize
        for (int i = 0; i < n; i++) {
            if (lists[i] != nullptr) {
                pq.push({lists[i]});
            }
        }

        // Run
        while(!pq.empty()) {
            ListNode* cur = pq.top();
            int val = cur->val;
            pq.pop();

            if (head == nullptr) {
                head = ret = cur;
            } else {
                ret->next = cur;
                ret = ret->next;
            }

            if (cur->next != nullptr) {
                pq.push({cur->next});
            }
        }
        if (ret != nullptr) ret->next = nullptr;
        return head;
    }
};
```