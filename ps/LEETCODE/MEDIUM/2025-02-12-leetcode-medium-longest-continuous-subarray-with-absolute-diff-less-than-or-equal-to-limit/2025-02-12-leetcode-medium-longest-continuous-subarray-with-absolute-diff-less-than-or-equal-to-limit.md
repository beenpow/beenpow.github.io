---
layout: post
title : "Leetcode::problem longest continuous subarray with absolute diff less than or equal to limit"
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
date: "2025-02-12"
---

# Leetcode::longest continuous subarray with absolute diff less than or equal to limit
- [Link : Leetcode:longest continuous subarray with absolute diff less than or equal to limit](https://leetcode.com/problems/longest-continuous-subarray-with-absolute-diff-less-than-or-equal-to-limit/description/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, 5 10 10 10 30
- level : medium

# point
- Given an array of integers nums and an integer limit, return the size of the longest non-empty subarray such that absolute difference between any two elements of this subarray is less than or equal to limit.

# Design

## using a map
- I've solved with a map.
- Using map is very intuitive when we need to utilize 'sliding window' technique.
- Simply, we maintain the whole members in a map(window).
- Then we opt out from the left side of the window whenever the difference between max and min is greater than limit.

## using a deque
- While I search through the Editorial of this problem after solved it with a map, I encountered there is a great way to solve this problem with shortern time complexity.
- It uses two deques.
- One is decreasing ordered deque
- Another is increasing ordered deque
- It's very similar with the method using a map, but the difference is we do not contain the whole values on the deques even if the window contains more values.
- It is simply designed to maintain the min and max on the window.
- Also, it is very rare problem using deque.


# Big O(time)
- using map
	- TIME : O(NlogN)
	- SPACE : O(N)
- using two deques
	- TIME : O(N)
	- SPACE : O(N)

# Code

## using map

```cpp
class Solution {
public:
    int longestSubarray(vector<int>& nums, int limit) {
        int ret = 1, le = 0;
        map<int,int> cur;

        int mn = nums[0], mx = nums[0];
        for (int i = 0; i < nums.size(); i++) {
            if (!cur.empty() && cur.find(nums[i]) != cur.end()) cur[nums[i]]++;
            else  cur[nums[i]] = 1;

            mn = cur.begin()->first;
            mx = (--cur.end())->first;

            while(mx - mn > limit && !cur.empty()) {
                cur[nums[le]]--;
                if (cur[nums[le]] == 0)  cur.erase(nums[le]);
                le++;

                if (!cur.empty()) {
                    mn = cur.begin()->first;
                    mx = cur.rend()->first;
                }
            }
            if (!cur.empty())
                ret = max(ret, (i - le) + 1);
        }
        return ret;
    }
};
```

## using two deques

```cpp
class Solution {
public:
    int longestSubarray(vector<int>& nums, int limit) {
        int ret = 1, le = 0, ri = 0;
        deque<int> mxDeque, mnDeque;

        for (;ri < nums.size(); ri++) {
            while(!mxDeque.empty() && mxDeque.back() < nums[ri]) mxDeque.pop_back();
            mxDeque.push_back(nums[ri]);

            while(!mnDeque.empty() && mnDeque.back() > nums[ri]) mnDeque.pop_back();
            mnDeque.push_back(nums[ri]);

            while (mxDeque.front() - mnDeque.front() > limit) {
                if (mxDeque.front() == nums[le]) mxDeque.pop_front();
                if (mnDeque.front() == nums[le]) mnDeque.pop_front();
                le++;
            }
            ret = max(ret, (ri - le) + 1);
        }
        return ret;
    }
};
```
