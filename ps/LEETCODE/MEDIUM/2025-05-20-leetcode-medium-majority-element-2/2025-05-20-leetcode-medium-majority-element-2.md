---
layout: post
title : "Leetcode::problem majority element 2"
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
date: "2025-05-20"
---

# Leetcode::majority element 2
- [Link : Leetcode:majority element 2](https://leetcode.com/problems/majority-element-ii/description/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, algorithm 62
- level : medium

# point
- Giv en an integer array of size n, find all elements that appear more than floor(n/3) times.

# Design
- We can use the Boyer-Moore Voting Algorithm to find the majority element.
- Boyer-Moore Voting Algorithm is used to find the majority element in an array.
- We can utilize this algorithm to find two majority elements in an array.
- The algorithm is as follows:
    - First, we need two candidates and two counters.
    - We iterate through the array and update the candidates and counters.
    - If the current element is same as either of the candidates, we increment the counter for that candidate.
    - If one of the counters is 0, we update the candidate with the current element which becomes a new candidate.
    - Otherwise, we decrement both counters.
    - After the first pass, we have two candidates.
    - So we check if the candidates are majority elements by iterating through the array again.

# Big O
- TIME : O(N)
- SPACE : O(1)

# Code

```cpp
class Solution {
public:
#define UNDEFINED -2'000'000'000
    vector<int> majorityElement(vector<int>& nums) {
        int cand1 = UNDEFINED, cand2 = UNDEFINED;
        int cntCand1 = 0, cntCand2 = 0;
        for(auto x : nums) {
            if (cand1 == x) {
                cntCand1++;
            }
            else if (cand2 == x) {
                cntCand2++;
            }
            else if (cntCand1 == 0) {
                cand1 = x;
                cntCand1++;
            }
            else if (cntCand2 == 0) {
                cand2 = x;
                cntCand2++;
            } 
            else {
                cntCand1--;
                cntCand2--;
            }
        }

        cntCand1 = 0, cntCand2 = 0;
        // 2nd Pass
        for(auto x : nums) {
            if (x == cand1) cntCand1++;
            if (x == cand2) cntCand2++;
        }
        vector<int> ans;
        if (cand1 != UNDEFINED && cntCand1 > nums.size()/3) ans.push_back(cand1);
        if (cand2 != UNDEFINED && cntCand2 > nums.size()/3) ans.push_back(cand2);
        return ans;
    }
};
```