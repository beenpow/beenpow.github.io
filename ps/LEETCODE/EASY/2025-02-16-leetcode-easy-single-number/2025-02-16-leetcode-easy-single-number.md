---
layout: post
title : "Leetcode::problem single number"
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
date: "2025-02-16"
---

# Leetcode::single number
- [Link : Leetcode:single number](https://leetcode.com/problems/single-number/description/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, algorithm 60
- level : easy

# point
- Given a non-empty array of integers nums, every element appears twice except for one.
- Find that single one.
a
# Design
- Many methods can be used to solve this problem.
- However there is one important one that only takes O(N) time and O(1) space.
- Here are possible ways
  - (1) Hash Table
	  - Since unordered_map takes normally O(1) time to search, it provides a good way to sovle the problem.
	- (2) Math
	  - 2 * (a + b + c) - (a + a + b + b + c) = c
		- We use 'set' to count every number once.
		- Also we add every number.
		- Then solve it with above equation.
	- (3) XOR
		- Very interesting way.
		- If a number is counted twice, their XOR result will be 0.
		- So, we should understand that A xor B xor A xor B is 0.
		  - Even if the order of xor is not like, A xor A xor B xor B, if a number exist twice on the equation, it becomes '0'.

# Big O(time)
- (1) Hash Table
	- TIME : O(N)
	- SPACE : O(N)
- (2) Math
	- TIME : O(NlogN)
	- SPACE : O(N)
- (3) XOR
	- TIME : O(N)
	- SPACE : O(1)

# Code

## Hash Table

```cpp
class Solution {
public:
    int singleNumber(vector<int>& nums) {
        int stSum = 0;
        set<int> st; int allSum = 0;
        for(auto x : nums) {
            if (st.count(x) == 0) {
                st.insert(x);
                stSum += x;
            }
            allSum += x;
        }
        return 2 * stSum - allSum;
    }
};
```

## Math

```cpp
class Solution {
public:
    int singleNumber(vector<int>& nums) {
        int stSum = 0;
        set<int> st; int allSum = 0;
        for(auto x : nums) {
            if (st.count(x) == 0) {
                st.insert(x);
                stSum += x;
            }
            allSum += x;
        }
        return 2 * stSum - allSum;
    }
};
```

## XOR

```cpp
class Solution {
public:
    int singleNumber(vector<int>& nums) {
        int x = 0;
        for(auto cur : nums) {
            x ^= cur;
        }
        return x;
    }
};
```
