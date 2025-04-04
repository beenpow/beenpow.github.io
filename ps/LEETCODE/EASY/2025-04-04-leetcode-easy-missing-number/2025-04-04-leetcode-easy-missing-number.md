---
layout: post
title : "Leetcode::problem missing number"
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
date: "2025-04-04"
---

# Leetcode::missing number
- [Link : Leetcode:missing number](https://leetcode.com/problems/missing-number/description/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, 2 2 2 0 30
- level : easy

# point
- Given an array nums containing n distinct numbers in the range [0, n], return the only number in the range that is missing from the array.

# Design
- We are able to solve this problem simply with 'Sorting'.
- However, there are amazing other ways.
- Here are Three more ways to solve this problem, and they are faster too.
- HashSet
    - If we use unordered map or set, it enables us to find a number in O(1) time which yields the entire time complexity of using them as O(N).
- Bit Manipulation
    - Every time we check consequent numbers, we gotta come up with 'if we can use XOR operations'.
    - Since each number appears exactly once, we can use XOR.
    - bits ^= i ^ nums[i]
    - We do XOR operations with index i and nums[i].
    - In the end, the value in the bits will be the missing one.
    - Because the missing one appeared once from index i, and as a operation of XOR it remains.
- Gauss Formula
    - Gauss has Formula as 'n * (n+1) / 2' for the sum from 0 to n.
    - We utilize this fact.

# Big O(time)
- Sorting
  - TIME : O(NlogN)
  - SPACE : O(1)
- HasShet, Bit Manipulation, Gauss' Formula
  - TIME : O(N)
  - SPACE : O(1)

# Code

## Sorting

```cpp
class Solution {
public:
    int missingNumber(vector<int>& nums) {
        sort(nums.begin(), nums.end());
        for(int i = 0; i < nums.size(); i++) if (nums[i] != i) return i;
        return nums.size();
    }
};
```

## HashSet

```cpp
class Solution {
public:
    int missingNumber(vector<int>& nums) {
        unordered_map<int, int> mp;
        for(int i = 0; i < nums.size(); i++) mp[nums[i]]++;
        for(int i = 0; i < nums.size(); i++) if (mp.find(i) == mp.end()) return i;
        return nums.size();
    }
};
```


## Bit Manipulation

```cpp
class Solution {
public:
    int missingNumber(vector<int>& nums) {
        int bits = nums.size();
        for(int i = 0; i < nums.size(); i++) {
            bits ^= i ^ nums[i];
        }
        return bits;
    }
};
```

## Gauss Formula

```cpp
class Solution {
public:
    int missingNumber(vector<int>& nums) {
        int expected = (nums.size()) * (nums.size() + 1) / 2;
        for(int i = 0; i < nums.size(); i++) expected -= nums[i];
        return expected;
    }
};
```