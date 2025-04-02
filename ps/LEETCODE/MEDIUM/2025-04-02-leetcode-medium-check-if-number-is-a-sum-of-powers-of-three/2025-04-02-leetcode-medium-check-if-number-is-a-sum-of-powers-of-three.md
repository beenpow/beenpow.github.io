---
layout: post
title : "Leetcode::problem check if number is a sum of powers of three"
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
date: "2025-04-02"
---

# Leetcode::check if number is a sum of powers of three
- [Link : Leetcode:check if number is a sum of powers of three](https://leetcode.com/problems/check-if-number-is-a-sum-of-powers-of-three/description/?envType=company&envId=google&favoriteSlug=google-thirty-days)

- Solved, 2 10 5 0 5
- level : medium

# point
- Given an integer n, return true if it is possible to represent n as the sum of distinct powers of three.

# Design
- I solved with 'Optimized Iterative Approach'.
  - Let me tell you how to solve it.
  - We check the largest power of three that is less than or equal to n.
  - Then we subtract this number from n.
  - If n is still equal to or greater than this number, we return 'false'.
  - I've used the fact that there should not be any power of three multiplied with 2, like 2 * 3^x.
  - It means that we can not make with the sum of distinct powers of three.
- There is another solution suggested on the Editorial section.
- It is rather similar to my approach, but it's worth to think about it to utilize this idea for other problems.
  - We see 'n' as base 3 number.
  - So each step can be 0, 1, 2.
  - For example, 12102 means, 2 * 3^0 + 0 * 3^1 + 1 * 3^2 + 2 * 3^3 + 1 * 3^3.
  - But the thing is, there can not be a base 3 value as '2'.
  - Becuase of the same reason I explained above.

# Big O(time)
- Ternary Representation
  - TIME : O(log_3(n))
  - SPACE : O(1)
- Optimized Iterative Approach
  - TIME : O(log_3(n))
  - SPACE : O(1)

# Code
## Ternary Representation

```cpp
class Solution {
public:
    bool checkPowersOfThree(int n) {
        while (n > 0) {
            if (n % 3 == 2) return false;
            n /= 3;
        }
        return true;
    }
};
```

## Optimized Iterative Approach

```cpp
class Solution {
public:
    bool checkPowersOfThree(int n) {
        vector<int> p;
        p.push_back(1);
        while(p.back() <= 1e7) p.push_back(p.back() * 3);

        for(int i = p.size() - 1; i >= 0; i--) { 
            if (n >= p[i]) n -= p[i];
            if (n >= p[i]) return false;
        }
        return true;
    }
};
```