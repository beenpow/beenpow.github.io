---
layout: post
title : "Leetcode::problem(1820) Maximum Number of Accepted Invitations"
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
date: "2024-04-18"
---

# Leetcode::Maximum Number of Accepted Invitations
- [Link : Leetcode::Maximum Number of Accepted Invitations](https://leetcode.com/problems/maximum-number-of-accepted-invitations/description/)

- level : medium

# point
- There are m boys and n girls
- A boy can invite at most one girl, a girl can accept at most on invitations
- 'grid is given,
	- grid(i)(j) == 1 means : i-th boy can invite j-th girl
  - == 0 : can not invite.
- Find the maximum number of accepted invitations

# Design
- This sort of problem is called 'Maximum bipartite matching'
- The idea of the logic is quite intuitive
- Let girl y2 accept boy x2 (when grid(x2)(y2) = 1)  -- We hvae '1' couple matched.
- Then another girl y3 came
- y3 can accept boy x2, only if y2 can be re-matched with another boy. (Assume grid(x2)(y3) = 1 too)
- Now we need to find if there's any other boy who has taste on y2
  - If there's a boy who can send invitation on y2
	  - If he is not matched. Great! Now we have '2' couple matched.
		- If he is, we do this thing again to see if he can rematched with another girl
	
- In a nutshell,
- We check every other possible matches whenever we want to extend the number of matches. (On every girl as input)

# Big O(time)
- O(NM)

# Code

```cpp
#define NOT_MATCHED -1

class Solution {
public:
    int n, m;
    vector<int> boys;
    vector<int> girls;

    bool dfs(int girlIdx, vector<bool>& girlVisited, vector<vector<int>>& grid) {
        if (girlVisited[girlIdx])
            return false;

        girlVisited[girlIdx] = true;
        for(int boyIdx = 0; boyIdx < n; boyIdx++) {
            if (grid[boyIdx][girlIdx] == false) continue;
            if (boys[boyIdx] == NOT_MATCHED || dfs(boys[boyIdx], girlVisited, grid)) {
                boys[boyIdx] = girlIdx;
                girls[girlIdx] = boyIdx;
                return true;
            }
        }
        return false;
    }

    int getMaxBipartiteMatchings(vector<vector<int>>& grid) {
        boys = vector<int>(n + 1, NOT_MATCHED);
        girls = vector<int>(m + 1, NOT_MATCHED);

        int matchedSize = 0;
        vector<bool> girlVisited(m + 1, false);
        for(int i = 0; i < m; i++) {
            if (dfs(i, girlVisited, grid))
                matchedSize++;
            
            girlVisited = vector<bool>(m + 1, false);
        }

        return matchedSize;
    }
    int maximumInvitations(vector<vector<int>>& grid) {
        n = grid.size(), m = grid[0].size();

        int ret = getMaxBipartiteMatchings(grid);
        return ret;
    }
};
```
