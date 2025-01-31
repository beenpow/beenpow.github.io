---
layout: post
title : "Leetcode::problem(939) Minimum Area Rectangle"
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
date: "2025-01-31"
---

# Leetcode::Minimum Area Rectangle
- [Link : Leetcode::Minimum Area Rectangle](https://leetcode.com/problems/minimum-area-rectangle/description/?envType=company&envId=google&favoriteSlug=google-thirty-days)

- level : medium
	 - algorithm : 20m
	 - code : 20m

# point
- You are given an array of points in the X-Y plane points where points[i] = [x_i, y_i].
- Return the minimum area of a rectangle formed from these points, with sides parallel to the X and Y axes.
- If there is not any such rectangle, return 0.

# Design
- It's solvable with map and straight way of drawing rectangle.
- Let's say there are four points on the rectangle,
	- p2	p4
	- p1	p3
- If we create three maps for p2, p3, and p4, we can make this work.
- Specifically, we iterate all the points with p1.
	- Which is O(N)
- Then we search all the points on the same x with p1 which is p2
	- By mapping points with same x, we can iterate p2 by O(A)
- Then we search all the points on the same y with p1 which is p3
  - By mapping points with same y, we can iterate p3 by O(B)
- Now we have point p4 as fixed by p2 and p3
  - We get this p4 with O(1)


# Big O(time)
- TIME
	- O(N) x O(A) x O(B) x O(1)
	  - Where, A + B <= N
- SPACE
	- O(N)

# Code

```cpp
#define fi first
#define se second

class Solution {
public:
    int minAreaRect(vector<vector<int>>& points) {
        map<int, vector<int> > mpx;
        map<int, vector<int> > mpy;
        map<pair<int,int>, int> mpxy;

        for(int i = 0; i < points.size(); i++) {
            int x = points[i][0];
            int y = points[i][1];

            mpxy[{x, y}] = i;

            if (mpx.find(x) == mpx.end()) {
                vector<int> tmp;
                tmp.push_back(y);
                mpx[x] = tmp;
            } else {
                mpx[x].push_back(y);
            }

            if (mpy.find(y) == mpy.end()) {
                vector<int> tmp;
                tmp.push_back(x);
                mpy[y] = tmp;
            } else {
                mpy[y].push_back(x);
            }
        }
/*
        p2y

        p1(x, y)    p3x
*/
        long long int sls = 16 * 100000000;
        for (int i = 0; i < points.size(); i++) {
            pair<int,int> p1 = {points[i][0], points[i][1]};
            for (auto p2y : mpx[p1.fi]) {
                if (p2y <= p1.se) continue;
                for (auto p3x : mpy[p1.se]) {
                    if (p3x <= p1.fi) continue;
                    if (mpxy.find({p3x, p2y}) == mpxy.end()) continue;
                    long long int sum = (p3x - p1.fi) * (p2y - p1.se);
                    sls = min(sls, sum);
                }
            }
        }
        if (sls == 16 * 100000000) return 0;
        return (int) sls;
    }
};
```
