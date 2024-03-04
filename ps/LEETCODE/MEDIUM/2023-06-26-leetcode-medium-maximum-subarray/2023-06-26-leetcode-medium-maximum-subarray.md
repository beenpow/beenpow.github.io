---
layout: post
title : "Leetcode::problem(53) Maximum Subarray"
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
date: "2023-06-26"
---

# Leetcode:: Maximum Subarray
- [Link : Leetcode::Maximum Subarray](https://leetcode.com/problems/maximum-subarray/description/?envType=study-plan-v2&envId=apple-spring-23-high-frequency)

- level : medium

# point
- Find the maxium subarray with the largest sum

# Design
- Can we solve this problem with 'Windowing' ? Nope
  - Here's a counter example of why we can't use the method
  - [1 4 7 -3 2]
  - The maxium subarray will be [1 4 7 -3 2].
  - But by using 'windowing' method, the algorithm will stop summing when it meets '-3', because adding '-3' makes the sum less
- We can solve this problem by using simple but powerful strategy
  - While looing the nums,
    - We either add current x to the previous sum or take this x as a new sum
      - The meaning of adding current x to the previous sum is this x will be the continous member of the subarray
      - The meaning of taking current x as a new sum is that we don't need previous subarray anymore since x is greater than sum + x

- I've updated 'devide and conquer' way to solve the problem.
  - The time complexity for this way will be O(NlogN)
- With this way, 
  - We will get find maxium subarray for each index
    - It means, we try to get maxium subarray that must include each index
  - The left side of the index and the right side of the index
    - The left side and right side won't include 'the index', which is mid in this method

# Big O(time)
- O(N)

# Code

```cpp
class Solution {
public:
    int maxSubArray(vector<int>& nums) {
        int mxSum = -1e4 * 1e5, sum = 0;
        for(auto x : nums) {
            if (x > sum + x) sum = x;
            else sum += x;
            mxSum = max(mxSum, sum);
        }
        return mxSum;
    }
};
```

- devide and conquer

```cpp
class Solution {
public:
    vector<int> v;
    // find the maximum subarray sum in the range of [le:ri]
    int devide_and_conquer (int le, int ri) {
        if (le > ri) return -1e4 * 1e5 -1;
        int mid = (le + ri) / 2, leftBestSum = 0, rightBestSum = 0, tmpSum = 0;
        for(int i = mid - 1; i >= le; i--) {
            tmpSum += v[i];
            leftBestSum = max(leftBestSum, tmpSum);
        }
        for(int i = mid + 1, tmpSum = 0; i <= ri; i++) {
            tmpSum += v[i];
            rightBestSum = max(rightBestSum, tmpSum);
        }
        int sumIncludesMid = leftBestSum + v[mid] + rightBestSum;
        int leftMax = devide_and_conquer(le, mid - 1);
        int rightMax = devide_and_conquer(mid + 1, ri);

        return max(sumIncludesMid, max(leftMax, rightMax));
    }
    int maxSubArray(vector<int>& nums) {
        v = nums;
        int ret = devide_and_conquer(0, nums.size() - 1);
        return ret;
    }
};
```
