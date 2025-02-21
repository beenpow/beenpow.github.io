---
layout: post
title : "Leetcode::problem gas station"
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
date: "2025-02-21"
---

# Leetcode::gas station
- [Link : Leetcode:gas station](https://leetcode.com/problems/gas-station/description/?envType=company&envId=google&favoriteSlug=google-three-months)
- Solved, algorithm 90
- level : medium

# point
- N gas Stations along a circular route, where the amount of gas at the i-th station is gas[i].
- It takes cost[i] to travel from i-th station to (i+1)th.
- When the car get to the station i+1, the gas tank is filled with the amount of gas[i+1].
- Given two integer arrays gas and cost, return the starting gas station's index if you can travel around the circuit once in the clockwise direction.
- Otherwise return -1.

# Design
- The problem requires very deep thoughts.
  - Fully understading why (1), (2), (3), (4), (5) are true is very important.

- Let's define gain[i] = gas[i] - cost[i], which indicates the amount of gas gain when we get to point [i].
- Also, defines totalGain = summation of gain[i], 0 <= i < n
- First of all, if totalGain is less than 0, the answer is -1, since there's no way we can iterate with all the gains.
- Now we consider where totalGain is greater than or equal to 0.
- (1) Does this mean there is an unique answer? Yes
  - If the totalGain is 0, there can be ups and downs.
	- However, it means that if we start iteration from the start point of one of 'ups', we can complete the task successfully.
- (2) How can we find the answer index?
	- There are many ups and downs.
	- (3) Is one of first indices from ups answer? Yes
	  - Let's say there is a section where gain array is [-1, 3, 5, 1, -2]
		- Then, '3' can be checked if it is the answer.
		- I mean, checking '5' and '1' is unnecessary since the problem has description like "If there exists a solution, it is guranteed to be unique".
		- In other words, if there is answer on this up which is [3, 5, 1], '3' has to be the one.
      - Even if the example is not the perfect example, I assume you would understand the point.
	- Now we know that we only need to check the first index of ups.
	  - (4) Here, 'ups' means the range that only contains plus values as gain ? Or Is it okay to have minus values as gain in the middle?
    - The answer is it's okay to have minus values in the middle.
		- But we have to make sure below two factors.
		  - Only the first index of 'ups' can be the answer.
			- 'ups' means the summation of gain for the rangs is maintained as plus value.
		- If we observe the 'summation of gain' for the rangs is less than 0, (5) do we start over of summation from current value ? Or should we go back to a certain point between current position and the previous one that just failed?
		- The answer is we surely can start from the next segment.
		- Let me clarify this.
	    - (3 2 -3 4 -7 5)
	    - We would start to sum from index 0.
			- The totalSum would be less than 0, when we get to index 4.
			- At this point, do we have to start checking from index 3 which has plus value as '4'?
			- Or is it okay to start from '5', where the failure occured just now.
			- The answer is, it's okay to start checking from index 5 which has value as 5.
			- The reason why we can skip index 3 as a start point is that the totalSum from index 3 to 4 would be less than the total sum from index 0 to 4.
			- So the logic to solve the problem becomes very simple.
			  - We add gain to Sum.
				- If the Sum  becomes less than 0, we start over from the next index.

# Big O(time)
- TIME : O(N)
- SPACE : O(1)

# Code

```cpp
class Solution {
public:
    int canCompleteCircuit(vector<int>& gas, vector<int>& cost) {
        int stIndex = 0, sz = gas.size();
        int totalSum = 0, psum = 0;
        for (int i = 0; i < sz; i++) {
            totalSum += gas[i] - cost[i];
            psum += gas[i] - cost[i];
            if (psum < 0) {
                stIndex = i + 1;
                psum = 0;
            }
        }
        return totalSum >= 0 ? stIndex : -1;
    }
};
```
