---
layout: post
title : "Leetcode::problem remove boxes"
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
date: "2026-01-04"
---

# Leetcode::remove boxes
- [Link : Leetcode:remove boxes](https://leetcode.com/problems/remove-boxes)
- Solved, algorithm 130
- level : hard

# Problem Description
- You are given several boxes with different colors represented by different positive numbers.
- You may experience several rounds to remove boxes until there is no box left.
- Each time you can choose some continuous boxes with the same color, remove them and get k * k points.
- Return the maximum points you can get.

# How to solve
- Point of this problem is are we able to continuous subarrays that has same color.
- Couldn't solve it by myself even with the idea of DP.
- Editorial suggests a very interesing way of using DP for this problem.
- If we fully understand it, it will be hepful in the future.
- To solve this problem with brute force,
    - We set a range starts from le ends at ri.
    - Then we get points from this subarray and delete this part from the given array.
    - Then keep it going to get the maximum points.
    - But setting the range and deleting every time takes a lot.
    - Also, we operate some similar jobs that has same results repeatedly.
- If we use memoization to remember the maximum points, we can utilize dp.
- But the point is hard to come up with a clear way of using it.
- Let's define a memoization as below:
    - memo(l, r, k)
    - The maximum points we can get from the range of (l, r)
    - When there are k same values at the back of the value of r.
    - So r and k values are same, which means k + 1 values are same.
- Let's define dp relation as below:
    - DP(l, r, k)
        - DP(l, r-1, 0) + ( K + 1 ) * ( K + 1 )
            - Because k+1 values are same, we can detach them and make points.
        - DP(l, i, k+1) + DP(i+1, r-1, 0)
            - l <= i < r and value of i and r are same.
            - Because the values on i and r are same, we seperate the given array as below:
                - (l ~ i) + (r ~ r+k)
                    - It means that we deleted a subarray of (i+1 ~ r-1) represents as below.
                    - Since boxes(i) == boxes(r), k becomes k + 1 (including i too).
                    - And the last member becomes i.
                - (i+1 ~ r-1)
                    - Because boxes(r-1) != boxes(r) k becomes 0 here.
- With this approach, we get the answer by considering all the possible continuous subarrays after deleting elements in the middle.

# Big O (Time, Space)
- TIME : O(N^4)
    - The size of memoization is N^3.
    - Each dp call takes O(N).
- SPACE : O(N^3)

# Code

```cpp
class Solution {
public:
    int n;
    int memo[101][101][101];
    int dp(int l, int r, int k, vector<int>& boxes) {
        if (l > r) return 0;
        int &res = memo[l][r][k];
        if (res != -1) return res;

        while(l > r && boxes[r-1] == boxes[r]) {
            r--;
            k++;
        }

        res = dp(l, r-1, 0, boxes) + (k+1) * (k+1);

        for (int i = l; i < r; i++) {
            if (boxes[i] == boxes[r]) {
                res = max(res, dp(l, i, k+1, boxes) + dp(i+1, r-1, 0, boxes));
            }
        }
        return res;
    }
    int removeBoxes(vector<int>& boxes) {
        n = boxes.size();
        memset(memo, -1, sizeof(memo));
        
        return dp(0, n - 1, 0, boxes);
    }
};
```