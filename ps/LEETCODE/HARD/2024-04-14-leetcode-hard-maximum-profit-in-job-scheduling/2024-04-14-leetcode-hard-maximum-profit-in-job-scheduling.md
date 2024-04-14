---
layout: post
title : "Leetcode::problem(1235) Maximum Profit in Job Scheduling"
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
date: "2024-04-14"
---

# Leetcode::Maximum Profit in Job Scheduling
- [Link : Leetcode::Maximum Profit in Job Scheduling](https://leetcode.com/problems/maximum-profit-in-job-scheduling/)

- level : hard
- Tried for 120 mins, but failed
- Solved by referring to Hint and Edit 

# point
- We have n jobs, where every jobs is scheduled to be done from startTime[i] to endTime[i], obtaining a profit of profit[i]
- You're given the startTime, endTime and profit arrays, return the maximum profit you can take such that there are no two jobs in the subset with overlapping time range.

# Design
- To solve this kind of problem makes me confused sometimes.
- Because, from my perspective, there are many ways to approach this problem with memoization
- But coming up with the right one is hard
- Anyway, let me give you gist of the solution
- Let's look at top-down approach
- It's very confusing what to choose between below two methods
  - One : At each index of recursive function, it iterates from next index to n -> Which is O(N) for loop
	- Second : At each index of recursive function, it chooses between 'going to next function without adding current profit' or with.
- We gotta choose Second approach, because it's simple and 'One' include 'second'.
- Also, 'Second' is enough to iterate all nodes.
- Let's define DP as below
  - DP[i] : suffix sum from i
- Now at each function, we decide between skipping current job or doing current job
  - If we skip current one (i), we call next function with index (i+1)
	- If we schedule current one(i), we call next function with 'nextIndex' ( which is found from lower bound based on i's end time ).
- If you draw the recursive function calls as tree, you'll notice that each index is called only twice
  - At first call, it calcluate DP[i]
	- At second call, since we have DP[i] stored, it returns DP[i] simply.

- Bottom - up method is quite the same

# Big O(time)
- Time : O(NlogN) for both Top-down and Bottom-up
  - sorting takes O(NlogN)
	- Top-Down
	  - Each index is called exactly twice, which takes O(2N)
		
	- Botton-Up
	  - It has O(N) for loop,
		  - Inside the loop, lower_bound takes O(logN)

- SPACE : O(N)
  - Top-DOWN
		- Uses some stacks
	- Bottm-up
		- Does not use some stacks like Top-down, which makes the algorithm faster

# Code


## Top - Down

```cpp
class Solution {
public:
    int n;
    vector<int> DP;
    vector<vector<int> > times;

    // DP[id] : suffix sum from id
    int dynamic(int id, vector<int>& startTime) {
        if (id == n) return 0;
        if (DP[id] != -1) return DP[id];

        int nxtId = lower_bound(startTime.begin(), startTime.end(), times[id][1]) - startTime.begin();
        int mx = max(times[id][2]+ dynamic(nxtId, startTime), dynamic(id+1, startTime));

        return DP[id] = mx;
    }

    int jobScheduling(vector<int>& startTime, vector<int>& endTime, vector<int>& profit) {
        n = startTime.size();
        DP = vector<int> (n + 1, -1);
        

        // It's possible to push one array into vector !
        for(int i = 0; i < n; i++) times.push_back({startTime[i], endTime[i], profit[i]});

        sort(times.begin(), times.end());

        for(int i = 0; i < n; i++) {
            startTime[i] = times[i][0];
        }
        
        return dynamic(0, startTime);
    }
};
```

## Botton - up

```cpp
class Solution {
public:
    int n;
    vector<int> DP;
    vector<vector<int> > times; // [0] : start, [1] : end, [2] : profit

    // DP[id] : suffix sum from id
    int dynamicBottomUp(vector<int>& startTime) {

        for (int i = n - 1; i >= 0; i--) {
            int curProfit = 0; // including [i]
            int nxtId = lower_bound(startTime.begin(), startTime.end(), times[i][1]) - startTime.begin();
    
            if (nxtId == n)
                curProfit = times[i][2];
            else
                curProfit = times[i][2] + DP[nxtId];
            
            // including [i] vs skipping [i]
            if (i == n-1)
                DP[i] = curProfit;
            else
                DP[i] = max(curProfit, DP[i+1]);

        }


        return DP[0];
    }

    int jobScheduling(vector<int>& startTime, vector<int>& endTime, vector<int>& profit) {
        n = startTime.size();
        DP = vector<int> (n + 1, -1);
        

        // It's possible to push one array into vector !
        for(int i = 0; i < n; i++) times.push_back({startTime[i], endTime[i], profit[i]});

        sort(times.begin(), times.end());

        for(int i = 0; i < n; i++) {
            startTime[i] = times[i][0];
        }
        
        return dynamicBottomUp(startTime);
    }
};
```
