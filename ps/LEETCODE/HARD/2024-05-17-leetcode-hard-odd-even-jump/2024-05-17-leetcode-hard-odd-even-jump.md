---
layout: post
title : "Leetcode::problem(975) Odd Even Jump"
subtitle: "Leetcode ps hard"
type: "Leetcod hard"
hard: true
ps: true
leetcode: true
text: true
author: "beenpow"
post-header: true
header-img: ""
order: 1
date: "2024-05-17"
---

# Leetcode::Odd Even Jump
- [Link : Leetcode::Odd Even Jump](https://leetcode.com/problems/odd-even-jump/description/)

- level : medium
- Took 1hr and 27 mins
- I solved with DP
- Since MAP way is easier (Got the idead from Solution), let me introduce it

# point
- You are given an integer array arr.
- From some starting index, you can make a series of jumps.
- During odd-numbered jumps, you jump to the index j such that arr[i] <= arr[j] and arr[j] is the smallest possible
- During even-numbered jumps, you jump to the index j such that arr[i] >= arr[j] and arr[j] is the largest possible value
- Return the number of good starting indices.

# Design

## DP
- I approached with dynamic programming, because it's obvious that there are certain calculations repeated
- By using memoization for the repeated calculation we can solve the problem.
- Here's the definition of dp
  - DP(i)(0)
	  - When we get to index i as even-numberd jump
	  - True only if there is a way to the end point from index i
	  - False, otherwise
	- DP(i)(1)
	  - When we get to index i as odd-numbered jump
		- True only if there is a way to the end point from index i
		- False, otherwise
- The reason that we are able to use dp is like below
  - Let's say there's a way to get to the end point from index j, and now is time to use odd-numbered jump
	- There's a way to get to index j from i.
	- Then, index i is possible to get to the end point too.
- Now we need to figure out finding j from i.
- Since it takes O(N) with naive way which makes our solution as O(N^2).
- It's possible to make this process with O(logN) by using a map
- We are able to find j from i by iterating from n-1 to 0 with lower_bound of map


## MAP
- By using only a map, we are able to solve the problem
- Because, there's only one next point j from point i
- It means, if we know j is possible, then i is possible too.
- We already know how to find j from i. (Check #Design, ##DP)
- With a little trick, we can make is simpler
- We use lower_bound and upper_bound for odd-numbered jump and even-numbered jump
- With these functions, we get next j for odd-numberd jump and even-numbered jump easily.
- Rest of the process is quite same.


# Big O(time)
- DP : Time (ONlogN)
- MAP : Time (O(NlogN)a

# Code

## DP

```cpp
#define YetDecided -1
#define Impossible 0
#define Possible 1

#define EvenJump 0
#define OddJump 1

class Solution {
public:
    int n;
    vector<vector<int> > nxtPoint;
    vector<vector<int> > dp;

    bool isPossible(int cur, bool isEven, vector<int>& arr) {
        if (cur >= n) return Impossible;
        if (dp[cur][isEven] != YetDecided) return dp[cur][isEven];

        int nxtIdx = nxtPoint[cur][!isEven];
        if (nxtIdx == -1) 
            return dp[cur][isEven] = Impossible;
        return dp[cur][isEven] = isPossible(nxtIdx, !isEven, arr);
    }

    int oddEvenJumps(vector<int>& arr) {
        n = arr.size();
        dp = vector<vector<int> > (n+1, vector<int>(2, YetDecided));
        nxtPoint = vector<vector<int> > (n+1, vector<int>(2, -1));

        map<int, int> mp; // map[value] = {index}
        nxtPoint[n-1][OddJump] = nxtPoint[n-1][EvenJump] = -1;
        mp[arr[n-1]] = n-1;

        // Find next jump spot in O(NlogN)
        for(int i = n-2; i >= 0; i--) {
            auto it = mp.lower_bound(arr[i]);
            if (it != mp.end()) {
                nxtPoint[i][OddJump] = it->second;
            }
            mp[arr[i]] = i;
        }

        mp.clear();
        mp[-arr[n-1]] = n-1;
        
        for(int i = n-2; i >= 0; i--) {
            auto it = mp.lower_bound(-arr[i]);
            if (it != mp.end()) {
                nxtPoint[i][EvenJump] = (it->second);
            }
            mp[-arr[i]] = i;
        }

        int ans = 0;
        dp[n-1][OddJump] = dp[n-1][EvenJump] = Possible;

        for(int i = 0; i < n; i++) {
            bool ret = isPossible(i, false, arr);
            ans += ret;
        }
        return ans;
    }
};
```

## MAP

```cpp
class Solution {
public:
    int oddEvenJumps(vector<int>& arr) {
        int n = arr.size();

        map<int,int> mp;
        vector<int> higher(n, 0), lower(n, 0);

        int ret = 1;
        mp[arr[n-1]] = n-1;
        higher[n-1] = lower[n-1] = 1;

        for(int i = n-2; i >= 0; i--) {
            auto hi = mp.lower_bound(arr[i]), lo = mp.upper_bound(arr[i]);
            if (hi != mp.end()) higher[i] = lower[hi->second];
            if (lo != mp.begin()) lower[i] = higher[(--lo)->second];
            if (higher[i]) ret++;
            mp[arr[i]] = i;
        }
        return ret;
    }
};
```
