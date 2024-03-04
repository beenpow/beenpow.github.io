---
layout: post
title : "Leetcode::problem(681) Next Closest Time"
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
date: "2024-02-28"
---

# Leetcode::Next Closest Time
- [Link : Leetcode::Next Closest Time](https://leetcode.com/problems/next-closest-time/)

- level : medium
- 38mins to solve

# point
- Given a time represented in the format "HH:MM", form the next closest time by reusing the current digits.

# Design
- To solve this problem perfectly, it's ncessary to come up with an idea that the closest time can be the next day from the given time.
- Now we know that the closest time can be the next day, it's possible to get the answer for day 1 and day 2.
  - Let's say day 1 is the day that the given time is.
- For the closest time on day 1,
	- We need to find a time which is bigger than the time and also, has smallest gap with the time.
- For the closest time on day 2,
	- We need to find a earliest time which is smallest time
- If we couldn't find any closest time on day 1, we use earliest time from day 2.
- While using above logic, getting the possible time is necessary process.
  - To get possible times, we can use all the digits we have from the given time and make a combination.


# Big O(time)
- O(4^4)

# Code

```cpp
// 38mins

class Solution {
public:
    bool isValidTime(string time) {
        // checking minutes section
        if (time[3] >= '6') return false;

        // checking hours section
        if (time[0] <= '1') {
            ;
        }  else if (time[0] >= '3') {
            return false;
        } else { // time[0] == 2
            if (time[1] < '4') {
                ;
            } else if (time[1] == '4') {
                if ((time[3] - '0') == 0 && (time[4] - '0' == 0)) return true;
                else return false;
            } else return false;
        }
        return true;
    }
    int timeToMinutes(string time) {
        int ret = (time[0] - '0') * 10 * 60 +
                  (time[1] - '0') *  1 * 60 +
                  (time[3] - '0') * 10 *  1 +
                  (time[4] - '0') *  1 *  1;
        return ret;
    }
    string nextClosestTime(string time) {
        
        // 1. time to absolute value of minutes
        int curMin = timeToMinutes(time);
        int gapForDay1 = 9999, earliestTimeForDay2 = 9999;
        string day1 = "", day2 = "";

        // 2. check digits
        map<char, int> mp;
        mp[time[0]]++; mp[time[1]]++; mp[time[3]]++; mp[time[4]]++;

        // 3. iterate all of digits
        for(auto it1 = mp.begin(); it1 != mp.end(); it1++) {
            char a = it1->first;
            for(auto it2 = mp.begin(); it2 != mp.end(); it2++) {
                char b = it2->first;
                for(auto it3 = mp.begin(); it3 != mp.end(); it3++) {
                    char c = it3->first;
                    for(auto it4 = mp.begin(); it4 != mp.end(); it4++) {
                        char d = it4->first;
                        string _time = to_string(a - '0') + to_string(b- '0') + ":" + to_string(c- '0') + to_string(d- '0');
                        if (isValidTime(_time) == false) continue;
                        int mins = timeToMinutes(_time);
                        if (mins > curMin && gapForDay1 > (mins - curMin)) {
                            gapForDay1 = (mins - curMin);
                            day1 = _time;
                        }
                        if (mins <= curMin && earliestTimeForDay2 > mins) {
                            earliestTimeForDay2 = mins;
                            day2 = _time;
                        }
                    }
                }
            }
        }
        return day1 == "" ? day2 : day1;
    }
};
```
