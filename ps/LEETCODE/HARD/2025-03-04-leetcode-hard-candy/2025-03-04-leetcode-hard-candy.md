---
layout: post
title : "Leetcode::problem candy"
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
date: "2025-03-04"
---

# Leetcode::candy
- [Link : Leetcode:candy](https://leetcode.com/problems/candy/description/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, 5 50 9 5 120
- level : hard

# point

# Design


# Big O(time)
- Checking uphill / Checking uphill and downhill
  - Time : O(N)
	- Space : O(N)
- Single Pass
  - Time : O(N)
	- Space : O(1)

# Code

## Checking uphill

```cpp
class Solution {
public:
    const int DEFAULT = 1;
    void checkMonotonIncreasing(int n, vector<int>& ratings, vector<int>& candies) {
        bool started = false;
        int cnt = 1;
        for(int i = 0; i < n; i++) {
            if (candies[i] == DEFAULT) {
                cnt = 1;
                started = true;
            } else {
                if (started == false) continue;
                if (ratings[i-1] < ratings[i]) {
                    candies[i] = max({candies[i-1] + 1, ++cnt, candies[i]});
                }
            }
        }
    }

    int candy(vector<int>& ratings) {
        int n = ratings.size();
        if (n == 1) return 1;
        vector<int> candies(n, 0);
        for(int i = 0; i < n; i++) {
            if (i == 0) {
                if (ratings[i] <= ratings[i+1]) candies[i] = DEFAULT;
            } else if (i == n -1) {
                if (ratings[i-1] >= ratings[i]) candies[i] = DEFAULT;
            } else {
                if (!(ratings[i] > ratings[i-1] || ratings[i] > ratings[i+1])) candies[i] = DEFAULT;
            }
        }
        checkMonotonIncreasing(n, ratings, candies);
        reverse(ratings.begin(), ratings.end());
        reverse(candies.begin(), candies.end());

        checkMonotonIncreasing(n, ratings, candies);

        int ans = 0;
        for(int i = 0; i < n; i++) {
            ans += candies[i];
        }
        return ans;
    }
};
```

## Checking uphill and downhill

```cpp
class Solution {
public:
    int candy(vector<int>& ratings) {
        int n = ratings.size();
        vector<int> candies(n, 1);
        for(int i = 1; i < n; i++) {
            if (ratings[i-1] < ratings[i]) candies[i] = candies[i-1] + 1;
        }
        for(int i = n-2; i >= 0; i--) {
            if (ratings[i] > ratings[i+1]) candies[i] = max(candies[i+1] + 1, candies[i]);
        }

        int ans = 0;
        for(auto x : candies) ans += x;
        return ans;
    }
};
```

## Single Pass Algorithm with Contant space

```cpp
class Solution {
public:
    int count(int x){return (x * (x + 1)) / 2;}
    int candy(vector<int>& ratings) {
        int candies = 0;

        int oldSlope = 0;
        int ups = 0, downs = 0;
        for(int i = 1; i < ratings.size(); i++) {
            int newSlope = (ratings[i-1] < ratings[i] ? 1 : (ratings[i-1] > ratings[i] ? -1 : 0));

            // Detect 
            // 1) up-> flat (/-)
            // 2) down ->flat (\_)
            // 3) down -> up (\/)
            // 4) up -> down(/\) ? X -> It is checked after the mountain is done.
            if ((oldSlope > 0 && newSlope == 0)
                ||(oldSlope < 0 && newSlope >= 0)) {
                candies += count(ups) + count(downs) + max(ups, downs);
                ups = downs = 0;
            }

            if (newSlope > 0) ups++;
            else if (newSlope < 0) downs++;
            else candies++;

            oldSlope = newSlope;
        }
        candies += count(ups) + count(downs) + max(ups, downs) + 1;

        return candies;
    }
};
```
