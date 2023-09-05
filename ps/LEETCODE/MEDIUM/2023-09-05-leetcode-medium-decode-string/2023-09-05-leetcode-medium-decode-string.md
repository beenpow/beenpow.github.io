---
layout: post
title : "Leetcode::problem(394) Decode String"
subtitle: "Leetcode ps medium"
type: "Leetcode medium"
medium: true
ps: true
leetcode: true
text: true
author: "beenpow"
post-header: true
header-img: "https://www.spotebi.com/wp-content/uploads/2019/01/one-day-day-one-workout-motivation-spotebi.jpg"
order: 1
date: "2023-09-05"
---

# Leetcode::Decode String
- [Link : Leetcode::Decode String](https://leetcode.com/problems/decode-string/description/?envType=study-plan-v2&envId=google-spring-23-high-frequency)

- level : medium

# point
- Encoded string is given, return its decoded string
- The encoding rule is k[encoded_string]

# Design
- The problem is typical push/pop problem
- We can solve this problem with two vectors (times, strings)
- The logic is like below
- We iterates the given string s
  - If s[i] is
	  - number -> Find number and string (The form of this would be "number[string")
		- character -> Find string (This string does not repeated itself, becuase there's no number for it)
		  - If the strings vector is empty, this should be attached to the output
			- Otherwise, attach it to the back string of strings
		- ']' -> repeate times.back() times for strings.back() string then 
		   - If the strings vector is empty, this should be attached to the output
			 - Otherwise, attach it to the back string of strings


# Big O(time)
- under O(1e5)

# Code

```cpp
class Solution {
public:

    // s[i]
    int getNum(string s, int & i) {
        int ret = 0;
        while(s[i] >= '0' && s[i] <= '9') {
            ret = ret * 10 + (s[i] - '0');
            i++;
        }
        return ret;
    }
    string getString(string s, int & i) {
        string str = "";
        while(s[i] >= 'a' && s[i] <= 'z') {
            str += s[i];
            i++;
        }
        return str;
    }
    string decodeString(string s) {
        vector<int> times;
        vector<string> strings;
        string ans = "";


        for(int i = 0; s[i]; i++) {
            if (s[i] >= '0' && s[i] <= '9') {
                int ti = getNum(s, i);
                // s[i+1] == '['
                if (s[i] != '[') static_assert("WRONG", "EXCEPTION");
                i += 1;
                string str = getString(s, i); i--;
                times.push_back(ti);
                strings.push_back(str);
            }
            else if (s[i] >= 'a' && s[i] <= 'z') {
                string str = getString(s, i); i--;
                if (strings.empty()) ans += str;
                else strings.back() = strings.back() + str;
            }
            else if (s[i] == ']') {
                if (times.empty() || strings.empty()) static_assert("WRONG", "EXCEPTION");
                string str = strings.back(); strings.pop_back();
                int ti = times.back();       times.pop_back();
                string totStr = "";
                while(ti--) totStr += str;

                if(strings.empty()) ans += totStr;
                else strings.back() = strings.back() + totStr;
            } else {
                static_assert("WRONG", "EXCEPTION");
            }
        }
        return ans;
    }
};
```
