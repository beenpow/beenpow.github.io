---
layout: post
title : "Leetcode::problem(39) Combination Sum"
subtitle: "Leetcode ps medium"
type: "Leetcode medium"
medium: true
ps: true
leetcode: true
text: true
author: "beenpow"
post-header: true
header-img: "https://upload.wikimedia.org/wikipedia/it/5/53/Power_%28serie_tv%29.jpg"
order: 1
date: "2023-06-29"
---

# Leetcode::Combination Sum
- [Link : Leetcode::Combination Sum](https://leetcode.com/problems/combination-sum/description/?envType=study-plan-v2&envId=apple-spring-23-high-frequency)

- level : medium
- fail. took 70mins

# point
- Distinct integers 'candidates' and 'target' are given
- Find the unique combination that sum up to target

# Design
- Important thing for this problem is thinking about time complexity
- First of all, to sovle this problem we can use backtrack of n-ary tree
  - Since it has n-nodes, we have to make sure not to make same combination like the one before
  - To meet this requirement, we need to manage starting index on each node of backtrack

# Big O(time)
- under O(N^(T/M))
  - Approximately each node can call 'n' node
  - And the maximal depth of the tree is 'target / minimum number on the candidates'
    - Which is T/M
- Practically we can make largest input and get the iteration of backtrack node

# Code

```cpp
class Solution {
public:
int cnt = 0;
    int t;
    vector<int> v;
    vector<vector<int> > ans;

    void backtrack(vector<int>& stk, int id, int sum) {
        cnt++;
        if (id >= v.size()) return;
        if (sum == t) {
            ans.push_back(stk);
            return;
        }
        for(int i = id; i < v.size(); i++) {
            if (sum + v[i] > t) continue;
            stk.push_back(v[i]);
            backtrack(stk, i, sum + v[i]);
            stk.pop_back();
        }
    }
    vector<vector<int>> combinationSum(vector<int>& candidates, int target) {
        t = target;
        v = candidates;
        vector<int> empty;
        backtrack(empty, 0, 0);
        cout << cnt << '\n';
        return vector<vector<int>>();
    }
};
```
