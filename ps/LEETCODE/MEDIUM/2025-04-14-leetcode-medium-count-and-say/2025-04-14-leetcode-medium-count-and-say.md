---
layout: post
title : "Leetcode::problem count and say"
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
date: "2025-04-14"
---

# Leetcode::count and say
- [Link : Leetcode:count and say](https://leetcode.com/problems/count-and-say/description/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, 5 5 10 10 10
- level : medium

# point
- The count-and-say sequence is a sequence of digit strings defined by the recursive formula:
- Given a positive integer n, return the n-th element of the count-and-say sequence.

# Design
- We can implement by iterating the same sequence. (count and say)

# Big O(time)
- We know that we would the length of the string can be fourfold after 3 iterations.
  - 1 -> 11 -> 21 -> 1211
  - d -> 1d -> 111d -> 311d ( d > 1 )
- This fact yield to have below time and space complexity.
- TIME : O(4^(i/3))
- SPACE : O(4^(i/3))
# Code

```cpp
/*
n is small.
But we have to make sure how much longer the string can be.
n = 1 -> len = 1 (1)
n = 2 -> len = 2 (11)
n = 3 -> len = 2 (21)
n = 4 -> len = 4 (1211)
n = 5 -> len = 6 (111221)
n = 6 -> len = 7 (312211)
n = 7 -> ()
*/

class Solution {
public:
    string countAndSay(int n) {
        string cur = "1";
        while(--n > 0) {
            int cnt = 1;
            string tmp = "";
            for(int i = 1; i < cur.size(); i++) {
                if (cur[i-1] != cur[i]) {
                    tmp += to_string(cnt);
                    tmp += cur[i-1];
                    cnt = 1;
                } else cnt++;
            }
            tmp += to_string(cnt);
            tmp += cur.back();
            cur = tmp;
            cout << cur << endl;
        }
        return cur;
    }
};
```