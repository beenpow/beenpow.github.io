---
layout: post
title : "Leetcode::problem(647) Palindromic Substring"
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
date: "2023-10-09"
---

# Leetcode::Palindromic Substring
- [Link : Leetcode::Palindromic Substring](https://leetcode.com/problems/palindromic-substrings/)

- level : medium

# point
- Given a string s, return the number of palindromic substrings in it.
- A string is a palindrome when it reads the same backward as forward.
- A substring is a contiguous sequence of characters within the string.

# Design

```text
I think I can start solving this problem by checking if there are palindromes their langths are two or three.
For length two, obviously two characters should be same.
For length three, first and the last characters should be same.

I would call those palindromes as 'center'.
If I find all of centers in the s, I think I can check all of the palindromes by checking left and right side of them.

For example, if I found a center which is "aba" and the string s is kzabazm.
Since I know "aba" is palindrome, I can check if "zabaz" is palindrome.
Because "zabaz" is palindrome I can go further, and check if "kzabazm" is palindrome. and so on.

Finding those centers would take O(N).
With each center, It can take upto O(N).
So, I suppose the solution would take squared N.
```

# Big O(time)
- O(N^2)

# Code

```cpp
class Solution {
public:

    int countSubstrings(string s) {
        int n = s.size();
        vector<pair<int,int>> centers;

        // check length 2 centers
        for(int i = 0; i < n-1; i++) {
            if (s[i] == s[i+1]) {
                centers.push_back({i, i+1});
            }
        }

        // check length 3 centers
        for(int i = 0; i < n-2; i++) {
            if (s[i] == s[i+2]) {
                centers.push_back({i, i+2});
            }
        }

        // check how many palindrome exist with the centers.
        int countPalindromes = n + centers.size();

        for(int i = 0; i < centers.size(); i++) {
            int le = centers[i].first, ri = centers[i].second;
            while(le-1 >= 0 && ri + 1 < n && s[le-1] == s[ri+1]) {
                countPalindromes++;
                le--, ri++;
            }
        }


        return countPalindromes;
    }
};
```
