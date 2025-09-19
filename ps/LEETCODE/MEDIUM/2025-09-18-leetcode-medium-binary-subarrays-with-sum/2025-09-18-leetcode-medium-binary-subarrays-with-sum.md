---
layout: post
title : "Leetcode::problem binary subarrays with sum"
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
date: "2025-09-18"
---

# Leetcode::binary subarrays with sum
- [Link : Leetcode:binary subarrays with sum]()
- Solved, algorithm 120
- level : medium

# Problem Description
- Given a binary array nums and an integer goal, return the number of non-empty subarrays with a sum goal.

# How to solve
- I mixed up using prefix sum and sliding window when I tried to solve the problem.
- The point of solving this problem with sliding window is that shirinking the window(st++) now might lose the chance of having more subarrays when we extending the window(en++).
- So, not to lose the possible answers, it's necessary to handle this point wisely.
- Please be aware of this point when you read below approaches.

## Approach 1 : Prefix Sum
- We iterate the given array.
- Meanwhile, we stack the current sum to a map.
- If the current sum is equal to goal, adds one to the answer.
- If the current sum is greater than the goal, adds the count of (sum - goal) value from the map.
- What it means is that we stack prefix sum on a map.
- When we have sums which are greater than the given goal, we can get how many subarrays(sum is equal to the goal) we have between current position and the previous ones by utilizing a map.
- It's interesting we don't have to consider zeros with this approach.

## Approach 2 : Sliding Window
- As I said eariler, the problem of using sliding window is that the shirinking might affect the answer.
- By changing the way of using sliding window slightly, we can solve the problem.
- We find all the subarrays that their sum is at most 'goal', and 'goal - 1'.
- Then we get the answer by substracting them.
- Because we have to count all the subarrays that their sum is at most 'goal', we add the length of the window when we find the sum of the window is equal to the goal.
    - It means we count every subarray that ends at the right side of the current window.
    - Because we don't want to lose count by only shrinking the window, so we basically count them all not to miss anything.
- Haven't seen this approach before, it would be great to remember this and use to other problems too.

## Approach 3 : Sliding Window in One Pass
- Not to miss the leading zeros by shriking the window, we can simply count prefix Zeros.
- When the sum is equal to goal we add this prefix Zeros to the answer.
- But it seems that it only care about the previous zeros not the shrinking zeros.
- Actually it does care about both.
- Because we shrink the window when the left value of the window is '0' too.
    - We usually shrink the size when sum is greater than goal.
- In a nutshell, 
    - We extend the window when sum is less than goal.
    - We shrink the window while the left value of the window is zero.
    - So it feels like compressed version of sliding window, because we shrink the window whenever it's possible.


# Big O (Time, Space)

## Approach 1 : Prefix Sum
- Time
    - O(N)
- Space
    - O(N)

## Approach 2 : Sliding Window
- Time
    - O(N)
- Space
    - O(1)

## Approach 3 : Sliding Window in One Pass
- Time
    - O(N)
- Space
    - O(1)

# Code

## Approach 1 : Prefix Sum

```cpp
class Solution {
public:
    int numSubarraysWithSum(vector<int>& nums, int goal) {
        int n = nums.size();

        unordered_map<int,int> mp;
        int sum = 0, ans = 0;
        for (int i = 0; i < n; i++) {
            sum += nums[i];
            if (sum == goal) {
                ans++;
            } 
            if (sum >= goal && mp.find(sum - goal) != mp.end())
                ans += mp[sum - goal];

            mp[sum]++;
        }
        return ans;
    }
};
```

## Approach 2 : Sliding Window

```cpp
class Solution {
public:
    int numSubarraysWithSum(vector<int>& nums, int goal) {
        return findAtMostSum(nums, goal) - findAtMostSum(nums, goal - 1);
    }
    int findAtMostSum(vector<int>& nums, int goal) {
        int sum = 0, cnt = 0, le = 0;
        for (int ri = 0; ri < nums.size(); ri++) {
            sum += nums[ri];
            while (le <= ri && sum > goal) {
                sum -= nums[le++];
            }
            
            cnt += (ri - le + 1);
        }
        return cnt;
    }
};
```

## Approach 3 : Sliding WIndow in One Pass

```cpp
class Solution {
public:
    int numSubarraysWithSum(vector<int>& nums, int goal) {
        int le = 0, sum = 0, ans = 0, prefixZeros = 0;
        for (int ri = 0; ri < nums.size(); ri++) {
            sum += nums[ri];

            while (le < ri && (nums[le] == 0 || sum > goal)) {
                if (nums[le] == 1) 
                    prefixZeros = 0;
                else 
                    prefixZeros += 1;
                sum -= nums[le++];
            }

            if (sum == goal) {
                ans += 1 + prefixZeros;
            }
        }
        return ans;
    }
};
```