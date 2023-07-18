---
layout: post
title : "Leetcode::problem(1360) Number of Days Between Two Dates"
subtitle: "Leetcode ps easy"
type: "Leetcode easy"
easy: true
ps: true
leetcode: true
text: true
author: "beenpow"
post-header: true
header-img: "https://www.spotebi.com/wp-content/uploads/2019/01/one-day-day-one-workout-motivation-spotebi.jpg"
order: 1
date: "2023-07-18"
---

# Leetcode::Number of Days Between Two Dates
- [Link : Leetcode::Number of Days Between Two Dates](https://leetcode.com/problems/number-of-days-between-two-dates/description/)

- level : easy

# point
- Write a program to count the number of days between two dates

# Design
- These are two things that we need to keep in mind
  - I thought that there is one more day on every 4 years
  - But there is execptional year, when the year can be devided by 100 and can't be devided by 400 -> This year is not the leap year

# Big O(time)
- O(1)

# Code

```cpp
class Solution {
public:
    struct TIME{
            int year;
            int month;
            int day;
            int tot;
    } date[2];
    const int mDays[12] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

    // 2024 leap year
    int daysBetweenDates(string date1, string date2) {
        date[0].year = (date1[0]-'0') * 1000 + (date1[1]-'0') * 100 + (date1[2]-'0') * 10 + (date1[3] - '0');
        date[1].year = (date2[0]-'0') * 1000 + (date2[1]-'0') * 100 + (date2[2]-'0') * 10 + (date2[3] - '0');

        date[0].month = (date1[5] - '0') * 10 + (date1[6] - '0');
        date[1].month = (date2[5] - '0') * 10 + (date2[6] - '0');

        date[0].day = (date1[8] - '0') * 10 + (date1[9] - '0');
        date[1].day = (date2[8] - '0') * 10 + (date2[9] - '0');

        date[0].tot = (date[0].year - 1900) * 365;// + (date[0].year - 1900) / 4;
        for(int i = 1900; i <= date[0].year; i += 4){
            if (i % 4 == 0) {
                if (i % 100 == 0 && i % 400 != 0);
                else {
                    if (i == date[0].year) {
                        if (date[0].month >= 3) date[0].tot++;
                    } else  date[0].tot++;
                }
            }
        }
        
        date[1].tot = (date[1].year - 1900) * 365;// + (date[1].year - 1900) / 4;
        for(int i = 1900; i <= date[1].year; i += 4){
            if (i % 4 == 0) {
                if (i % 100 == 0 && i % 400 != 0);
                else {
                    if (i == date[1].year) {
                        if (date[1].month >= 3) date[1].tot++;
                    } else  date[1].tot++;
                }
            }
        }
        
        for(int i = 0;i + 1 < date[0].month; i++) date[0].tot += mDays[i];
        for(int i = 0;i + 1 < date[1].month; i++) date[1].tot += mDays[i];

        date[0].tot += date[0].day;
        date[1].tot += date[1].day;
        return abs(date[0].tot - date[1].tot);
    }
};
```
