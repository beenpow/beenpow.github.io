---
layout: post
title : "Leetcode::problem(2104) Sum of Subarray Ranges"
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
date: "2023-10-03"
---

# Leetcode::Sum of Subarray Ranges
- [Link : Leetcode::Sum of Subarray Ranges](https://leetcode.com/problems/sum-of-subarray-ranges/description/?envType=study-plan-v2&envId=google-spring-23-high-frequency)

- level : medium

# point
- Return the sum of all subarray ranges of nums
  - The range of a subarray of nums is the difference between the largest and smallet element in the subarray

# Design
- As a brute force way, we can solve like below
  - Set a left position of the subarray
	- Set a right position of the subarray
	- Find the smallest and largest numbers between them (It can be done by O(1))
	- Now we add (largest - smallest) to the answer

- As you can see, we are doing some unnecessary work on above solution
- What if we can find all the largest numbers that will be added to the answer and smallest numbers that will be added to the answer eventually ?
- If we know how many times nums[i] is used as largest or smallest from certain subarrays, we can get the answer by adding times * nums[i]
- To achieve this, we should know the range that the nums[i] can be smallest in the range
  - Let's say there's 2 more numbers on the left side of nums[i] and 3 more numbers on the right side of nums[i]
	- Then we would know nums[i] will be the smallest from 3 * 4 subarrays
	  - So, we can add -nums[i] * 3 * 4 to the answer

- To do this, we can use a stack
  - That always has increasing value order for finding min values
	  - If current value is smaller than stack's top value, we know that the stack's top value only can have range until current value
		- F.Y.I. Checking my code will make it easier to understand
	- That always has decreasing value order for finding max values

# Big O(time)
- O(N)

# Code

```cpp
typedef long long ll;
class Solution {
public:
    long long subArrayRanges(vector<int>& nums) {
        ll ret = 0;
        int sz = nums.size();
        vector<int> stk; // index

        // increase order for 'min'
        for(int ri = 0; ri < sz; ri++) {
            while(!stk.empty() && nums[stk.back()] >= nums[ri]) {
                int mi = stk.back(); stk.pop_back();
                int le = !stk.empty() ? stk.back() : -1;
                ret -= (ll) nums[mi] * (ri - mi) * (mi - le);
            }
            stk.push_back(ri);
        }
        while(!stk.empty()) {
            int mi = stk.back(); stk.pop_back();
            int le = !stk.empty() ? stk.back() : -1;
            int ri = sz;
            ret -= (ll) nums[mi] * (ri - mi) * (mi - le);
        }


        // decrease order for 'max'
        for(int ri = 0; ri < sz; ri++){ 
            while(!stk.empty() && nums[stk.back()] <= nums[ri]) {
                int mi = stk.back(); stk.pop_back();
                int le = !stk.empty() ? stk.back() : -1;
                ret += (ll) nums[mi] * (ri - mi) * (mi - le);
            }
            stk.push_back(ri);
        }
        while(!stk.empty()) {
            int mi = stk.back(); stk.pop_back();
            int le = !stk.empty() ? stk.back() : -1;
            int ri = sz;
            ret += (ll) nums[mi] * (ri - mi) * (mi - le);
        }
        return ret;
    }
};
```
