---
layout: post
title : "Leetcode::problem count triplets that can form two arrays of equal xor"
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
date: "2025-03-25"
---

# Leetcode::count triplets that can form two arrays of equal xor
- [Link : Leetcode:count triplets that can form two arrays of equal xor](https://leetcode.com/problems/count-triplets-that-can-form-two-arrays-of-equal-xor/description/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, 2 10 3 0 95
- level : medium

# point
- Given an array of integers arr.
    - a = arr[i] ^ arr[i+1] ^ ... ^ arr[j-1]
    - b = arr[j] ^ arr[j+1] ^ ... ^ arr[k]
- Return the number of triplets(i, j and k) Where a == b.

# Design
- I've solved with a map but it take O(N^2).
  - It's simply use point x.
  - Store every range of xor results that has end point at x.
  - Store every range of xor result that has start point at x.
  - Then find the same values between those two stored map.
- Also, the editorial suggests O(N) method which seems incredible.
- We use xor operation wisely to make it easier.
- Let's break down the given problem.
- a = arr[i] ^ arr[i+1] ^ ... ^ arr[j-1]
- b = arr[j] ^ arr[j+1] ^ ... ^ arr[k]
- arr[i] ^ arr[i+1] ^ ... ^ arr[j-1] == arr[j] ^ arr[j+1] ^ ... ^ arr[k]
- Let's say XOR(x, y) for the result of xor operations from x to y. (inclusive).
- XOR(i, j-1) == XOR(j, k)
- XOR(i, j-1) ^ XOR(j, k) == 0
- What it means is that if we find same result of XOR at some points, they are the ones.
- Also, to maximizing this XOR characteristic we use 'prefix Xor'.
- prefixXor[i] = prefixXor[i-1] ^ arr[i]
- If we find prefixXor[i] == prefixXor[k] (i < k), we know that j can be anywhere between i and k.
- So we add up the count of (k - i).
- Furthermore, we utilize countMap and totalMap to get the count by above calculation wisely.
- On countMap, we increase count for prefix result.
- On totalMap, we add current index for prefix result.
- Then we calculate like,
  - cnt += countMap[prefix] * i - totalMap[prefix];
  - 


# Big O(time)
- using prefix
    - TIME : O(N)
    - SPACE : O(N)
- using map
    - TIME : O(N^2)
    - SPACE : O(N)

# Code

## using prefix
```cpp
class Solution {
public:
    int countTriplets(vector<int>& arr) {
        int n = arr.size();
        int prefix = 0;
        map<int,int> countMap, totalMap;
        countMap[0] = 1;
        int cnt = 0;
        for (int i = 0; i < n; i++) {
            prefix ^= arr[i];
            cnt += countMap[prefix] * i - totalMap[prefix];
            totalMap[prefix] += (i + 1);
            countMap[prefix]++;
        }
        return cnt;
    }
};
```
## using map

```cpp
class Solution {
public:
    int countTriplets(vector<int>& arr) {
        int ret = 0;
        int n = arr.size();
        for(int j = 1; j < n; j++) {
            map<int,int> LE, RI;
            int toLeft = 0, toRight = 0;
            int i = j - 1;
            while (i >= 0) {
                toLeft ^= arr[i];
                LE[toLeft]++;
                i--;
            }
            int k = j;
            while (k < n) {
                toRight ^= arr[k];
                RI[toRight]++;
                k++;
            }
            for (auto it = LE.begin(); it != LE.end(); it++) {
                if (RI.find(it->first) != RI.end()) {
                    ret += (it->second) * (RI[it->first]);
                }
            }
        }
        return ret;
    }
};
```