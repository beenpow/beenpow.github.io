---
layout: post
title : "Leetcode::problem palindrome partitioning"
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
date: "2025-03-07"
---

# Leetcode::palindrome partitioning
- [Link : Leetcode:palindrome partitioning](https://leetcode.com/problems/palindrome-partitioning/description/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, 5 10 7 0 10
- level : medium

# point
- Given a string s, partition s such that every substring of the partition is a palindrome.
- Return all possible palindrome partitioning of s.

# Design
- We can do dfs for checking partiion of s.
- Of course we can naively make every substring in a dfs node.
- However, that can waste sum of our time complexity, because we would check if the string is palindrome every time.
- So if we handle this thing wisely, like using dynamic programming way, we can save some more time.
- Check out 'pals' on my code which was used as a kind of dynamic programming way.
- Other then that, simple problem.


# Big O(time)
- TIME
  - O(N * 2^N)
	  - Where, N is the length of the given string.
		- Making substr in a dfs takes O(N).
	  - There are at most 2^N dfs nodes.
- SPACE
  - O(N^2)

# Code

```cpp
class Solution {
public:
    const int MAXLEN = 16;
    bool isPalindrome(string s) {
        int i = 0, j = s.size() - 1;
        while(i <= j && s[i] == s[j]) i++,j--;
        return (i > j);
    }
    void dfs(string s, int id, int n, vector<vector<int>>& pals, vector<vector<string>> &ret, vector<string>&soFar) {
        if (id == n) {
            ret.push_back(soFar);
            return;
        }
        for(auto nxtId : pals[id]) {
            soFar.push_back(s.substr(id, nxtId - id + 1));
            dfs(s, nxtId + 1, n, pals, ret, soFar);
            soFar.pop_back();
        }
    }
    vector<vector<string>> partition(string s) {
        vector<vector<int>> pals(MAXLEN, vector<int>());
        int n = s.size();
        for(int i = 0; i < n; i++) {
            for (int j = i; j < n; j++) {
                string part = s.substr(i, j - i + 1);
                if (isPalindrome(part)) {
                    pals[i].push_back(j);
                }
            }
        }


        vector<vector<string>> ret;
        vector<string> soFar;
        dfs(s, 0, n, pals, ret, soFar);

        return ret;
    }
};
```
