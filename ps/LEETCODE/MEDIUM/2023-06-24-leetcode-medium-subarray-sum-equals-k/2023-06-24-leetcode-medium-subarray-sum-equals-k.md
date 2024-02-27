---
layout: post
title : "Leetcode::problem(560) Subarray Sum Equals K"
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
date: "2023-06-24"
---

# Leetcode::Subarray Sum Equals K
- [Link : Leetcode::Subarray Sum Equals K](https://leetcode.com/problems/subarray-sum-equals-k/description/?envType=study-plan-v2&envId=apple-spring-23-high-frequency)

- level : medium
- fail : algorithm 65

# point
- Find Subarray Sum equals K

# Design
- This problem has very good approach to subarray sum kind of problems
- I could only think about brute force way
- To get the answer, we can use 'prefix Sum'
- And the way of using prefix sum is important, because only using 'prefix sum' is typical way of solving problems.
- Here's how to use prefix sum for this problem
- We stack the prefix sum(started from first index) and frequent to the hash map
- Then we can get the answer in O(NlogN)
- The editorial make us draw a 2-dimension graph, which has x index as index and y as prefix sum.
- Let's say we are on the index 'i' and prefix Sum till 'i' is Z
- Then we need to check the difference in y value with Z is k.
  - So, we need to find if there's 'Z-k' value exist on the graph.
- We can achieve this using hash table (map).


# Big O(time)
- O(NlogN)

# Code

```cpp
// 28m : Checked hint 1
// 30m : Checked hint 2
// 35m : Checked hint 3, 4
// sum(i ~ j) = sum[0:j] - sum[0:i-1]
// 50m : Fail on Algorithm

class Solution {
public:
    int subarraySum(vector<int>& nums, int k) {
        map<int,int> freq;
        freq[0]++;
        int prefixSum = 0, cnt = 0;
        for(auto num : nums) {
            prefixSum += num;
            if (freq.find(prefixSum - k) != freq.end()) cnt += freq[prefixSum - k];
            freq[prefixSum]++;
        }
        return cnt;
    }
};
```
