---
layout: post
title : "Leetcode::problem(418) Sentence Screen Fitting"
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
date: "2024-04-04"
---

# Leetcode::Sentence Screen Fitting
- [Link : Leetcode::Sentence Screen Fitting](https://leetcode.com/problems/sentence-screen-fitting/)

- level : medium
- 35mins to solve

# point
- Given a rows x cols screen and a sentence represented as a list of strings
- Return the number of times the given sentence can be fitted on the screen

# Design
- From the first sight, the solving techinique was either math or naive counting
- As I hand-tested some test cases, I figured it has to use both of them
- Here's how I solved the problem
  - TOT_LEN : First of all, we need total length of widened sentences. (There should be '-' between them)
  - Then, we iterate each row
	  - At each iteration, we have 'cols' spaces to fill
		- Now we check if we can divide cols by TOT_LEN, which means we don't need to naively fill all the way down
		- Then we've got only some left length which is less than TOT_LEN, now we naively check each sentence
- As you can see above logic, iteration will be O(10^4) which is length of 'rows'.
  - At each iteration, we use math O(1) and naively counting O(100) which is length of 'sentence'

# Big O(time)
- TIME : O(2 * 10^4 (cols) x 100)
- SPACE : O(1)

# Code

```cpp
class Solution {
public:
    int wordsTyping(vector<string>& sentence, int rows, int cols) {
        // Include last space -> "a-b-c-d-"
        int TOT_LEN = 0; for(auto x : sentence) TOT_LEN += (x.size() + 1);

        const int SZ = sentence.size();
        int rounds = 0, curId = 0;
        for(int i = 0; i < rows; i++) {
            int leftover = cols;
            if (leftover >= TOT_LEN - 1) {
                int q = leftover / TOT_LEN;
                rounds += q;
                leftover -= q * TOT_LEN;

                // Handling the case of perfectly fitting to cols size
                if (q == 0) {
                    rounds += 1;
                    continue;
                }
            }
            // left less than one round of whole strings
            while(leftover >= 0) {
                if (leftover >= sentence[curId].size()) {
                    leftover -= (sentence[curId].size() + 1); // one extra dash
                    curId++;
                } else break;
                if (curId == SZ) rounds++, curId = 0;
            }
        }


        return rounds;
    }
};
```
