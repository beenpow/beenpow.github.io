---
layout: post
title : "Leetcode::problem string compressiona"
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
date: "2025-02-05"
---
# Leetcode::string compression
- [Link : Leetcode:string compression](https://leetcode.com/problems/string-compression/description/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, 10 5 10 5 0
- level : medium

# point
- Given an array of characters chars, compress it.

# Design
- It's a implementation problem.
- All we need to do is implementing as it is guided on the problem.
- However there is one factor that we have to make sure before we jump into it.
- Since we can only use constant extra space, it's necessary to re-use the input array which is 'chars'.
- What we need to think about for a second is if there's a chance of overwriting on a inddex.
- While we iterating the whole given input, we have to write from the first index of the array.
- Is it possible to write something before we read it?
- The answer is no.
  - To write something on a index before we read, it's necessary to write more characters than read.
	- Let me break down a bit more.
	- When input is ['a'], output is ['a']
	- When input is ['a','a'], output is ['a', '2']
	- When input is ['a','a','a'], output is ['a', '3']
  - When input is ['a','a','a'..,'a'], output is ['a','1','2']
	- ...
	- For up to two chracters, output length is same as input.
	- Over two same chracters, output length is way shorter than input.
- After understanding above limitation, now we only need to check each character and count it.

# Big O(time)

# Code

```cpp
class Solution {
public:
    void pushingEach(vector<char>& ch, int& id, int cnt) {
        string temp = to_string(cnt);
        for (int i = 0; i < temp.size(); i++) {
            ch[id++] = temp[i];
        }
    }
    int compress(vector<char>& chars) {
        int id = 0;
        int started = -1;
        char c = 'a';
        for(int i = 0; i < chars.size(); i++) {
            if (started == -1) {
                started = i;
                c = chars[i];
            } else {
                if (chars[i] == c) {
                    // do nothing
                } else {
                    chars[id++] = c;
                    if (i - started > 1)
                        pushingEach(chars, id, i - started);

                    started = i;
                    c = chars[i];
                }
            }
        }
        if (started != -1) {
            chars[id++] = c;
            int len = (int)chars.size() - started;
            if (len > 1)
                pushingEach(chars, id, len);
        }
        return id;
    }
};
```
