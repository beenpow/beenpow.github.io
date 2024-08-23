---
layout: post
title : "Leetcode::problem(50) Pow(x, n)"
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
date: "2024-08-23"
---

# Leetcode::Pow(x, n)
- [Link : Leetcode::Pow(x, n)](https://leetcode.com/problems/powx-n/description/)

- level : medium
- took 13 mins to solve

# point
- implement pow(x, n)
- -100.0< x < 100.0
- -2^31 <= n < 2^31
- n is integer
- -10^4 <= x^n <= 10^4

# Design
- First of all, we need to figure the possible maximum of x and n.
- Fortunately, the problem provides the range of x^n
- Naively solving this problem could take some time.
- Multiplying up to 2^31 times means the time complexity can be O(1e9).
- There is a way to minimize this time to O(logN)
	- So as maximum, this method can take up to O(31).
- Because we don't need to calculate twice to get certain number, we can take this down to half.
 - For example, if we try to get 2^8, we get 2^4 then multiply by itself can get the result.
 - x = getResult(2, 4). x * x <--- curtailed the job to half.
- We approach with this method.
- But there is one thing we need to concentrate.
- To get result when n is negative, I used fraction in the end.
- If we call pow(x, -n) we get error.
- Because the given n can be down to -2^31, -n will be +2^31 which overflows the integer range.
- To solve this problem, we can use 'long' type.
- Mind that we always have to figure this out before we tackle the problem.


# Big O(time)
- TIME : O(logN)
- SPACE : O(logN)

# Code

```cpp
class Solution {
public:
    double _pow(double x, long long n) {
        if (n == 0) return 1;
        if (n == 1) return x;
        double half = myPow(x, n/2);
        return half * half * (n%2 == 0 ? 1 : x);
    }
    double myPow(double x, int n) {
        long long N = n;
        if (n >= 0) return _pow(x, N);
        else return 1/_pow(x, -N);
    }
};
```
