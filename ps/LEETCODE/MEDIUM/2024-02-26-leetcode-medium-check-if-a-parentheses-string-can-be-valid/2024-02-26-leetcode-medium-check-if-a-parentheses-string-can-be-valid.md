---
layout: post
title : "Leetcode::problem(2116) Check if a Parentheses String Can be valid"
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
date: "2024-02-26"
---

# Leetcode::Check if a parentheses string can be valid
- [Link : Leetcode::Check if a parentheses string can be valid](https://leetcode.com/problems/check-if-a-parentheses-string-can-be-valid/description/)

- level : medium
- solved after reading Hint on the problem
- Total : 1hr 9 min

# point
- A parentheses string is a non-empty string consisting only of '(' and ')'.
- You are given a parentheses string s and string locked, both of length n
- locked is a binary string consisting only of '0's and '1's.
- For each index i of locked,
	- If locked[i] is '1', you cannot change s[i]
	- But If locked[i] is '0', you can change s[i] to either '(' or ')'
- Return true if you can make s a valid parentheses string.
- return false, Otherwise.

# Design
- This problem is a bit hilarious among other parentheses problems.
- The logic to solve is quite simple, but make sure to understand the foundational idea which is
  - When you encounter a fixed close bracket ')' (locked[i] is 1), you have to find open bracket '('.
	- You would probably tend to find any of either unlocked[i-x] or locked[i-x] && open bracket which is on the left side from current one.
  - I thought that I must use the closest one from i between above two, so anyone of them can be the open bracket for the fixed closed bracket[i].
	- But this assumption was wrong!!
	- Truth is, you can use open bracket even if there's closest unlocked[i-x].
	- Let me give you an example.
	- Let's say, i-2 and i-1 are not matched(used) yet.
	  - i-2 : locked = 1, '('
	  - i-1 : locked = 0 
	  - i   : locked = 1, ')'
	- For ')' of i, We should use i-2 first instead of i-1, since unlocked one can be anything
	- The priority of finding left bracket for the closed one is
	  - (O) : locked left bracket > unlocked bracket
		- (X) : closest one which can be left bracket.
- I hope we can find similar problem and solve it to make sure the logic.

# Big O(time)
- Time : O(N)

# Code

```cpp
enum {
    LEFT, RIGHT, ANY
};
class Solution {
public:
    bool canBeValid(string s, string locked) {
        bool f = true;
        int n = s.size();
        vector<int> LEs, ANYs;
        for(int i = 0; i < n; i++) {
            if (locked[i] == '1') {
                if (s[i] == '(') {
                    LEs.push_back(i);
                } else { // (s[i] == RIGHT) {
                    if (LEs.size() + ANYs.size() == 0) {f = false; break;}
                    if (LEs.size() > 0) LEs.pop_back();
                    else ANYs.pop_back();
                }

            } else {
                ANYs.push_back(i);
            }
        }
        while(!LEs.empty() && !ANYs.empty()) {
            if (ANYs.back() < LEs.back()) { f = false; break;}
            LEs.pop_back(), ANYs.pop_back();
        }
        if (!LEs.empty()) f = false;
        if (ANYs.size() %2 != 0) f = false;

        return f;
    }
};
```
