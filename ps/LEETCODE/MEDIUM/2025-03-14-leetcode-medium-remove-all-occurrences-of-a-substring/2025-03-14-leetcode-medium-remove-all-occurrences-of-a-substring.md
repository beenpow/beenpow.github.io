---
layout: post
title : "Leetcode::problem remove all occurrences of a substring"
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
date: "2025-03-14"
---

# Leetcode::remove all occurrences of a substring
- [Link : Leetcode:remove all occurrences of a substring]()
- Solved, 4 5 5 0 120
- level : medium
- [KMP Reference](https://www.geeksforgeeks.org/remove-all-occurrences-of-string-t-in-string-s-using-kmp-algorithm/)

# point
- Given two strings s and part, perform the following operation on s until all occurrences of the substring part are removed.
  - Find the leftmost occurrence of the substring part and remove it from s.
- Return s after removing all occurrences of part.

# Design
- I've solved with simple stack, but utilizing kmp algorithms seems more efficient.
- So I want to introduce both ways.
- simple stack
  - Pretty simple.
	- We stack a character while we iterate 's'.
	- If we find the last substring of the s is equal to part, we pop them.
- kmp
  - If we utilize kmp we can save more time, since we will be able to re-use the already calculated results wisely.
	- If it's just an kmp problem, we only need to use LPS data.
	- However, this problem requires removing the leftmost occurence every time.
	- To manage that, we add a structured called 'pattern'.
	- This pattern vector stores the last used index when we compare with the given part string.
  - Let's say, substring s(i ~ i + m) is equal to part.
	- After we figured they are matched, we now get back to s[i-1] to rematch from there.
	- Without LPS and 'pattern' vector, we have to start all over again from s[0].
	- However, since we stored the LPS on the pattern, we simply pop back from 'pattern' to start from s[i-1].

# Big O(time)
- n : length of the string s, m : length of the substring part.
- simple stack
  - TIME : O(NM)
	- SPACE : O(N+M)
- kmp
  - TIME : O(N + M)
	- SPACE : O(N + M)
			- N for stk, ptrn
			- M for LPS


# Code

## simple stack

```cpp
class Solution {
public:
    string removeOccurrences(string s, string part) {
        string ret = "";
        int n = s.size(), m = part.size();
        for(int i = 0; i < n; i++) {
            ret.push_back(s[i]);
            if (ret.size() >= m && ret.substr(ret.size() - m, m) == part) {
                for(int j = 0; j < m; j++) ret.pop_back();
            }
        }
        return ret;
    }
};
```

## kmp

```cpp
class Solution {
public:
    void gettingLPS(int m, string part, vector<int>& LPS) {
        int len = 0;
        LPS[0] = 0;
        int i = 1;
        while(i < m) {
            if (part[len] == part[i]) {
                len++;
                LPS[i] = len;
                i++;
            } else {
                if (len != 0) {
                    len = LPS[len - 1];
                } else {
                    LPS[i] = 0;
                    i++;
                }
            }
        }
    }

    string removeOccurrences(string s, string t) {
        int n = s.size(), m = t.size();
        vector<int> kmpLPS(m, 0);
        gettingLPS(m, t, kmpLPS);
        
        stack<char> stk;
        vector<int> ptrn(n + 1, 0);

        int i = 0, j = 0;
        while (i < n) {
            stk.push(s[i]); // added
            if (s[i] == t[j]) {
                i++;
                j++;

                ptrn[stk.size()] = j; // added

                if (j == m) {
                    /* Added a block */
                    int len = m;
                    while (len != 0) {
                        stk.pop();
                        len--;
                    }
                    // j = LPS[j-1]; // deleted

                    j = (stk.empty() ? 0 : ptrn[stk.size()]);
                }
            } else {
                if (j != 0) {
                    j = kmpLPS[j - 1];
                    stk.pop(); // added
                } else {
                    ptrn[stk.size()] = 0;
                    // ret += s[i]; // deleted
                    i++;
                }
            }
        }
				string ret;
				ret.reserve(stk.size());

				while(!stk.empty()) {
		    	ret += stk.top();
    			stk.pop();
				}

				reverse(ret.begin(), ret.end());
				return ret;

    }
};
```
