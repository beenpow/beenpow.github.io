---
layout: post
title : "Leetcode::problem number of digit one"
subtitle: "Leetcode ps hard"
type: "Leetcode hard"
hard: true
ps: true
leetcode: true
text: true
author: "beenpow"
post-header: true
header-img: ""
order: 1
date: "2025-04-07"
---

# Leetcode::number of digit one
- [Link : Leetcode:number of digit one](https://leetcode.com/problems/number-of-digit-one/description/)
- Solved, 5 120 30 10 30
- level : hard

# point
- Given an integer n, count the total number of digit 1 appearing in all non-negative integers less than or equal to n.

# Design
- I've solved with 'Mathmatic way 1', here's how.
- I have found a pattern like below.

```cpp
0-9
0 (0) 1(0 + 1) 2(0) 3(0) ... 
- sum : 0x10 + 1 = 1

0-99
0(1) 1(1 + 10) 2(1) 3(1) ... 
- sum : 1x10 + 10 = 20

0-999
0(21) 1(21 + 100) 2(21) 3(21) ...
- sum = 20x10 + 100 = 300

0-9x4
0(310) 1(310 + 1000) 2(310) 3(310) ...
- sum = 300x10 + 1000 = 4000

0-9x5
0 1 2 3 ...
- sum = 4000x10 + 10000 = 50000

0-9x6
0 1 2 3 ...
- sum = 50000x10 + 100000 = 60'000'0

0-9x7
0 1 2 3 ...
- sum = 600000x10 + 1'000'000' = 70'000'00

0-9x8
0 1 2 3 ...
- sum = 70'000'00x10 + 1'000'000'0 = 80'000'000'

0-9x9
0 1 2 3 ...
- sum = 80'000'000'x10 + 1'000'000'00 = 90000'000'0

vector<int> each =   {0,  1,  20,  300,  4000,   50000, 60'000'0,  70'000'00,  80'000'000, 90'000'000'0};
vector<int> forOne = {1, 10, 100, 1000, 10000, 100'000, 1000'000, 1000'000'0, 1000'000'00, 1000'000'000};
```
- So for each number on 10^x position, I add 'each' with the number on the position.
- Then if the number on the position exceeds '1', we add forOne value too.
- Also, Editorial suggests another clever way which seems very interesting.
  - It suggests adding 1s by it's position.
  - There are positions like, one's, ten's, hundred's, ...
  - We can use a solid mathmatic equation to calculate how many 1's pop up on each position.
    - For one's position
        - (n/10) + (n%10!=0)
    - For ten's position
        - (n/100) * 10 + min(max(n%100 - 10 + 1, 0), 10)
    - For hundred's position
        - (n/1000) * 100 + min(max(n%1000 - 100 + 1, 0), 100)


# Big O(time)
- Mathmatic way
  - TIME : O(logN)
  - SPACE : O(1)

# Code
## Mathmatic way 1
```cpp
class Solution {
public:
vector<int> each =   {0,  1,  20,  300,  4000,   50000, 60'000'0,  70'000'00,  80'000'000, 90'000'000'0};
vector<int> forOne = {1, 10, 100, 1000, 10000, 100'000, 1000'000, 1000'000'0, 1000'000'00, 1000'000'000};
    int countDigitOne(int n) {
        if (n == 1000'000'000) return each.back() + 1;
        int sum = 0;

        string s = to_string(n);
        int sz = s.size();
        reverse(s.begin(), s.end());
        for(int i = 0, tenth = 1; i < sz; i++, tenth *= 10) {
            int x = s[i] - '0';
            if (x > 1) sum += forOne[i];
            if (x == 1) sum += (n % tenth) + 1;
            sum += each[i] * x;
        }
        return sum;
    }
};
```

## Mathmatic way 2

```cpp
class Solution {
public:
    int countDigitOne(int n) {
        int sum = 0;
        for (long long int i = 1; i <= n; i *= 10) {
            long long int div = i * 10;
            sum += (n / div) * i + min(max(n%div - i + 1, 0LL), i);
        }
        return sum;
    }
};
```