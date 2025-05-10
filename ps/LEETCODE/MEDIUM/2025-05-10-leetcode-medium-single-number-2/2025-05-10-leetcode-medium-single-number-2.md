---
layout: post
title : "Leetcode::problem single number 2"
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
date: "2025-05-10"
---

# Leetcode::single number 2
- [Link : Leetcode:single number 2](https://leetcode.com/problems/single-number-ii/description/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, 2 3 1 0 40
- level : medium

# point
- Given an integer array nums where every element appears three times except for one, which appears exactly once.
- Find the single element and return it.

# Design
- I've solved with hash map.
    - It's the simplest solution.
    - We count numbers with 'unordered_map'.
- There are amazing other ways to remember.
- First one is using 'Mathmatics'.
    - It's pretty much about bit manipulation.
    - We count each bit of every number.
    - Then use modulo 3 for the counted bits.
    - For example,
        - Let's say we have {5, 5, 5, 4}.
        - It would be {0b101, 0b101, 0b101, 0b100}.
        - For 0-bit, we have number as 3.
            - Module 3 of 3 would be 0.
        - For 2-bit, we have number as 4.
            - Module 3 of 4 would be 1 .
        - So the result will bee 0b100.
        - Which is 4.
- Second one is using 'Equation for Bitmask'.
    - We use two values.
        - ones : store values that appears once.
        - twos : store values that appears twice.
    - The logic is very simple but takes some time to understand.
        - ones = (ones ^ num) & ~twos
            - (ones ^ nums) : use XOR to store the num.
                - At this point there is no num in ones.
            - &(~twos) : If twos include this number, this number will not be stored in ones.
                - 'If twos include this number' means, that this number is appeared three times including this time.
        - twos = (twos ^ num) & ~ones
            - (twos ^ num) : use XOR to store the num.
            - &(~ones) : If this number is included in ones, it can not be stored in twos.
- Whenever you stuck at somepoint understaing bit manipulation, always try to use example. (ex : (5, 5, 5, 4))


# Big O(time)
- Hash Map
    - TIME : O(N)
    - SPACE : O(3/N) = O(N)
- Mathmatics
    - TIME : O(32 * N) = O(N)
    - SPACE : O(1)
- Equation for Bitmask
    - TIME : O(N)
    - SPACE : O(1)

# Code

## Hash Map

```cpp
class Solution {
public:
    int singleNumber(vector<int>& nums) {
        unordered_map<int,int> ump;
        for(auto x : nums) ump[x]++;
        for(auto it = ump.begin(); it != ump.end(); it++) {
            if (it->second == 1) return it->first;
        }
        return -1;
    }
};
```

## Matmatics

```cpp
class Solution {
public:
    int singleNumber(vector<int>& nums) {
        int ans = 0;
        for (int i = 0; i < 32; i++) {
            int bitSum = 0;
            for (int x : nums) {
                if ((1 << i) & x) bitSum++;
            }
            if (bitSum %3) ans |= (1 << i);
        }
        return ans;
    }
};
```

## Equation for Bitmask

```cpp
class Solution {
public:
    int singleNumber(vector<int>& nums) {
        int ones = 0, twos = 0;
        for(auto x : nums) {
            ones = (ones ^ x) & ~twos;
            twos = (twos ^ x) & ~ones;
        }
        return ones;
    }
};
```