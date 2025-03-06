---
layout: post
title : "Leetcode::problem count number of bad pairs"
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
date: "2025-03-06"
---

# Leetcode::count number of bad pairs
- [Link : Leetcode:count number of bad pairs](https://leetcode.com/problems/count-number-of-bad-pairs/description/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, algorithm 30
- level : medium
- Used all hints and solved.

# point
- You are given a 0-indexed integer array nums.
- A pair of indices (i, j) is a bad pair if i < j and j - i != nums[j] - nums[i].
- Return the total number of bad pairs in nums.

# Design
- It's hard to come up with solution if we only think about technical skills.
- However, if we break down the given equation, it enables us to simply utilize the equation.
- j -i != nums[j] - nums[i] can be changed to nums[i] - i != nums[j] -j
- It means that to be bad pairs, the value itself minus it's index should be different.
- So we get the value 'nums[i] - i' on the iteration, and see how many others have same value.
- If there are three other indices that has same value, it means they are the good pairs, so we simply get bad pairs by subtracting good pair count from i.
  - i == 0 -> has total zero pairs
	- i == 1 -> has total 1 pair  (0, 1)
	- i == 2 -> has total 2 pairs (0, 2), (1, 2)
	- ...
- The total value of adding all bad pairs is the answer.

# Big O(time)
- TIME : O(N)
- SPACE : O(N)

# Code

```cpp
class Solution {
public:
    long long countBadPairs(vector<int>& nums) {
        long long n = nums.size();
        long long ans = 0;
        unordered_map<int,int> mp;

        for(int i = 0; i < n; i++) {
            int badPairCnt = i - mp[nums[i] - i];
            ans += badPairCnt;

            mp[nums[i] - i]++;
        }
        return ans;
    }
};
```
