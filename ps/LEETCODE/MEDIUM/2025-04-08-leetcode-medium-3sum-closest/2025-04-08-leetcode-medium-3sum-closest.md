---
layout: post
title : "Leetcode::problem 3sum closest"
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
date: "2025-04-08"
---

# Leetcode::3sum closest
- [Link : Leetcode:3sum closest](https://leetcode.com/problems/3sum-closest/description/)
- Solved, algorithm 60
- level : medium

# point
- Given an integer array nums of length n and an integer target, find three integers in nums such that the sum is closest to target.

# Design
- I've tried with two pointers but failed.
- The reason why I failed is because I did not fixed indices.
- To be specifit, we choose three indicies, such as (i, lo, hi).
- I was considering all the combinations of those three, like (lo, i, hi), (lo, hi, i).
- So indicies kind of messed up.
- However, the Editorial suggests to fix 'i' as a smallest index.
- So the three indices will be (i, lo, hi). (i < lo < hi).
- Which makes everything simpler, although it is a very simple idea.
- With that approach, we can find lo and hi indices while iterating the given nums.
  - Since i is fixed, we set lo as i + 1, hi as n - 1.
  - Then move lo and hi indicators based on the value(sum - target).
- There is another approach called binary search for this problem.
    - It is basically very similar with previous approach.
    - We fix i and j (i < j).
    - Then find k in O(logN) time with upper_case function. (i < j < k)
    - To do that, we first sort the given nums.
    - Then use upper_case function for the number (target - nums[i] - nums[j]).
    - In this case the iteration can be either indicating nums.end() or somewherelese.
    - Let's say this point as 'hi'.
    - Then we also need to check 'lo' which is 'hi - 1'.
    - Because we found 'upper_case' position, the position of 'lo' can be the potential answer too.
    - To be specific, 77 and 79 can be answer if target is 78.

# Big O(time)
- Two pointers
    - TIME : O(N^2)
    - SPACE : O(1)
- Binary Search
    - TIME : O(N^2logN)
    - SPACE : O(1)

# Code

## Two pointers

```cpp
class Solution {
public:
    int threeSumClosest(vector<int>& nums, int target) {
        sort(nums.begin(), nums.end());
        int mnGap = 1e7;
        int ans = -1;
        for(int i = 0; i < nums.size() - 2; i++) {
            int lo = i + 1, hi = nums.size() - 1;
            while(lo < hi) {
                int sum = nums[i] + nums[lo] + nums[hi];
                if (abs(sum - target) < mnGap) {
                    mnGap = abs(sum - target);
                    ans = sum;
                }
                if (sum < target) lo++;
                else hi--;
            }
        }
        return ans;
    }
};
```

## Binary Search

```cpp
class Solution {
public:
    int threeSumClosest(vector<int>& nums, int target) {
        sort(nums.begin(), nums.end());
        int mnGap = 1e7;
        int ans = -1;
        for(int i = 0; i < nums.size() - 2; i++) {
            for(int j = i + 1; j < nums.size() - 1; j++) {
                int comp = target - nums[i] - nums[j];
                auto it = upper_bound(nums.begin() + j + 1, nums.end(), comp);
                // comment out below line, because hi can be nums.end(), but lo is not.
                // if (it == nums.end()) continue;
                int hi = it - nums.begin(), lo = hi - 1;
                if (hi < nums.size() && abs(comp - nums[hi]) < mnGap) {
                    mnGap = abs(comp - nums[hi]);
                    ans = -comp + target + nums[hi];
                }
                if (lo > j && abs(comp - nums[lo]) < mnGap) {
                    mnGap = abs(comp - nums[lo]);
                    ans = -comp + target + nums[lo];
                }
            }
        }
        return ans;
    }
};
```