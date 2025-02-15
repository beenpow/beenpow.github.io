---
layout: post
title : "Leetcode::problem palindrome linked list"
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
date: "2025-02-15"
---

# Leetcode::palindrome linked list
- [Link : Leetcode:palindrome linked list](https://leetcode.com/problems/palindrome-linked-list/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, 2 5 5 5 120
- level : easy

# point
- Given the head of a singly linked list, return true if it is a palindrome or false otherwise.

# Design
- It's okay to solve the problem with extra space O(N).
- If we use a list of values, we can easily find the answer.
- However, there's saying "Could you do it in O(n) time and O(1) space?" on the description of the problem.
- Then we must try.
- At first, I thought there is no way to do it in O(1) space.
- Because even if I reverse the letter part of the palindrome, it takes O(N) space.
- The reason why I initally thought this way was I was only thought about function call.
- If we use function call to traverse the given linked list and we use constant value in each function call, we would end up using O(N) space in the end of the repetitive functions.
- However, what if we iterate the linked list by for loop?
- To use for-loop to iterate the linked list, we only need O(1) extra space.
- Here's how.
- Status 0
	- Given linked list.
	- [0]      -> [1] -> [2] -> [3] -> [4] -> [5]
  - fiHead                   seEnd        seHead;
- Status 1
  -  [0]      -> [1] -> [2] -> [3] <- [4] <- [5]
  -  fiHead                   seEnd        seHead;
- Status 2
  - [0]      -> [1] -> [2] -> [3] -> [4] -> [5]
  - fiHead                   seEnd        seHead;
- I've seperated the status of linked list to three parts.
- 'Status 0' is the given linked list. (Note that the values "seEnd, seHead", they present the second Half's head and tail)
- 'Status 1' is the status after we reverse the pointers of second half of the given linked list.
  - With this status, we are able to check if the linked list is palindrome or not.
- 'Status 2' is same as 'Status 0'.
  - Because if could be necessary to use the given linked list after the function call, we might need to do return it back to the initial status.
- Implementing 'reversePointers' takes some time, since we need to manipulate pointers and consider the limit.
- I've made the function can be used publicly.
- I mean, I call the function twice to get the 'Status 1' and the 'Status 2'.
- To achieve the simplicity of the code, programmers are required to program lines of code that can be used widely.

# Big O(time)
- TIME : O(N)
- SPACE : O(1)

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
    bool isPalindrome(ListNode* head) {
        bool ret = true;
        // # status 0
        // [0]      -> [1] -> [2] -> [3] -> [4] -> [5]
        // fiHead                   seEnd        seHead;
        ListNode* fiHead = head;
        ListNode* seHead = nullptr;
        ListNode* seEnd = nullptr;

        // 1) getting size of the list
        int sz = getSize(head);

        // 2) finding seEnd and seHead
        int seIndex = sz/2;
        findingSecond(&seEnd, &seHead, seIndex, fiHead);

        // 3) reverse pointers in the range of (seEnd ~ seHead)
        // # status 1
        // [0]      -> [1] -> [2] -> [3] <- [4] <- [5]
        // fiHead                   seEnd        seHead;

        reversePointers(seEnd, seHead, sz - seIndex/*prev,cur,next alignment*/);

        // 4) check if it's a palindrome
        ListNode* h1 = fiHead, *h2 = seHead;
        for(int i = 0; i < sz/2; i++) {
            if (h1 == nullptr || h2 == nullptr || ((h1->val) != (h2->val))) {
                ret = false;
                break;
            }
            h1 = h1->next, h2 = h2->next;
        }

        // 5) reverse pointers in the range of (seEnd ~ seHead)
        // # status 2
        // [0]      -> [1] -> [2] -> [3] -> [4] -> [5]
        // fiHead                   seEnd        seHead;
        reversePointers(seHead, seEnd, sz - seIndex);

        return ret;
    }
    int getSize(ListNode* head) {
        int sz = 0;
        ListNode* h = head;
        while(h != nullptr) {sz++; h = h->next;}
        return sz;
    }
    void findingSecond(ListNode** seEnd, ListNode** seHead, int seIndex, ListNode* fiHead) {
        int cur = 0;
        ListNode* h = fiHead;
        while(cur < seIndex) {
            cur++;
            h = h->next;
        }
        *seEnd = h;
        while(h != nullptr) {
            *seHead = h;
            h = h->next;
        }
    }
    void reversePointers(ListNode*& st, ListNode*& en, int sz) {
        if (sz < 2) return;
        ListNode* h = st->next, *prev = st;
        int c = 1;
        while(h != nullptr && c < sz) {
            ListNode* nxt = h->next;
            h->next = prev;

            // Just break the chain between first Half and the second. 
            // Since the system will stop if there is a cycle.
            if (c == 1)
                prev->next = nullptr; 
            prev = h;
            h = nxt;
            c++;
        }
    }
};
```
