---
layout: post
title : "Leetcode::problem reverse words in a string"
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
date: "2025-02-13"
---

# Leetcode::reverse words in a string
- [Link : Leetcode:reverse words in a string](https://leetcode.com/problems/reverse-words-in-a-string/description/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, 3 10 10 2 2
- level : medium

# point
- Given an input string s, reverse the order of the words.

# Design
- Fun factor of this problem : Can you solve it in-place with O(1) extra space ?
- Yes we can solve it.
- Firstly, we remove unnecessary space.
- Meanwhile, every time we find a word, we put this word from the first index of the string.
- More importantly, before we put a word, we reverse the word.
- Then after iteration of the given s, we reverse the whole string.
- Tada~
- It's easy hack, but very interesting problem.


# Big O(time)
- TIME : O(N)
- SPACE : O(N)

# Code

```cpp
class Solution {
public:
    string reverseWords(string s) {
        bool space = true;
        int wordSt = 0, wordEn = 0, pos = 0;

        // 1) Remove space
        // 2) Reverse each word
        s += ' ';
        for(int i = 0; i < s.size(); i++) {
            if (s[i] == ' ') {
                if (space == false) {
                    space = true;
                    wordEn = i - 1;
                    int le = wordSt, ri = wordEn;
                    while(le < ri) swap(s[le++], s[ri--]);

                    while(wordSt < i) {
                        s[pos++] = s[wordSt++];
                    }
                    s[pos++] = ' ';
                }
            } else {
                if (space == true) {
                    space = false;
                    wordSt = i;
                }
            }
        }
        s.resize(pos - 1);
        reverse(s.begin(), s.end());
        return s;
    }
};
```
