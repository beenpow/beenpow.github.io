---
layout: post
title : "Leetcode::problem(581) Shortest Unsorted Continuous Subarray"
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
date: "2023-08-01"
---

# Leetcode::Shortest Unsorted Continuous Subarray
- [Link : Leetcode::Shorted Unsorted Continuous Subarray](https://leetcode.com/problems/shortest-unsorted-continuous-subarray/description/?envType=study-plan-v2&envId=google-spring-23-high-frequency)

- level : medium

# point
- Find the smallest subarray that is sorted in non-increasing order

# Design
- With sort, we can solve this problem easily
  - After sorting the given array, values should be same between the given one and sorted one when we iterates from left to right (right to left)
  - If not, that's the left(right) side of the answer

- We can solve the problem with stack, too
  - Let's say we are trying to find left side of the answer
  - Then we iterate the given array from the left side of the given array
    - We pop the top of the stack if its value is larger than the current value of (i)
      - What it's doing is that we are trying to right position for 'i'. (which can be the left side of the answer)
    - Otherwise, We push index to the stack
- And it goes to the right side same

# Big O(time)

- Sort   => O(NlogN)
- Stack  => O(N)

# Code

## With sort way

```cpp
#define fi first
#define se second
class Solution {
public:
    int findUnsortedSubarray(vector<int>& nums) {
        if (nums.size() == 0) return 0;
        vector<pair<int,int> > vp(nums.size());
        for(int i = 0; i < nums.size(); i++) vp[i] = {nums[i], i};
        sort(vp.begin(), vp.end());

        // Left -> Right
        int sz = vp.size();
        int le = -1, ri = -1;
        for(int i = 0; i < sz - 1; i++) {
            if (vp[i].se != i ) {
                int t = i; bool f = false;
                while(i + 1 < sz && vp[i].fi == vp[i+1].fi){
                    i++;
                    f = true;
                }
                if (i == sz) break;
                if (f) le = t;
                else le = i;
                break;
            }
        }
        for(int i = sz - 1; i > 0; i--) {
            if (vp[i].se != i) {
                int t = i; bool f = false;
                while (i - 1 >= 0 && vp[i].fi == vp[i-1].fi) {
                    i--;
                    f = true;
                }
                if (i == -1) break;
                if (f) ri = t;
                else ri = i;
                break;
            }
        }
        if (le == -1 || ri == -1) return 0;
        return (ri - le) + 1;
    }
};
```

## With stack way

```cpp
class Solution {
public:
    int findUnsortedSubarray(vector<int>& nums) {
        int sz = nums.size();
        int le = sz, ri = 0;
        vector<int> stk;
        for(int i = 0; i < sz; i++) {
            while (!stk.empty() && nums[stk.back()] > nums[i]) {
                le = min(le, stk.back());
                stk.pop_back();
            }
            stk.push_back(i);
        }

        stk.clear();
        for(int i = sz - 1; i >= 0; i--) {
            while (!stk.empty() && nums[stk.back()] < nums[i]) {
                ri = max(ri, stk.back());
                stk.pop_back();
            }
            stk.push_back(i);
        }
        if (ri > le) return (ri - le) + 1;
        else return 0;
    }
};
```
