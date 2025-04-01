---
layout: post
title : "Leetcode::problem perfect number"
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
date: "2025-04-01"
---

# Leetcode::perfect number
- [Link : Leetcode:perfect number](https://leetcode.com/problems/perfect-number/description/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, 1 2 2 0 0
- level : easy

# point
- A perfect number is a positive integer that is equal to the sum of its positive divisors, excluding the number itself.
- A divisor of an integer x is an integer that can divide x evenly.
- Given an integer n, return true if n is a perfect number.

# Design
- Basically we calculate all the positive divisors.
- To achieve that there is a fancy way to do it in O(root(N)) time.
- We iterate from 1 to root(N), then see if this number is a devisor.
- If it is, we can also check if (num/this number) is a devisor.
- Since (this number) * (num / this number) = num.

# Big O(time)
- TIME : O(root(N))
- SPACE : O(1)

# Code

```cpp
class Solution {
public:
    bool checkPerfectNumber(int num) {
        int sum = 0;
        for(int i = 1; i * i < num; i++) {
            if (num % i == 0) {
                sum += i;
                if (num % (num/i)  == 0) {
                    if (num/i != num) sum += num/i;
                }
            }
        }
        return sum == num;
    }
};
```