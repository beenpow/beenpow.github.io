---
layout: post
title : "Leetcode::problem(900) RLE Iterator"
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
date: "2024-01-08"
---

# Leetcode::RLE Iterator
- [Link : Leetcode::RLE Iterator](https://leetcode.com/problems/rle-iterator/description/)

- level : medium

# point
- Run-Length encoded array is given
- Whenever next function is called with parametor n, exhausts n numbers from the array and Return the last exhausted number 

# Design
- Naive way to solve this problem will be having a queue and put all the real numbers into it
  - For example, for a RLE array like [5 3], we know that 3 appears 5 times
	- So, we can put [5 5 5 5 5] on the queue
	- As you noticed, this will cause TLE.
- We can manage leftover count for every number
  - Let's say current position on the encode array is 'i' and it indicates that we have number 'x' and 'y' times.
	- With the given n from the function 'next', we can check if 'y' is greater than n
	- If it's greater then 'y', we manage to have y-n instead of y then return 'x'

# Big O(time)
- O(N) as total time

# Code

```cpp
class RLEIterator {
public:
    vector<int> pairs;
    int ptr = 0, sz = 0;

    RLEIterator(vector<int>& encoding) {
        pairs = encoding;
        sz = encoding.size();
    }
    
    int next(int n) {
        if (ptr == sz) return -1;


        int counted = 0, lastErased = -1;
        while(counted < n && ptr < sz) {
            int& times = pairs[ptr];
            int num = pairs[ptr+1];

            if(times == 0) ptr += 2;
            else {
                lastErased = num;
                if (counted + times >= n) {
                    times -= (n - counted);
                    return lastErased;
                    break;
                } else {
                    counted += times;
                    times = 0;
                    ptr += 2;
                }
            }
        }
        return -1;
    }
};

/**
 * Your RLEIterator object will be instantiated and called as such:
 * RLEIterator* obj = new RLEIterator(encoding);
 * int param_1 = obj->next(n);
 */
```
