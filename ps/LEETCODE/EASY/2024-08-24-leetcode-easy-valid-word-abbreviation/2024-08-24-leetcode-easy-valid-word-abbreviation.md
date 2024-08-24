---
layout: post
title : "Leetcode::problem(408) Valid Word Abbreviation"
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
date: "2024-08-24"
---

# Leetcode::Valid Word Abbreviation
- [Link : Leetcode::Valid Word Abbreviation](https://leetcode.com/problems/valid-word-abbreviation)

- level : easy
- took 22 mins to solve.

# point
- Given a string word and an abbreviation abbr, return whether the string matches the given abbreviation.

# Design
- This is pretty much 'implementation' problem.
- There's no trick, but some exceptional cases.
- We need to care about exceptional cases such as 'no leading zero'.
- Beside that, I seperated the logic into two parts.
  - First part handles if the current abbr indicates a character.
	- Second part handles if the current abbr indicates a number.

# Big O(time)
- TIME : O(N)
- SPACE : O(1)

# Code

```cpp
class Solution {
public:
    bool validWordAbbreviation(string word, string abbr) {
        int cursor_abbr = 0, cursor_word = 0;
        while (cursor_abbr < abbr.size()) {
            if (abbr[cursor_abbr] >= 'a' && abbr[cursor_abbr] <= 'z') {
                if (abbr[cursor_abbr++] != word[cursor_word++]) return false;
            } else {
                string parsed = parse(abbr, cursor_abbr);
                // check exceptions
                if (parsed[0] == '0') return false;

                int count = stoi(parsed);
                if (cursor_word + count > word.size()) return false;
                cursor_word += count;
                cursor_abbr += parsed.size();
            }
        }

        if (cursor_word != word.size()) return false;
        return true;
    }
    string parse(const string & abbr, int cursor) {
        int givenCursor = cursor;
        while(cursor < abbr.size() && (abbr[cursor] >= '0' && abbr[cursor] <= '9'))
            cursor++;
        return abbr.substr(givenCursor, (cursor - givenCursor));
    }
};
```
