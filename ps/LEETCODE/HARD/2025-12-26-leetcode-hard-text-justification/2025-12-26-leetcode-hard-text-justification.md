---
layout: post
title : "Leetcode::problem text justification"
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
date: "2025-12-26"
---

# Leetcode::text justification
- [Link : Leetcode:text justification](https://leetcode.com/problems/text-justification/description)
- Solved, 10 23 14 10 1
- level : hard

# Problem Description
- Given an array of strings words and a width maxWidth, format the text such that each line has exactly maxWidth characters and is fully (left and right) justified.

# How to solve
- It is a simulation problem, there is no trick behind it.
- But there are some exceptional cases we need to be careful about.
- While iterating the given words,
    - We find the maximum count of words that can be squashed in to one line.
        - There should be at least one character space between two words, so we use this fact to count the maximum count of words.
    - Then we find the leftspace which can be calculated by deducting the sum of the chosen words from the given maxWidth.
    - Now we calculate quotient and remainder of spaces.
        - If x words are chosen, there can be x-1 sets of spaces.
        - We first put the same spaces between words.
        - Then add one space from the left.
    - After that, we glue all together to a signle string.
- There are some small details to focus.
    - If there is only one word in a line, we add all the spaces after that word.
    - If it's the last line, we add only one space between words then add all the left spaces in the end.

# Big O (Time, Space)
- TIME
    - O(NK)
        - Where N is the number of words, and K is the length of a word.
- SPACE
    - O(maxWidth * lines) <= O(100 * N)

# Code

```cpp
class Solution {
public:
    vector<string> fullJustify(vector<string>& words, int maxWidth) {
        int n = words.size();
        vector<int> len;
        for(auto s : words) len.push_back(s.size());

        vector<string> ret;
        
        int st = 0, en = 0;
        while(st < n) {
            // 1. Find the maximum possible words that can be included in a line.
            int totLen = -1, totWordsLen = 0;
            while (en < n && totLen <= maxWidth) {
                totLen += (1 + len[en]);
                totWordsLen += len[en];
                en += 1;
            }
            en -= 1;
            if (totLen > maxWidth) {
                totLen -= (1 + len[en]);
                totWordsLen -= len[en];
                en -= 1;
            }

            // 2. Find the all leftspaces.
            int totSpaces = maxWidth - totWordsLen;
            int Q = (en != st) ? (totSpaces / (en - st)) : totSpaces;
            int R = (en != st) ? (totSpaces % (en - st)) : 0;

            // 3. Making a string to push to the answer.
            string str = "";
            int j = st;
            string spaces = "";
            for (int i = 0; i < Q; i++) spaces += " ";

            // 4-1. If there is only one word (Including the last line case - having all the spaces in the end)
            if (en == st) {
                str += words[en] + spaces;

            // 4-2. If there are many words
            } else {
                // If this line is the last line.
                if (en == n-1) R = 0, Q = 1, spaces = " ";

                while (j <= en) {
                    str += words[j];
                    if (j < en) {
                        if (R > 0) {
                            str += spaces + " ";
                            R--;
                        } else {
                            str += spaces;
                        }
                    }
                    j += 1;
                }
                // If this line is the last line.
                while (maxWidth - str.size() > 0) str += " ";
            }

            ret.push_back(str);
            st = en + 1;
            en = st;
        }


        return ret;
    }
};
```