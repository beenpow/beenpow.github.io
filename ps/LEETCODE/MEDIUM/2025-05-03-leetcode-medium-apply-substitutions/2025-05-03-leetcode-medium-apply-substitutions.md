---
layout: post
title : "Leetcode::problem apply substitutions"
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
date: "2025-05-03"
---

# Leetcode::apply substitutions
- [Link : Leetcode:apply substitutions](https://leetcode.com/problems/apply-substitutions/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, 5 10 25 2 0
- level : medium

# point
- You are given a replacements mapping and a text string that may contain placeholders formatted as %var%, where each var corresponds to a key in the replacements mapping. 
- Each replacement value may itself contain one or more such placeholders. 
- Each placeholder is replaced by the value associated with its corresponding replacement key.
- Return the fully substituted text string which does not contain any placeholders.

# Design
- There can be other values(ex : "%A%") in a value(ex : B%A%).
- But a value can hold at most two other values as maximum, since a value can have upto 8 characters.
- So, we run while-loop to substitute the placeholder.
- Then we find the answer with the pre-calculated(subsituted) strings.

# Big O(time)
- K : length(key)
- V : length(value)
- N : length(replacements)
- 26 : length(alphabets)
- N <= 26

- TIME : O(N^2)
    - len(replacements[i][1]) <= 8
    - It means that, each value can have upto two other values, since '%X%' takes three characters, it can only contains two values.
    - So the while-loop can be called upto two times(depth).
- SPACE : O(N)

# Code

```cpp
class Solution {
public:
    string applySubstitutions(vector<vector<string>>& replacements, string text) {
        int n = replacements.size();
        map<char, string> mp;
        for(int i = 0; i < n; i++) mp[ replacements[i][0][0] ] = replacements[i][1];

        // [impossible case : cycle] %A% -> %B% -> %A%
        bool changed = true;
        while(changed) {
            changed = false;
            for(auto it = mp.begin(); it != mp.end(); it++) {
                string s = it->second, t = "";
                for (int i = 0; i < s.size(); i++) {
                    if (s[i] == '%') {
                        t += mp[s[i+1]];
                        i += 2;
                        changed = true;
                    } else t += s[i];
                }
                it->second = t;
            }
        }

        string ans = "";
        for(int i = 0; i < text.size(); i++) {
            if (text[i] == '%') {
                ans += mp[text[i+1]];
                i += 2;
            } else ans += text[i];
        }

        return ans;
    }
};
```