---
layout: post
title : "Leetcode::problem 24 game"
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
date: "2026-01-06"
---

# Leetcode::24 game
- [Link : Leetcode:24 game](https://leetcode.com/problems/24-game)
- Solved, 10 30 20 20 35
- level : hard

# Problem Description
- You are given an integer array cards of length 4.
- You have four cards, each containing a number in the range (1, 9).
- You should arrange the numbers on these cards in a mathematical expression using the operators (+, -, *, /) and the parentheses to get the value 24.
- Return true if you can get such expression that evaluates to 24, and false otherwise.

# How to solve
- The first thing we need to figure out is that it's necessary to consider all the combinations of the given cars and the operators.
- Then the time complexity goes already to O(4! * 4^3).
- Now, let's think about how many cases there can be with the given cards and operators.
- There are only 5 cases to consider.
    - Let me use 'v' for a operator.
    - 1) (x1 v x2) v (x3 v x4)
    - 2) (x1 v x2) v x3 v x4
    - 3) x1 v (x2 v x3) v x4
    - 4) x1 v ((x2 v x3) v x4)
    - 5) x1 v (x2 v (x3 v x4))
- Now we think about the constraint for the division.
    - The division operator / represents real division, not integer division.
- There are two ways to handle this real division issue.
    - One is, using double number and just do naive calculation, then in the and we check if the result is under 1e6 range from 24. ( 24 - 1e6 < x  < 24 + 1e6).
        - But we never know 1e6 can cover all the cases.
    - Second is, we seperate a number into denominator and numerator.
        - With this approach we don't need to consider the real division, because division becomes multiplication.
- I used the second approach which is more correct and have secured answer.

# Big O (Time, Space)
- TIME : O(4! * 4^3)
- SPACE : O(1)

# Code

```cpp
class Solution {
public:
    // operations[4] = {0(+), 1(-), 2(*), 3(/)}
    pair<int,int> ops(pair<int,int> a, pair<int,int> b, int op) {
        pair<int,int> ret = {0, 0};
        if (op == 0) { // +
            if(a.second == b.second) ret.first = a.first + b.first, ret.second = a.second;
            else {
                int newSecond = a.second * b.second;
                ret.first = a.first * b.second + b.first * a.second;
                ret.second = newSecond;
            }
        }
        else if (op == 1) { // -
            if(a.second == b.second) ret.first = a.first - b.first, ret.second = a.second;
            else {
                int newSecond = a.second * b.second;
                ret.first = a.first * b.second - b.first * a.second;
                ret.second = newSecond;
            }            
        }
        else if (op == 2) { // *
            ret.first = a.first * b.first;
            ret.second = a.second * b.second;
        }
        else if (op == 3) { // / -> *
            swap(b.first, b.second);
            ret.first = a.first * b.first;
            ret.second = a.second * b.second;

        }else {/*Do nothing*/}
        if (ret.second < 0) ret.first *= -1, ret.second *= -1;
        return ret;
    }
    bool judgePoint24(vector<int>& cards) {
        sort(cards.begin(), cards.end());
        do{
            for (int o1 = 0; o1 < 4; o1 ++) {
                for (int o2 = 0; o2 < 4; o2++) {
                    for (int o3 = 0; o3 < 4; o3++) {
                        // case 1. (x1 v x2) v (x3 v x4)   :  3 ops
                        {
                            pair<int,int> ret = ops(
                                                    ops({cards[0], 1}, {cards[1], 1}, o1),
                                                    ops({cards[2], 1}, {cards[3], 1}, o3), 
                                                o2);
                            if (ret.second != 0 && ret.first / ret.second == 24 && ret.first % ret.second == 0) return true;
                        }
                        // case 2. ((x1 v x2) v x3) v x4   :  3 ops
                        {
                            pair<int,int> ret = ops(
                                                    ops(
                                                        ops({cards[0], 1}, {cards[1], 1}, o1), 
                                                    {cards[2], 1}, o2), {cards[3], 1}, 
                                                o3);
                            if (ret.second != 0 && ret.first / ret.second == 24 && ret.first % ret.second == 0) return true;
                        }
                        // case 3. (x1 v (x2 v x3)) v x4   :  3 ops
                        {
                            pair<int,int> ret = ops(
                                                    ops({cards[0], 1}, 
                                                        ops({cards[1], 1}, {cards[2], 1}, o2), 
                                                    o1), 
                                                {cards[3], 1}, o3);
                            if (ret.second != 0 && ret.first / ret.second == 24 && ret.first % ret.second == 0) return true;
                        }
                        // case 4. x1 v ((x2 v x3) v x4)   :  3 ops
                        {
                            pair<int,int> ret = ops({cards[0], 1}, 
                                                    ops(
                                                        ops({cards[1], 1}, {cards[2], 1}, o2), 
                                                    {cards[3], 1}, o3), 
                                                o1);
                            if (ret.second != 0 && ret.first / ret.second == 24 && ret.first % ret.second == 0) return true;
                        }
                        // case 5. (x1 v (x2 v (x3 v x4))) :  3 ops
                        {
                            pair<int,int> ret = ops({cards[0], 1}, 
                                                    ops({cards[1], 1}, 
                                                        ops({cards[2], 1}, {cards[3], 1}, o3), 
                                                    o2), 
                                                o1);
                            if (ret.second != 0 && ret.first / ret.second == 24 && ret.first % ret.second == 0) return true;
                        }
                    }
                }
            }


        } while (next_permutation(cards.begin(), cards.end()));
        return false;
    }
};
```