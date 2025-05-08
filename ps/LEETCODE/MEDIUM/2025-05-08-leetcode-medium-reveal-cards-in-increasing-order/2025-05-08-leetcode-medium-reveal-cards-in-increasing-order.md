---
layout: post
title : "Leetcode::problem reveal cards in increasing order"
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
date: "2025-05-08"
---

# Leetcode::reveal cards in increasing order
- [Link : Leetcode:reveal cards in increasing order](https://leetcode.com/problems/reveal-cards-in-increasing-order/description/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, 5 30 15 5 35
- level : medium

# point
- You are given an integer array deck.
- Return an ordering of the deck that would reveal the cards in increasing order.
    - Take the top card and reveal it.
    - Move the top card to the bottom.
    - Repeat above operations.

# Design
- This is simulation problem.
- The simplest approach would be naively skipping indices by increasing index as a size of 1.
- But this can make a problem in a worst scenario.
    - At first round, we the distance between revealed cards would be 2.
    - At second, it could be 4.
    - At thirst, it could be 8.
    - And so on.
    - So the total time complexity for this part could be O(N^2).
- So we can utilize a vector or a queue to solve the problem with O(NlogN) time complexity.
- For the vector way,
    - I've maintained a vector that only has left indices, so I can skip numbers easily.
    - This approach yields the 'skipping distance' maintained as '2'(constant).
- For the queue way,
    - It's simply follows the implementation steps.
    - Pop > push(top) > Pop > ...

# Big O(time)
- using a vector
    - TIME : O(NlogN)
    - SPACE : O(N)
- using a queue
    - TIME : O(NlogN)
    - SPACE : O(N)

# Code

## using a vector

```cpp
class Solution {
public:
    vector<int> deckRevealedIncreasing(vector<int>& deck) {
        int n = deck.size();
        sort(deck.begin(), deck.end());


        vector<int> idx(n), ans(n, 0);
        for(int i = 0; i < n; i++) idx[i] = i;

        int pos = 0, i = 0;
        bool skipFirst = false;
        while(idx.size() > 0) {
            bool prev = skipFirst;
            for(i = 0 + skipFirst; i < idx.size(); i += 2) {
                ans[idx[i]] = deck[pos++];
            }
            skipFirst = (i == (idx.size() + 1));
            
            vector<int> tmp;
            for(int i = 0 + (prev == true?0:1); i < idx.size(); i+=2) {
                tmp.push_back(idx[i]);
            }
            idx.clear();
            idx = tmp;
        }
        return ans;
    }
};
```

## using a queue

```cpp
class Solution {
public:
    vector<int> deckRevealedIncreasing(vector<int>& deck) {
        queue<int> q;
        sort(deck.begin(), deck.end());
        for(int i = 0; i < deck.size(); i++) q.push(i);

        int pos = 0;
        vector<int> ans(deck.size(), 0);
        while(!q.empty()) {
            int idx = q.front();
            q.pop();
            ans[idx] = deck[pos++];
            if (!q.empty()) {
                q.push(q.front());
                q.pop();
            }
        }
        return ans;
    }
};
```