---
layout: post
title : "Leetcode::problem capacity to ship packages within d days"
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
date: "2025-02-27"
---

# Leetcode::capacity to ship packages within d days
- [Link : Leetcode:capacity to ship packages within d days](https://leetcode.com/problems/capacity-to-ship-packages-within-d-days/description/?envType=company&envId=google&favoriteSlug=google-three-months)
- Solved, 5 8 7 2 3
- level : medium

# point
- Return the least weight capacity of the ship that will result in all the packages on the conveyor belt being shipped within days.

# Design
- We can only devide into days by the order of given weights.
- I've came up with the idea of using Binary Search.
- Then I was thinking about,,, how to check the validity even if we set a target minimum capacity of a day.
- If we naively sum weights in the given order and move to the next day when the capacity is full, is there a hole?
- I mean, is it possible that not adding a weight for today's capacity when there is still room, make the result change?
- The answer is 'No', which means naively adding the given weights and move to the next day when the capacity is full is acceptable.
- Let me clarify with an example.
- Here is a weight of weights[i], [x1 x2 x3 x4 x5 ... ]
  - (try1) (x1 x2 x3) (x4 x5) 
	- (try2) (x1 x2) (x3 x4 x5)
	- Let's say the minimum weight capacity is 'k' and x1 + x2 + x3 <= k holds.
	- As you can see like above, although we skip to add x3 on day1 and add it to day2, there is no gain regarding to 'days'.
- Now we are sure that this method can be used to check the validity.

# Big O(time)
- TIME : O(Nlog(500 * N)) = O(NlogN)
- SPACE : O(1)

# Code

```cpp
class Solution {
public:
    bool Shippable(vector<int>&w, int cap, int days) {
        int sum = 0, count = 1;
        for(int i = 0; i < w.size(); i++) {
            if (w[i] > cap) return false;
            if (sum + w[i] > cap) {
                count++;
                sum = w[i];
            } else {
                sum += w[i];
            }
        }
        return count <= days;
    }
    int shipWithinDays(vector<int>& weights, int days) {
        int le = 0, ri = 500 * 5 * 10000 + 1;
        while(le <= ri) {
            int mid = (le + ri) / 2;
            if (Shippable(weights, mid, days)) {
                ri = mid - 1;
            } else {
                le = mid + 1;
            }
        }
        return le;
    }
};
```
