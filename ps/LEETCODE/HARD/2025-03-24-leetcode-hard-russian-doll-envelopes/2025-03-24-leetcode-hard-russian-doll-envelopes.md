---
layout: post
title : "Leetcode::problem russian doll envelopes"
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
date: "2025-03-24"
---

# Leetcode::russian doll envelopes
- [Link : Leetcode:russian doll envelopes](https://leetcode.com/problems/russian-doll-envelopes/description/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Failed, algorithm 65
- level : hard

# point
- You are given a 2D array of integers envelopes where envelopes[i] = [w_i, h_i] represents the width and the height of an evelope.
- Return the maximum number of envelopes you can Russian doll.(i.e., put one inside the other)

# Design
- [Explanation with a drawing](https://leetcode.com/problems/russian-doll-envelopes/solutions/2071477/Best-Explanation-with-Pictures/)
- [Explanation with C++](https://leetcode.com/problems/russian-doll-envelopes/solutions/2071459/c-o-nlogn-approach-lis-explaination-with-comments/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- [LIS basic problem](https://leetcode.com/problems/longest-increasing-subsequence/)
- To solve this problem, we have to come up with the solution of 'Longest Increasing Subsequence' problem.
- Because this Russain Doll problem lies on the extension of the LIS problem.
- Please check above link for the basic LIS problem.
  - The solution to solve LIS problem is basically creating a increasing order of answer and maintain this as optimal as possible.
  - What I mean by 'optimal' is like below.
  - Let's say we have LIS array like, (1 5 9 13), then we have 8.
  - Then we put '8' in the position of '9'.
  - So the result would be (1 5 8 13), this mechanism enables us to maintain the increasing order subsequence optimal since it yields the space to the potential 'next to be added numbers'.
- Now we get back to current problem.
- The difference between current russian doll and basic LIS problem is the dimension.
- All we need to do is make this russian doll problem be like basic LIS problem.
- To achieve that, we need to sort the given envelopes wisely.
- We sort by the order of first dimension and second.
- For the first dimension, we sort them by increasing order.
- For the second dimension, we sort them by decreasing order.
- The reason why we sort the second as decreasing order is to meet the requirement which is 'put one inside the other'.
- Which means, doll has to have gap on both width and heights.
- For example, dolls are sorted in increasing order.
  - (3, 5), (6, 7), (6, 10), (7, 11), (7, 13), (8, 4)
  - If we iterate and do LIS on the second dimension, we would have (5, 7, 10, 11, 13).
  - However, 7 and 10 can not be counted simultaneously because they have same with.
- If we sort the second dimension in decreasing order.
  - (3, 5), (6, 10), (6, 7), (7, 13), (7, 11), (8, 4)
  - If we iterate and do LIS on the second dimension, we would have (5, 7, 11) in the end.
- So with a simple trick, we managed the specific requriement of this problem.

# Big O(time)
- TIME : O(NlogN)
- SPACE : O(N)

# Code

```cpp
class Solution {
public:
    static bool CMP(const vector<int> A, const vector<int>B) {
        if (A.front() == B.front()) {
            return A.back() > B.back();
        }
        return A.front() < B.front();
    }
    int maxEnvelopes(vector<vector<int>>& envelopes) {
        sort(envelopes.begin(), envelopes.end(), CMP);

        vector<int> LIS;
        for(int i = 0; i < envelopes.size(); i++) {
            int val = envelopes[i][1];
            if (i == 0) LIS.push_back(val);
            else {
                if (LIS.back() < val) {
                    LIS.push_back(val);
                } else {
                    *lower_bound(LIS.begin(), LIS.end(), val) = val;
                }
            }
        }
        return LIS.size();
    }
};
```