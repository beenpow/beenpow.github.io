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
- There are n children standing in a line.
- Each child is assigned a rating value given in the integer array ratings.
- Each child must have at least one candy.
- Children with a higher rating get more candies thatn their neighbors.
- Return the minimum number of candies you need to have to distribute the candies to the children.

# Design
- The first question we have to throw is what's the hightest candies a child can get and when is it?
  - To given the most candies to a child, there should be monotonically increasing sequence.
- Let's define uphill, downhill, flat and mountain
 - uphill : monotonically increasing
 - downhill : monotonically decreasing
 - mountain : uphill then, downhill
 - flat : ratings[i] == ratings[i+1]
- We understand that only uphill can make a child to get more candies.
- Otherwise, it's flat.
- So, simply we can check only uphill.
  - If we find uphill (ratings[i-1] < ratings[i]), we know that candies[i] = candies[i-1] + 1.
	- Then we reverse the given strings, and check the uphill again.
	- The importan thing to notice is that at the peak of the mountain we have to choose the maximum value.
	- Because the increasement from left of the mountain and right can be different.
	- For example, ( 1 2 3 4 5 3 1 )
	- In this case, candies for '5' can be either 5 or 3.
	- And we have to choose 5.
- Additionally, we can optimize SPACE if we go further.
- Let's say there is a uphill(or downhill) and it's length is n.
- Then what's the sum of candies of the indices for this uphill?
- Since it's length is n, it will be (1 2 3 4 ... n)
- The sum of this is (n)(n+1)/2.
- So if we find uphill and downhill, we can simply get the sum of candies.
- Then what about mountain?
- Since mountain has a uphill and a downhill, we have to choose the maximum value for it's peak.
- So we take the maximum value between those too in that case.
- Checkout the 'Single pass' code for the detail.
- To check the status like, if it's uphill or downhill, flat, we use the term 'slope'.
- If the slope is changed, we know that the status has been changed.
- And we calculate candies only in below cases
  - Uphill -> Flat
	- Downhill -> Flat
	- Downhill -> Uphill
	- We do not check 'Downhill -> Uphill', since it's in the middle of the mountain.
    - And we would check the mountain as 'Downhill -> Uphill'.


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
/*
 ratings =
[1, 2, 3, 4, 5, 3, 2, 1, 2, 6, 5, 4, 3, 3, 2, 1, 1, 3, 3, 3, 4, 2]

i : 8, ups : 4, downs : 3, candies : 20
i : 13, ups : 2, downs : 3, candies : 32
i : 16, ups : 0, downs : 2, candies : 38
i : 18, ups : 1, downs : 0, candies : 41
	 */
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
