---
layout: post
title : "Leetcode::problem power of four"
subtitle: "Leetcode ps easy"
type: "Leetcode easy"
easy: true
ps: true
leetcode: true
text: true
author: "beenpow"
post-header: true
header-img: ""
order: 1
date: "2025-05-16"
---

# Leetcode::power of four
- [Link : Leetcode:power of four](https://leetcode.com/problems/power-of-four/description/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, 3 3 3 0 60
- level : easy

# point
- Given an integer n, return true if it is a power of four. Otherwise, return false.
- An integer n is a power of four, if there exists an integer x such that n == 4^x.

# Design
- Brute force
    - Check if n is a power of four by dividing n by 4 until n is 1.
    - If n is not divisible by 4, return false.
    - If n is 1, return true.

- Math
    - Use logarithm to check if n is a power of four.
    - If n is a power of four, then log4(n) should be an integer.
    - In c++, we can use `fmod(log2(n), 2) == 0` to check if n is a power of four.

- Bit manipulation
    - Use bit manipulation to check if n is a power of four.
    - If n is a power of four, then n should be 0x55555555.
    - Before that, we check if n is positive and if n is a power of two.


- Bit manipulation + math
    - Use bit manipulation and logarithm to check if n is a power of four.
    - If n is a power of four, then n % 3 == 1, because we checked if n is a power of two.

# Big O
- Brute force
    - Time : O(log4(n))
    - Space : O(1)
- Math
    - Time : O(1)
    - Space : O(1)
- Bit manipulation
    - Time : O(1)
    - Space : O(1)
- Bit manipulation + math
    - Time : O(1)
    - Space : O(1)
# Code

## Brute force

```cpp
class Solution {
public:
    bool isPowerOfFour(int n) {
        if (n == 1) return true;
        if (n%2 || n < 1) return false;

        int power = 0;
        while (n > 1) {
            if (n % 4 != 0) return false;
            n = (n >> 2);
        }
        return true;
    }
};
```

## Math

```cpp
class Solution {
public:
    bool isPowerOfFour(int num) {
        return num > 0 && fmod(log2(num), 2) == 0;
    }
};
```

## Bit manipulation

```cpp
class Solution {
public:
    bool isPowerOfFour(int n) {
        return n > 0 && ((n & (n-1)) == 0) && ((n & 0xaaaaaaaa) == 0);
    }
};
```

## Bit manipulation + math

```cpp
class Solution {
public:
    bool isPowerOfFour(int n) {
        return n > 0 && ((n & (n-1)) == 0) && (n % 3 == 1);
    }
};

```