---
layout: post
title : "Leetcode::problem(2439) Minimize Maximum of Array"
subtitle: "Leetcode ps medium"
type: "Leetcode medium"
medium: true
ps: true
leetcode: true
text: true
author: "beenpow"
post-header: true
header-img: "https://www.walkinmyshoes.ie/media/4388/happiness.png"
order: 1
date: "2023-06-30"
---

# Leetcode::Minimize Maximum of Array
- [Link : Leetcode::Minimize Maximum of Array](https://leetcode.com/problems/minimize-maximum-of-array/description/?envType=study-plan-v2&envId=apple-spring-23-high-frequency)

- level : medium

# point
- Array 'nums' is given
- Find the minimum possible value of the maximum integer of nums after performing any number of operations
- Here's operations
  - nums[i]--, nums[i-1]++

# Design
- We can set the answer by using binary search
- Then we just need to check if we can achieve that target by doing operations

# Big O(time)
- O(Nlog(1e9))

# Code

```cpp
class Solution {
public:
    typedef long long ll;
    vector<ll> a;
    bool check(vector<ll> v, ll mx){
        for(int i = (int)v.size()-1; i > 0; i--){
            if(v[i] > mx){
                ll gap = v[i] - mx;
                v[i-1] += gap;
                v[i] -= gap;
            }
        }
        return v[0] <= mx;
    }
    int bs(vector<ll> nums, int le, int ri){
        
        while(le < ri){
            int mid = (le + ri) / 2;
            if(check(nums, mid)) ri = mid;
            else le = mid + 1;
        }
        return ri;
    }
    int minimizeArrayValue(vector<int>& nums) {
        for(auto x : nums) a.push_back(x);
        int ret = bs(a, 0, 1e9);
        return ret;
    }
};
```
