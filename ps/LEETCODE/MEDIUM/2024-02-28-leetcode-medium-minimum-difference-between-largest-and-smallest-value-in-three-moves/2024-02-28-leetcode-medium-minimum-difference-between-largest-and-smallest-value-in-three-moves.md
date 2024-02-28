---
layout: post
title : "Leetcode::problem(1509) Minimum Difference Between Largest and Smallest Value in Three Moves"
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
date: "2024-02-28"
---

# Leetcode::Minimum Difference Between Largest and Smallest Value in Three Moves
- [Link : Leetcode::Minimum Difference Between Largest and Smallest Value in Three Moves](https://leetcode.com/problems/minimum-difference-between-largest-and-smallest-value-in-three-moves/description/)

- level : medium
- 38mins to solve

# point
- You are given an integer array nums
- In one move, you can choose one element of nums and change it to any value
- Return the minimum difference between the largest and smallest value of nums after performing at most three moves

# Design
- The logic to solve this problem is quite simple, but getting to this idea could take a while
- First of all, if the length of the given integer array is less than or equal to 4, return 0
  - Because, we make make all the numbers same with three moves
- Second, we only use smallest four numbers and largest four numbers from the given array
  - It's about the difference between the largest and smallest after all, so we are not using the elements from the middle.
- Now we have 4 smallest and 4 largest and we are able to find the answer
- There are four combinations that can happen with 3 moves.
- We are able to choose one of below combinations
  - 0 elements from the smallest group, and 3 elements from the largest group
	  - Since there's no choosing on the smallest group, we only use the smallest one of them
		- Since three largest number are used, we use 4-th largest number from the group
		- Then get the difference betwen them
	- 1 elements from the smallest group, and 2 elements from the largest group
	- 2 elements from the smallest gorup, and 1 elements from the largest group
	- 3 elements from the smallest group, and 0 elements from the largest group
- Furthermore, while we are getting 4 smallest and largest, we can choose to use either sort function or getting the elements by ourselves which will take only O(N)
- So, if you have some time to implement I recommend to implement to get 4 each which take O(N) time.
- Otherwise, use sort function which takes O(NlogN)

# Big O(time)

# Code

```cpp
// 38mins
class Solution {
public:

    int minDifference(vector<int>& nums) {
        // 0. size <= 4
        if (nums.size() <= 4) return 0;

        // 1. find smallest four elements and largest four elements
        // _small[0] <= _small[1] <= _small[2] <= _small[3] // _large[0] <= _large[1] <= _large[2] <= _large[3]
        int _small[4] = {1000000000 + 1, 1000000000 + 1, 1000000000 + 1, 1000000000 + 1}, _large[4] = {-1000000000 - 1, -1000000000 - 1, -1000000000 - 1, -1000000000 - 1};

        // 2. sort
        for(auto x : nums) {
            {
                if (x <= _small[3]) {
                    if (x <= _small[2]) {
                        if (x <= _small[1]) {
                            if (x <= _small[0]) {
                                swap(_small[2], _small[3]);
                                swap(_small[1], _small[2]);
                                swap(_small[0], _small[1]);
                                _small[0] = x;
                            } else {
                                swap(_small[2], _small[3]);
                                swap(_small[1], _small[2]);
                                _small[1] = x;
                            }
                        }else {
                            swap(_small[2], _small[3]);
                            _small[2] = x;
                        }
                    }else {
                        _small[3] = x;
                    }
                }
            }

            {
                if (x >= _large[0]) {
                    if (x >= _large[1]) {
                        if (x >= _large[2]) {
                            if (x >= _large[3]) {
                                swap(_large[0], _large[1]);
                                swap(_large[1], _large[2]);
                                swap(_large[2], _large[3]);
                                _large[3] = x;
                            } else {
                                swap(_large[0], _large[1]);
                                swap(_large[1], _large[2]);
                                _large[2] = x;
                            }
                        }else {
                            swap(_large[0], _large[1]);
                            _large[1] = x;
                        }
                    }else {
                        _large[0] = x;
                    }
                }
            }
        }

        // 4. finding smallest gap among 4 combintations
        int ret = (_large[3] - _small[0]);

        // choose 0 from the start, choose 3 from the back
        ret = min(ret, _large[0] - _small[0]);

        // choose 1 from the start, choose 2 from the back
        ret = min(ret, _large[1] - _small[1]);

        // choose 2 from the start, choose 1 from the back
        ret = min(ret, _large[2] - _small[2]);

        // choose 3 from the start, choose 0 from the back
        ret = min(ret, _large[3] - _small[3]);

        return ret;
    }
};
// 0 1 5 10 14

```
