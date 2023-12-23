---
layout: post
title : "Leetcode::problem(71) Simplify path"
subtitle: "Leetcode ps medium"
type: "Leetcode medium"
medium: true
ps: true
leetcode: true
text: true
author: "beenpow"
post-header: true
header-img: "https://upload.wikimedia.org/wikipedia/commons/0/0c/GoldenGateBridge-001.jpg"
order: 1
date: "2023-12-23"
---

# Leetcode:Simplify Path
- [Link : Leetcode::Simplify path](https://leetcode.com/problems/simplify-path/description/)

- level : medium

# point
- A directory type string is given
- Return it as canonical path

# Design
- It's simply logical case problem, so we solve the problem not omitting any case
- We can sort out that there are only a few inputs available
- Which are
  - '/'
	- '.'
  - English alphabets

- We can solve this problem easily, if we put '/' in the end of the path and we take the token which is guarded by '/' and '/'.
- And see if the token is one of those, otherwise it's only a directory name
  - '/'
	- '.'
	- '..'

# Big O(time)
- O(N)

# Code

```cpp
class Solution {
public:
    string simplifyPath(string path) {
        path += '/';
        vector<string> v;
        int st = -1, en = -1;
        for(int i = 0; i < path.size(); i++){
            if (path[i] == '/') {
                if (st == -1) {
                    st = i;
                }
                else {
                    en = i;
                    // do something
                    if (st + 1 == en) ; // "//" -> do nothing
                    else {
                        if (st + 2 == en && path[st+1] == '.'); // "/./" -> do nothing
                        else if (st + 3 == en && path[st+1] == '.' && path[st+2] == '.') {
                            // "/../" -> upper level
                            if (v.empty()) ; // do nothing
                            else v.pop_back();
                        }
                        else {
                            v.push_back(path.substr(st+1, (en - st - 1)));
                        }
                    }
                    // shift
                    st = en; en = -1;
                }
            }
        }
        string ret = "";
        for(int i = 0; i < v.size(); i++) {
            ret += "/" + v[i];
        }
        if (ret == "") ret = "/";
        return ret;
    }
};
```
