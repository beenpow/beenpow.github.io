---
layout: post
title : "Leetcode::problem(11) Container With Most Water"
subtitle: "Leetcode ps medium"
type: "Leetcode medium"
medium: true
ps: true
leetcode: true
text: true
author: "beenpow"
post-header: true
header-img: "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/GPB_circling_earth.jpg/300px-GPB_circling_earth.jpg"
order: 1
date: "2023-12-31"
---

# Leetcode::Container With Most Water
- [Link : Leetcode::Container With Most Water](https://leetcode.com/problems/container-with-most-water/description/)

- level : medium

# point
- An integer array height of length n is given
- There are n vertical lines drawn such that thw two endpoints of the i-th line are (i, 0) and (i, height[i])
- Find two lines that can contain the most water

# Design
- My approach was naive but it can solve the problem with O(NlogN) complexity
  - The base idea of solving this problem is noticing that one of two lines use all of it's height to contain the water
	- The one use all of it's height is obviously the smaller one between two lines
	- To solve the problem with above idea, we can use two objects
	  - One for having height and index and sorted with height
		- One is map object that has index and height
  - We iterate with vector which is ordered by height
	- When it comes to index i, all of values from i+1 to the end are the ones that has taller height than i
	- Since height of is is going to be used, we only need to find the farthest from index i which we can find easily from the map object
	- Then calculate the contained water

- Here's the idea of edit and it has O(N) complexity
  - It solves the problem with two pointers, one from the left and the other from right
	- The contained water is defined by left and right heights
	- If the height of left is smaller, left points moves to the right, and vice versa
	- To have bigger water containing, either of width or height should be bigger
	- Since the width of two pointers is getting smaller, the only way we can achieve the goal is getting bigger height
	- So it leaves the smaller point to other side

# Big O(time)
- O(NlogN)
- O(N)

# Code

## My idea

```cpp
class Solution {
public:
    int maxArea(vector<int>& height) {
        vector<pair<int,int> > v1; // {value, index}
        map<int, int> m1; // m1[index] = value
        for(int i = 0; i < height.size(); i++) {
            v1.push_back({height[i], i});
            m1[i] = height[i];
        }

        sort(v1.begin(), v1.end());

        int ret = -1;
        for(int i = 0; i < v1.size(); i++) {
            int value = v1[i].first;
            int idx = v1[i].second;
            
            // If we are pointing out the same {index, value}, it should be excluded.
            int t1 = ((m1.begin()->first  == idx) ? -1 : abs(idx - m1.begin()->first));
            int t2 = ((m1.rbegin()->first == idx) ? -1 : abs(idx - m1.rbegin()->first));
            ret = max(ret, max(t1, t2) * value);
            
            m1.erase(idx);
        }

        return ret;
    }
};

```

## Easy way, like edit

```cpp
class Solution {
public:
    int maxArea(vector<int>& height) {
        int le = 0, ri = height.size() - 1;
        int ret = 0;
        while(le < ri) {
            ret = max(ret, (ri - le) * min(height[le], height[ri]));
            if (height[le] <= height[ri]) le++;
            else ri--;
        }
        return ret;
    }
};

```
