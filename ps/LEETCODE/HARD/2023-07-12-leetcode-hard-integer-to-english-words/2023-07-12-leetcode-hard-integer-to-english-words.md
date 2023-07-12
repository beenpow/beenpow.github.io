---
layout: post
title : "Leetcode::problem(273) Integer to English Words"
subtitle: "Leetcode ps hard"
type: "Leetcod hard"
hard: true
ps: true
leetcode: true
text: true
author: "beenpow"
post-header: true
header-img: ""https://www.newtraderu.com/wp-content/uploads/2022/11/Holly_you_g_businessman_climbing_the_mountain_44c5c7df-98cd-4365-955c-cff427b9a52e.jpg
order: 1
date: "2023-07-12"
---

# Leetcode::Integer to English Words
- [Link : Leetcode::Integer to English Words](https://leetcode.com/problems/integer-to-english-words/description/?envType=study-plan-v2&envId=apple-spring-23-high-frequency)

- level : hard

# point
- Convert a non-negative integer num to its English words representation

# Design
- This problem is about implementation
- Except that, you only need to rememebr to use a function that processes 'XYZ' number (three digits)
- 1,234,567,890
- Every number between commas can be expressed by same function
  - Then you only need to put unit like, 'million', 'billion', etc.

# Big O(time)
- O(N)

# Code

```cpp
/*
Hundred 100
Thousand 1,000
Million 1,000,000
Billion 1,000,000,000


a bcd efg hij
1,234,567,890


1 ~ 9
one, two, three, ..., nine

10 ~ 99
ten, eleven, twelve, thirteen, ..., nineteen

twenty, twenty one, twenty two, ..., twenty nine,
thirty, thirty one, ..., thirty nine,
..
ninty, ninty one, ..., ninty nine


100 ~ 900
one hundred, two hunderd, three hundred, ..., nine hunderd,
------------------------------------------------------------------
1,000 ~ 99,000
one thousand, two thousand, ..., nine thousand,
ten thousand, eleven thousand, ..., nineteen thousand,
...
ninty thousand, ..., ninty nine thousand,

100,000 ~ 900,000
one hundred thousand, two hundred thousand, ..., nine hundred thousand
---------------------------------------------------------------------
1,000,000 ~ 99,000,000
one Million, two Million, ..., nine Million,
ten Million, ..., ninty Million, 
...
ninty Million, ..., ninty nine Million,

100,000,000 ~ 900,000,000
one hunderd Million, two hunderd Million, ..., nine hunderd Million,
------------------------------------------------------------------------
1,000,000,000 ~ 99,000,000,000
one Billion, two Billion, ..., nine Billion,
...
ninty Billion, ..., ninty nine Billion


=> Simply I need to know 1 ~ 999 then, put 'Million', 'Billion, 'thousand'.

*/

// 1 ~ 9
const string upto9[9] = {"One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine"};
// 10 ~ 19
const string upto19[] = {"Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen"};
const string tenth[] = {"Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"};

class Solution {
public:
    // str = str( X * 100 + Y * 10 + Z * 1 )
    string toWords(string str) {
        string ret = "";
        if(str == "0" || str == "00" || str == "000") return ret;
        
        int num = stoi(str);
        // X
        int X = num / 100;
        if (num >= 100) {
            ret += upto9[X - 1] + " Hundred ";
        }
        num %= 100;
        // Y Z
        int Y = num / 10, Z = num % 10;
        if (Y >= 2) {
            ret += tenth[Y - 2] + " ";
            if (Z != 0) ret += upto9[Z - 1] + " ";
        } else if (Y == 1){
            ret += upto19[num - 10] + " ";
        } else {
            if (Z != 0) ret += upto9[Z - 1] + " ";
        }
        return ret;
    }
    string numberToWords(int num) {
        if (num == 0) return "Zero";
        bool first = true;
        string str = to_string(num), ret = "", ans = "";
        int len = str.size(), cur = 0;
        if (len > 9) {
            // cur 부터 (len - 9)개의 캐릭터
            ret = toWords(str.substr(cur, first == true ? len - 9 : 3));
            if (ret != "")
                ans += ret + "Billion ";
            cur = (first == true ? len - 9 : cur + 3);
            first = false;
        }
        if (len > 6) {
            ret = toWords(str.substr(cur, first == true ? len - 6 : 3));
            if (ret != "")
                ans += ret + "Million ";
            cur = (first == true ? len - 6 : cur + 3);
            first = false;
        }
        if (len > 3) {
            ret = toWords(str.substr(cur, first == true ? len - 3 : 3));
            if (ret != "")
                ans += ret + "Thousand ";
            cur = (first == true ? len - 3 : cur + 3);
            first = false;
        }
        ret = toWords(str.substr(cur, len - cur));
        if (ret != "")
            ans += ret;
        
        if(ans.back() == ' ') ans.pop_back();
        return ans;
    }
};

```
