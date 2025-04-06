---
layout: post
title : "Leetcode::problem power of three"
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
date: "2025-04-06"
---

# Leetcode::power of three
- [Link : Leetcode:power of three](https://leetcode.com/problems/power-of-three/description/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, 5 15 10 0 30
- level : easy

# point
- Solving this problem with loop iteration is not that hard.
    - We divide the given number n with '3'.
    - If the n % 3 is greater than 0, it means it can not be divided with only 3.
    - Because we have to check if the given number is a power of three, it means n = 3 x 3 x 3 x 3 ...
    - So, if we divide it with '3', the rest of division should be either '0' or '1'.
- Plus, the Editorial suggests that another idea with 'Integer Limitation'.
    - What's the range of x for 3^x from the given range of n (-2^31 ~ 2^31 - 1) ?
    - x can be upto 19.
    - And we can pre-calculate this by iteration.
    - 3^19 = 1162261467.
    - If a given number n is power of three, it should be a divisor of 3^19.
    - Because 3 is a prime number, power of prime number should have same prime factors.
    - It mans, 3^i (i <= 19) is a divisor of 3^19.

# Design
- Loop Iteration
  - TIME : O(log3(N))
  - SPACE : O(1)
- Integer Limitations
  - TIME : O(1)
  - SPACE : O(1)


# Big O(time)

# Code
## Loop Iteration

```cpp
class Solution {
public:
    bool isPowerOfThree(int n) {
        if(n <= 0) return false;
        while(n > 1) {
            if(n % 3 > 0) return false;
            n /= 3;
        }
        return n == 1;
    }
};
```

## Integer Limitations

```cpp
class Solution {
public:
    bool isPowerOfThree(int n) {
        return n > 0 && 1162261467 % n == 0;
    }
};
```