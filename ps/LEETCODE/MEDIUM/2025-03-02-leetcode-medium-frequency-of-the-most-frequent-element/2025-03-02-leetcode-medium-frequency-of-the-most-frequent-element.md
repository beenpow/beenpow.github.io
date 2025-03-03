---
layout: post
title : "Leetcode::problem frequency of the most frequent element"
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
date: "2025-03-02"
---

# Leetcode::frequency of the most frequent element
- [Link : Leetcode:frequency of the most frequent element](https://leetcode.com/problems/frequency-of-the-most-frequent-element/description/?envType=company&envId=google&favoriteSlug=google-three-months)
- Solved, algorithm 90
- level : medium

# point
- The frequency of an element is the number of times it occurs in an array.
- You are given an integer array nums and an integer k.
- In one operation, you can choose an index of nums and increment the element at that index by 1.
- Return the maximum possible frequency of an element after performing at most k operations.

# Design
- The basic idea of solving this problem is this.
  - "We should not caluclate sum of indices every time."
  - We are able to achieve above target not by adding but by subtracting.
	- What I mean by that is
	  - [ 1 2 3 4 5 ]
		- Let's say we check set the target value as '4'.
		- Now we check from the left side of '4', which is '3'.
		  - The gap between those two is (4 - 3)  = 1
	  - The next gap would be (4 - 2) = 2
		- The next gap would be (4 - 1) = 3
		- Check as above sequence with the given operation k.
		- Then we move on to the value '5'.
		- Now we check the gaps again... like, (5-4), (5-3), (5-2), (5-1).
		- However, we can shorten this calculation like below way.
		- We get prefix sum first.
		- Then we get the sum of gaps like, target * len - prefix sum
		- For example, 5 * 5 - (1 + 2 + 3 + 4)
- Above way can save us lots of time complexity.
- Now we straight into ways to solve the problem.
- First of all, we can come up with 'sliding window' method.
  - We move 'right' point of the window as we iterate the nums. (nums should be sorted prior to this process).
	- We move 'left' point of the window until 'target * (right - left + 1) - prefix sum <= k' is not true.
	- Then we compare the length can be answer.
	- Only difference for 'Advanced sliding window' method is, we change 'while' loop to 'if' statement.
	- It means that if we find a maximum length as '4', we do not check the length of '3', since 3 can beat 4.
- Second, we are able to solve the problem with binary search.
  - The value as 'mid' for binary search is the length we hold for an specific index 'i'.
  - So we set the length on every index i.


# Big O(time)
- (Advanced) Sliding Window
  - TIME : O(NlogN)
	- SPACE : O(1)
- Binary Search
  - TIME : O(NlogN)
	- SPACE : O(1)

# Code

## Sliding Window

```cpp
class Solution {
public:
    int maxFrequency(vector<int>& nums, int k) {
        sort(nums.begin(), nums.end());
        int le = 0, ans = 0;
        long long int sum = 0;
        for(int ri = 0; ri < nums.size(); ri++) {
            sum += nums[ri];
            long long int target = nums[ri];
            while(target * (ri - le + 1) - sum > k) {
                sum -= nums[le];
                le++;
            }
            ans = max(ans, (ri - le + 1));
        }
        return ans;
    }
};
```

## Advanced Sliding Windows

```cpp
class Solution {
public:
    int maxFrequency(vector<int>& nums, int k) {
        sort(nums.begin(), nums.end());
        int le = 0, ans = 0;
        long long int sum = 0;
        for(int ri = 0; ri < nums.size(); ri++) {
            sum += nums[ri];
            long long int target = nums[ri];
            if (target * (ri - le + 1) - sum > k) {
                sum -= nums[le];
                le++;
            }
            ans = max(ans, (ri - le + 1));
        }
        return ans;
    }
};
```

## Binary Search


```cpp
class Solution {
public:
    vector<long long int> psum;
    // [mid, targetId]
    int bs(int targetId, vector<int>& nums, int ops) {
        int le = 0, ri = targetId;
        int minLeft = 0;
        while(le <= ri) {
            int mid = (le + ri) / 2;
            long long int count = targetId - mid + 1;
            long long int partialSum = psum[targetId] - psum[mid] + nums[mid];
            long long int totalSum = (count * nums[targetId]) - partialSum;
            if (totalSum <= ops) {
                ri = mid - 1;
                minLeft = mid;
            } else {
                le = mid + 1;
            }
        }
        return (targetId - minLeft + 1);
    }
    int maxFrequency(vector<int>& nums, int k) {
        sort(nums.begin(), nums.end());
        psum = vector<long long int>(nums.size(), 0);
        psum[0] = nums[0];
        for(int i = 1; i < nums.size(); i++) psum[i] = psum[i-1] + nums[i];

        int ans = 0;
        for(int i = 0; i < nums.size(); i++) {
            ans = max(ans, bs(i, nums, k));
        }
        return ans;
    }
};
```
