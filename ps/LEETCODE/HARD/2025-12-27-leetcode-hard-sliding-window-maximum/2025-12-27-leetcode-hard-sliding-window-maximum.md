---
layout: post
title : "Leetcode::problem sliding window maximum"
subtitle: "Leetcode ps hard"
type: "Leetcode hard"
hard: true
ps: true
leetcode: true
text: true
author: "beenpow"
post-header: true
header-img: ""
order: 1
date: "2025-12-27"
---

# Leetcode::sliding window maximum
- [Link : Leetcode:sliding window maximum](https://leetcode.com/problems/sliding-window-maximum/description)
- Solved, 10 20 10 0 30
- level : hard

# Problem Description
- You are given an array of integers nums, there is a sliding window of size k which is moving from the very left of the array to the very right.
- You can only see the k numbers in the window.
- Each time the sliding window moves right by one position.
- Return the max sliding window.

# How to solve
- I've solved with a map, so the time complexity of it is O(NloN).
- However, Edit suggests to use a deque.
- So I'll describe how to use a deque to solve this problem with O(N) time.
- We especially utilize monotinic deque technique which has numbers in strict descending order.
- Since this deque has number in descending order, the first element of it is the maximum number.
- When we move the window to the right side by 1, we check if there is any numbers at the back of the deque that is less than the new value.
- If the new value is greater than other numbers on the back of the deque, we pop them out.
- This mechanism maintains the deque as strictly descending order.
- Why it is okay to pop them out?
- Because they will not be used as a maximum number because there is always bigger number than them as 'new value'.
- Even if they are in the range of the window, the new value will be the greater number than them, so they are not going to be chosen.
- With this approach, we can get the max sliding window.
- One more thing to notice is that we add only index not the number to the deque, so that we can check if the front element of the deque is under the window range or not.

# Big O (Time, Space)
- TIME : O(N)
- SPACE : O(N)

# Code

```cpp
class Solution {
public:
    vector<int> maxSlidingWindow(vector<int>& nums, int k) {
        vector<int> ret;
        deque<int> dq;
        for (int i = 0; i < k; i++) {
            while (!dq.empty() && nums[dq.back()] <= nums[i]) dq.pop_back();
            dq.push_back(i);
        }
        ret.push_back(nums[dq.front()]);

        for (int i = k; i < nums.size(); i++) {
            if (dq.front() == i - k) dq.pop_front();
            while(!dq.empty() && nums[dq.back()] <= nums[i]) dq.pop_back();
            dq.push_back(i);

            ret.push_back(nums[dq.front()]);
        }


        return ret;
    }
};
```