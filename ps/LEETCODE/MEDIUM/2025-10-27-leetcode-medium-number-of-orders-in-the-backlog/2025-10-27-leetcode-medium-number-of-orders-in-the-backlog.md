---
layout: post
title : "Leetcode::problem number of orders in the backlog"
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
date: "2025-10-27"
---

# Leetcode::number of orders in the backlog
- [Link : Leetcode:number of orders in the backlog](https://leetcode.com/problems/number-of-orders-in-the-backlog)
- Solved, 10 10 20 2 0
- level : medium

# Problem Description
- You are given a 2D array orders, where each orders(i) = (price, amount, orderType).
- Return the total amount of orders in the backlog after placing all the orders from the input. Since this number can be large, return it modulo 10^9 + 7.

# How to solve
- We only need two heaps.
  - One is for sell orders as min-heap.
  - One is for buy orders as max-heap.
- As we iterate through the orders, we need to check opposite orders on the heap and see if we can match them.
- The only downside of using heap is that we need to pop the top to modify the amount value and push it back.
- Which takes O(logN) each time.
- However, we need at most N times of this operation, it means the time complexity of this would be end up with O(NlogN).


# Big O (Time, Space)
- TIME : O(NlogN)
- SPACE : O(N)

# Code

```cpp
class Solution {
public:
    
    int getNumberOfBacklogOrders(vector<vector<int>>& orders) {
        priority_queue<pair<int,int>> sellHeap; // min-heap
        priority_queue<pair<int,int>> buyHeap; // max-heap

        for(auto order : orders) {
            cout << order[0] << ", " << order[1] << ", " << order[2] << endl;
            // buy
            if (order[2] == 0) {
                // while loof will run at most N times during the entire iteration.
                while(order[1] > 0 && !sellHeap.empty() && order[0] >= -sellHeap.top().first) {
                    int cnt = sellHeap.top().second;
                    if (order[1] >= cnt) {
                        order[1] -= cnt;
                        sellHeap.pop();
                    } else {
                        pair<int,int> x = sellHeap.top();
                        sellHeap.pop();
                        x.second -= order[1];
                        order[1] = 0;
                        sellHeap.push(x);
                    }
                }
                // leftover
                if (order[1] > 0) {
                    buyHeap.push({order[0], order[1]});
                }
            }
            // sell
            else {
                while(order[1] > 0 && !buyHeap.empty() && buyHeap.top().first >= order[0]) {
                    int cnt = buyHeap.top().second;
                    if (order[1] >= cnt) {
                        order[1] -= cnt;
                        buyHeap.pop();
                    } else {
                        pair<int,int> x = buyHeap.top();
                        buyHeap.pop();
                        x.second -= order[1];
                        order[1] = 0;
                        buyHeap.push(x);
                    }
                }
                // leftover
                if (order[1] > 0) {
                    sellHeap.push({-order[0], order[1]});
                }
            }
        } 
        long long MOD = 1e9 + 7;
        long long ans = 0;
        while(!sellHeap.empty()) {
            ans += sellHeap.top().second;
            ans %= MOD;
            sellHeap.pop();
        }
        while(!buyHeap.empty()) {
            ans += buyHeap.top().second;
            ans %= MOD;
            buyHeap.pop();
        }
        return ans;
    }
};
```