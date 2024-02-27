---
layout: post
title : "Leetcode::problem(402) Remove K Digits"
subtitle: "Leetcode ps medium"
type: "Leetcode medium"
medium: true
ps: true
leetcode: true
text: true
author: "beenpow"
post-header: true
header-img: "https://www.spotebi.com/wp-content/uploads/2019/01/one-day-day-one-workout-motivation-spotebi.jpg"
order: 1
date: "2023-07-19"
---

# Leetcode::Remove K digits
- [Link : Leetcode::Remove K Digits](https://leetcode.com/problems/remove-k-digits/description/?envType=study-plan-v2&envId=google-spring-23-high-frequency)

- level : medium
- fail
- Tried 120min

# point
- Given string num representing a non-negative integer num and an integer k
- return the smallest possible integer after removing k digits from num

# Design
- It's easy to come up with the idead of using 'stack'.
- But it's hard to make it concrete

- This problem can be solved with stack
- While iterating num,
  - Every time when stack.top() > current, we pop_back from the stack
  - Otherwise, stack.push(current++)
    - When I was trying to solve this problem, I deleted current value on this case ( So it was wrong )
- Then we handle leftover
- After above iteration, if we have positive integer k, we delete from back of the string
  - Since all numbers are increasing order, if we delete from the middle, return value would be larger
- Then we handle '0' leading numbers

# Big O(time)
- O(N)

# Code

```cpp
class Solution {
public:
    vector<int> stk;
    string removeKdigits(string num, int k) {
        string ans = "";
        int pos = 0, n = (int) num.size();

        while(pos < n && k > 0) {
            if (stk.empty()) stk.push_back(num[pos++]);
            else {
                if (stk.back() > num[pos]) {
                    k--; stk.pop_back();
                } else {
                    stk.push_back(num[pos++]);
                }
            }
        }
        for(auto x : stk) ans += x;
        for(int i = pos; i < n; i++) ans += num[i];
        while(k > 0 && !ans.empty()) ans.pop_back(), k--;
        
        reverse(ans.begin(), ans.end());
        while(!ans.empty() && ans.back() == '0') ans.pop_back();
        reverse(ans.begin(), ans.end());

        if (ans == "") ans = "0";
        return ans;
    }
};
```
