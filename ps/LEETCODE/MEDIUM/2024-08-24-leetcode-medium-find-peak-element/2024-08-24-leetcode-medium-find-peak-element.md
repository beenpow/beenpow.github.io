---
layout: post
title : "Leetcode::problem(162) Find Peak Element"
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
date: "2024-08-24"
---

# Leetcode::Find Peak Element
- [Link : Leetcode::Find Peak Element](https://leetcode.com/problems/find-peak-element/description)

- level : medium
- 40 mins to solve.
- Need to understand the difference between two similar binary search methods.

# point
- Given a 0-indexed integer array nums, find a peak element, and return its index
- You must write an algorithm that runs in O(logN) time.

# Design

- With a naive aprroach, it's possible to solve the problem in O(N) time.
  - Iterate elements, and compare with neighbors.
- Additionally we can achieve O(logN) time using binary search.
- We are noted that both left and right ends are -inf.
- Given nums are in a range between -2^31 and 2^31 -1.
- What I mean is that, there's always at least a peak.
- Let's say we check if nums[i] is a peak.
  - We caompare nums[i] with  nums[i-1] and nums[i+1].
	- If nums[i] is greater than both sides, we know this is one of the peaks.
	- What if nums[i] < nums[i+1] ?
	- Then, we don't need to focus on the range between 0 and i.
	  - Let's say this range is 'left side'.
	- Even if there can be peaks on the 'left side', we are not hundres percent sure.
	- What we sure is that there's always atleast one peak exist on the 'right side'.
	- Because we now know nums[i] can be a left side of the range and -inf. is the right side of the range.
	- Which means that there exists a peak at least.
	- We solve the problem with this approach and it is binary search.
- It can be subtle but it's necessary to understand small difference between below two ways of using binary search.
- In a process of the binary search, we should compare nums[i] with others.
  - 1. nums[i-1] < nums[i] && nums[i] > nums[i+1]
	  - With this approach, we can simply break the loop since current 'i' is answer.
		- But we compare two times which increase processing time overally.
	- 2. nums[i] < nums[i+1]
	  - With this approach, we can only narraow down the range, and not able to break the loop.
		- But the processing time decreased compared to the first approach.
		- Why is it okay to compare only between nums[i] and nums[i+1] ?
		  - Since we are going to only narrowing down and not going to find an answer right aways, we only need to cut down the range.
			- We know that there's always at least one peak on the range that either of the ends is greater than it's neighbors.


# Big O(time)
- TIME : O(logN)
  - From this problem, 'Binary Search - check one side' gets faster result.
- SPACE : O(1)

# Code

## Binary Search - Check both sides

```cpp
class Solution {
public:
    int findPeakElement(vector<int>& nums) {
        if (nums.size() == 1) return 0;
        int lo = 0, hi = nums.size() - 1;

        while(lo < hi) {
            int mid = (lo + hi) / 2;
            if (mid == 0) {
                if (nums[mid] > nums[mid+1]) return mid;
                lo = mid + 1;
            } else if (mid == nums.size() - 1) {
                if (nums[mid-1] < nums[mid]) return mid;
                hi = mid-1;
            } else {
                if (nums[mid-1] < nums[mid] && nums[mid] > nums[mid+1]) return mid;
                if (nums[mid-1] > nums[mid]) hi = mid - 1;
                else lo = mid + 1;
            }
        }
        return lo;
    }
};
```

## Binary Search - Check one side

```cpp
class Solution {
public:
    int findPeakElement(vector<int>& nums) {
        int lo = 0, hi = nums.size() - 1;

        while(lo < hi) {
            int mid = (lo + hi) / 2;
            if (nums[mid] > nums[mid+1])
                hi = mid;
            else
                lo = mid + 1;
        }
        return lo;
    }
};
```
