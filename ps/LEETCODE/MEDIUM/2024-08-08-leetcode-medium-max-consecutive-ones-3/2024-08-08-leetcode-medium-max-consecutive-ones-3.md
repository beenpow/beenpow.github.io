---
layout: post
title : "Leetcode::problem(1004) Max Consecutive Ones 3"
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
date: "2024-08-08"
---

# Leetcode::Max Consecutive Ones 3
- [Link : Leetcode::Max Consecutive Ones 3](https://leetcode.com/problems/max-consecutive-ones-iii/description/)

- level : medium
- Failed to come up with the idea
- But solved in 10mins after checking 'topic' hint.

# point
- Given a binary array nums and integer k, return the maximum number of 1's in the array if you can flip at most k 0's.

# Design
- We know that there are only two options for this problem.
 - First, dp. But it's not possible to use dp for such length (1e5).
   - And it's a waste of time complexity to calculate all the possible combiation of random indices.
	 - Because we only need a connected 1's in a row, not randomly changed 1's.
 - Second, sliding window.
   - This is the one that we can solve this problem in O(N) time.
	 - Becuase the window is a connected string, it fits with the form what we are looking for.
- Once we notice this is sliding window problem, it's not hard to solve the problem.
- To use sliding window method, it's necessary to determine when we change the range.
- Let's say we have a window, leftmost is 'left' and rightmost is 'right'.
- Now we need to decide when we shift 'left' and 'right'.
- We move 'right' on every iteration, since we have to go through from index 0 to n-1
- While iteration, we need to handle 'k' carefully, since it's the limited times we can use magic (flip).
- Once we hit 'k' flips, it matains as 'k' and we need to shift 'left' position to next '0' position to afford one more of magic.
- While doing this process, we check the length between 'right' and 'left'.


# Big O(time)
- TIME : O(N)

# Code

```cpp
class Solution {
public:
// [1,1,1,0,0,0,1,1,1,1,0]
// [1,1,1,0,0,1,1,1,1,1,1]
    int longestOnes(vector<int>& nums, int k) {
        // sliding window
        int ans = 0;
        int usedK = 0, left = 0;
        for(int right = 0; right < nums.size(); right++){
            if (nums[right] == 0) {
                if (usedK == k) {
                    while(left < nums.size() && nums[left] == 1) left++;
                    left++;
                } else {
                    usedK++;
                }
            }
            ans = max(ans, right - left + 1);
        }
        return ans;
    }
};
```
