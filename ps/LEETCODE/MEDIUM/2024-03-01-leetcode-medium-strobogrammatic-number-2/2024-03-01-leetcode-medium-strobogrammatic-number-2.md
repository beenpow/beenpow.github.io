---
layout: post
title : "Leetcode::problem(247) Strobogrammatic Number 2"
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
date: "2024-03-01"
---

# Leetcode::Strobogrammatic Number 2
- [Link : Leetcode::Strobogrammatic Number 2](https://leetcode.com/problems/strobogrammatic-number-ii/description/)

- level : medium
- 48 mins to solve

# point
- Given an integer n, return all the strobogrammatic numbers that are of length n
- You may return the answer in any order
- A strobogrammatic number is a number that looks the same when rotated 180 degrees

# Design
- I had no idea what was 'Strobogrammatic Number' :(
- Let's shorten it as SBG Number or SBG
- You'll find out there are only a few words that can be used for SBG, which are
  - { 0, 1, 8 }, { 6, 9 }
- From now on, let's think about fron half and rear half
- They should be same when one of them is rotated.
- When we check if the rotated ones are matched, we compare numbers like when we check palindrome
  - For example, first element - last element, second from start - second from rear
- Let's call it as a pair (from front and rear)
- For the pair,
  - { 0, 1, 8 } can be used as same number such as x1xx1x or xx0xx0xx
	- { 6, 9 } should be used as a set such as 6xxxx9 or xx96xx
- So we have 5 options to each pair.
- I chose to use recursion function since it's easy to make the whole string as a result
- At each function call,
  - I make a pair and call the next pair
	- If it's the end of pairs, make a whole string and put it in the return vector.
- One thing to notice is that we should be careful to use '0'
  - As we checked the example, there shouldn't be any string with leading zero, except when the n is 1.

# Big O(time)
- TIME: O(N * 5^(N/2))
	- The length of DFS is N/2, because we fill two numbers at each recursion
	- At the end of the dfs when every number is set, we attach front string and back string which can take O(N)

# Code

```cpp
class Solution {
public:
    string _solo = "018";
    vector<string> ret;
    void makeSBG(int curFront, int curRear, string fromFront, string fromRear, int n) {
        if (curFront > curRear) {
            reverse(fromRear.begin(), fromRear.end());
            ret.push_back(fromFront + fromRear);
            return;
        }
        // It's center of the whole string when n is odd number.
        if (curFront == curRear) {
            for(auto x : _solo) {
                makeSBG(curFront+1, curRear-1, fromFront + x, fromRear, n);
            }
        } else {
            for(auto x : _solo) {
                if (curFront == 0 && x == '0') {
                    continue;
                }
                makeSBG(curFront+1, curRear-1, fromFront + x, fromRear + x, n);
            }
            makeSBG(curFront+1, curRear-1, fromFront + "6", fromRear + "9", n);
            makeSBG(curFront+1, curRear-1, fromFront + "9", fromRear + "6", n);
        }
    }
    vector<string> findStrobogrammatic(int n) {
        if (n == 1) {
            ret.push_back("0"); ret.push_back("1"); ret.push_back("8");
            return ret;
        }
        makeSBG(0, n-1, "", "", n);
        return ret;
    }
};
```
