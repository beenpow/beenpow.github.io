---
layout: post
title : "Leetcode::problem maximum points you can obtain from cards"
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
date: "2025-05-02"
---

# Leetcode::maximum points you can obtain from cards
- [Link : Leetcode:maximum points you can obtain from cards](https://leetcode.com/problems/maximum-points-you-can-obtain-from-cards/description/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, 5 5 10 0 10
- level : medium

# point
- There are several cards arranged in a row, and each card has an associated number of points.
- In one operation, you can take one card from the beginning or from the end of the row.
- Your score is the sum of points of the cards you have taken.
- You can use k operations.
- Given the integer array cardPoints and the integer k, return the maximum score you can obtain.

# Design
- When I read the problem, the idea of summation popped up in my head.
- If we create a prefix sum and a suffix sum array, we can solve the problem by utilizing them.
- Which is the first solution called 'Dynamic Programming'.
- But, do we really need to store the value when we only need naive prefix and suffix sums?
- The answer is no.
- We can add up numbers to a value not the entire vector.
- This approach yields the results to have O(1) space.


# Big O(time)
- Dynamic Programming
    - Time : O(K)
    - Space : O(N)
- Dynamic Programming + optimized
    - Time : O(K)
    - Space : O(1)

# Code

## Dynamic programming

```cpp
class Solution {
public:
    int maxScore(vector<int>& cardPoints, int k) {
        int n = cardPoints.size();
        vector<int> fSum(n+1, 0), bSum(n+1, 0);
        
        fSum[0] = cardPoints[0];
        bSum[n-1] = cardPoints[n-1];
        for (int le = 1, ri = n - 1 - 1; le < k ; le++, ri--) {
            fSum[le] = fSum[le - 1] + cardPoints[le];
            bSum[ri] = bSum[ri + 1] + cardPoints[ri];
        }

        int ans = 0;
        for(int i = 0; i < n && (k - i) >= 0; i++) {
            ans = max(ans, (i == 0? 0 : fSum[i - 1]) + bSum[n - (k - i)]);
        }
        return ans;
    }
};
```

## Dynamic programming + optimized

```cpp
class Solution {
public:
    int maxScore(vector<int>& cardPoints, int k) {
        int n = cardPoints.size();
        int i = 0, pSum = 0;
        for(;i < k; i++) pSum += cardPoints[i];
        i--;

        int ans = pSum;
        for(int cnt = 1; cnt <= k && i >= 0; cnt++) {
            pSum -= cardPoints[i--];
            pSum += cardPoints[n - cnt];
            ans = max(ans, pSum);
        }

        return ans;
    }
};
```