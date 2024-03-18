---
layout: post
title : "Leetcode::problem(365) Water and Jug Problem"
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
date: "2024-03-18"
---

# Leetcode::Water and Jug Problem
- [Link : Leetcode::Water and Jug Problem](https://leetcode.com/problems/water-and-jug-problem/description/)
- [Useful link for Bezouts identity](https://coloredrabbit.tistory.com/98)
- level : medium
- fail to solve on my own

# point
- Two jugs sized x and y are given
- Find if target amount of water can be achieved by using any number of below operations
  - Make full jug x
	- Make full jug y
	- Empty jug x
	- Empty jug y
	- Pour from jug x to jug y
	- Pour from juy y to jug x

# Design

## Bezouts identity

- [MySolution](https://leetcode.com/problems/water-and-jug-problem/solutions/4892782/easy-connection-between-gcd-and-this-problem)
- The thing is that we need to come up with GCD, Bezouts identity with this kind of problem which takes lots of time to get used to it !

## BFS
- By keeping (x, y) , we are able to find answer

# Big O(time)

# Code

## Bezouts identity

```cpp
class Solution {
public:
int _gcd(int x, int y){
    if (y == 0) return x;
    return _gcd(y, x%y);
}
    bool canMeasureWater(int x, int y, int target) {
        if (x + y < target) return false;
        return (target % _gcd(x, y)) == 0;
    }
};
```

## BFS

```cpp
class Solution {
public:
    bool canMeasureWater(int x, int y, int target) {
        set<pair<int,int> > st;
        queue<pair<int,int> > que;
        st.insert({x, y});
        que.push({x, y});
        
        while(!que.empty()) {
            set<pair<int,int> > tmp;
            int a = que.front().first, b = que.front().second;
            que.pop();

            if (a + b == target) return true;
            tmp.insert({x, b});
            tmp.insert({0, b});
            tmp.insert({a, y});
            tmp.insert({a, 0});
            tmp.insert({0, 0});
            tmp.insert({x, y});
            if (a + b <= x) tmp.insert({a + b, 0});
            else tmp.insert({x, (a+b) - x});

            if (a + b <= y) tmp.insert({0, a + b});
            else tmp.insert({(a+b) - y, y});

            for(auto cur = tmp.begin(); cur != tmp.end(); cur++) {
                if (st.find({*cur}) == st.end()) {
                    que.push({*cur});
                    st.insert(*cur);
                }
            }
            
        }
        return false;
    }
};
```
