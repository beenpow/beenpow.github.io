---
layout: post
title : "Leetcode::problem max sum of a pair with equal sum of digits"
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
date: "2025-03-09"
---

# Leetcode::max sum of a pair with equal sum of digits
- [Link : Leetcode:max sum of a pair with equal sum of digits](https://leetcode.com/problems/max-sum-of-a-pair-with-equal-sum-of-digits/description/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, 3 2 3 1 20
- level : medium

# point
- You are given a 0-indexed array nums consisting of positive integers.
- You can choose two indices i and j, such that i != j, and the sum of digits of the number nums[i] is equal to that of nums[j].
- Return the maximum value of nums[i] + nums[j]

# Design
- I solved with a map.
  - Simply, get the sum of digits and store it to a map.
	- Get the highest two values and use them to compare with the answer.
- However, there are incredible approach on the Editorial, so let me introduce two more methods to approach wisely this kind of problems.
- First of all, what would be the maximum sum of digits?
  - 1 <= nums[i] <= 10^9
	- So, the maxium sum of digits will be 81 (9 + 9 + 9 + 9 + 9 + 9 + 9 + 9 + 9).
- Now we know that we only need 81 kinds of digits sum.
- We utilize this factor wisely.
- There are two ways.
  - First one is using 82 priority queue.
	  - Using min heap would make us to maintain two maxium values easily.
	- Second one is using 82 maxValue which is stored in a vector.
	  - We maintain the maximum value at a digits sum.
		- Whenever we check the digits sum and there is one, we calculate if this sum can be the answer.
		- Then, renew the maximum value for the digits sum.

# Big O(time)
- Using a map
  - Time : O(NlogN)
	- Space : O(N)
- Using 82 pq
  - Time : O(N * max(logM, log2))
	  - logM : getting the digits sum.
		- log2 : getting the pop of the pq.
	- Space : O(logM)
- Using 82 maxValue
  - Time : O(NlogM)
	  - M is the maxmum value from the given nums.
		- getting digitsSum would take log_10(M).
	- Space : O(logM)
	  - Specifically, proportiaonal to logM.

# Code

## Using a map

```cpp
class Solution {
public:
    int getDigitSum(int x) {
        int ret = 0;
        while(x > 0) {
            ret += x%10;
            x /= 10;
        }
        return ret;
    }
    int maximumSum(vector<int>& nums) {
        map<int, vector<int>> mp;
        for(auto x : nums) {
            int digitSum = getDigitSum(x);
            mp[digitSum].push_back(x);
        }

        int maxSum = 0;
        for(auto it = mp.begin(); it != mp.end(); it++) {
            int sum = 0;
            if (it->second.size() > 1) {
                sort(it->second.rbegin(), it->second.rend());
                for(int i = 0; i < 2; i++) {
                    sum += it->second[i];
                }
            }
            maxSum = max(maxSum, sum);
        }
        return maxSum == 0 ? -1 : maxSum;
    }
};
```

## Using 82 pq

```cpp
class Solution {
public:
    int getDigitSum(int x) {
        int ret = 0;
        while(x > 0) {
            ret += x%10;
            x /= 10;
        }
        return ret;
    }
    int maximumSum(vector<int>& nums) {
        vector<priority_queue<int>> vpq(81 + 1); // min heap
        for(auto x : nums) {
            int s  = getDigitSum(x);
            vpq[s].push(-x);
            if (vpq[s].size() > 2) vpq[s].pop();
        }
        int ans = 0;
        for(int i = 0; i < 82; i++) if (vpq[i].size() == 2) {
            int s = -vpq[i].top(); vpq[i].pop();
            s += -vpq[i].top();

            ans = max(ans, s);
        }
        return ans == 0 ? -1 : ans;
    }
};
```

## Using 82 maxValue

```cpp
class Solution {
public:
    int getDigitSum(int x) {
        int ret = 0;
        while(x > 0) {
            ret += x%10;
            x /= 10;
        }
        return ret;
    }
    int maximumSum(vector<int>& nums) {
        int ans = 0;

        vector<int> maxValue(82, 0);
        for(auto x : nums) {
            int s = getDigitSum(x);
            if (maxValue[s] > 0) {
                ans = max(ans, maxValue[s] + x);
            }
            maxValue[s] = max(maxValue[s], x);
        }
        return ans == 0 ? -1 : ans;
    }
};
```
