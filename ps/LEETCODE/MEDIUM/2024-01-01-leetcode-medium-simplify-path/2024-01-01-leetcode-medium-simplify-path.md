---
layout: post
title : "Leetcode::problem(71) Simplify Path"
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
date: "2024-01-01"
---

# Leetcode::Simplify Path
- [Link : Leetcode::Simplify Path](https://leetcode.com/problems/simplify-path/description/)

- level : medium

# point
- Given a string path, which is an absolute path (starting with a slash '/') to a file or directory in a Unix-style file system, convert it to the simplified canonical path
- Return the simplified canonical path

# Design
- The canonical path should have the following format:
  - The path starts with a single slash '/'
	- Any two directories are separated by a single slash '/'
	- The path does not end with a trailing '/'
	- The path only contains the directories on the path from the root directory to the target file or directory
- We just need to solve the problem as it is described
- The only thing we need to focus is that it's necessary to tokenize each word which is directory name, so we can use string vector to put names in it.

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
