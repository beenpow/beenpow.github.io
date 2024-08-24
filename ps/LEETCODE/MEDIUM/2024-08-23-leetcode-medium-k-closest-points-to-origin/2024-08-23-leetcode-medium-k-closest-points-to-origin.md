---
layout: post
title : "Leetcode::problem(973) K Closest points to origin"
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
date: "2024-08-24"
---

# Leetcode::K Closest Points to origin
- [Link : Leetcode::K Closest Points to origin](https://leetcode.com/problems/k-closest-points-to-origin/)

- level : medium
- took 15 mins to solve with pq.
- Necessary to understand the edit's quickSelction method.

# point
- Given an array of points where points[i] = (x[i], y[i]) represents a point of the X-Y plane and an integer k
- Return the k closest points to the origin (0,0)

# Design
- It's always great to compare each algorithm to solve the problem wisely.
- Because every algorithm has pros and cons, we always try to weight what matters most on the given problem.

## using priority queue
- For problems like, 'Choosing top/bottom k elements' we can mostly use priority_queue.
- It's sipmle method.
- Just maintain top 'k' elements on the pq.

## using quick selection
- I was not able to come up with this solution.
- Because I only thought about quick sort, which will take O(NlogN) and needs extra work to manage calculated euclidian used in sort.
- But now I understand that 'quick selection' can definitely optimize certain part on average time complexity.
- Here's how it works.
- Basically, quick selection works pretty much similar to quick sort.
- Just brief recap for quick sort
  - How it works.
	  - On the given range, we select a 'pivot'.
		- Then we make the given range is partitioned to two sections.
		  - The left partition only includes memebrs where their values are less than pivot element.
			- The right partition only includes members where their values are greater than pivot element.
	  - We can achiever this by comparing every element on the given range with a pivot.
		- Then we use this method as recursion.
		- Since we partitioned into two sections, each partition calls another recursion, and so on.
  - It takes O(NlogN) time.
	  - The depth of algorithm is O(logN)
			 - Roughly we use mid position.
	  - On each level of depth, there are 'n' elements total, which yileds to be O(N)
		  - Each partition's length can vary, but the total length is always 'n' for the all partitions on the same level.
- Now we back to quick selection.
  - The only thing we need to tackle a bit is 'recursion on the partitioned two sections' from above 'quick sort' algorithm.
	- Since we only focus on the top 'k' elements, it's not necessary to sort other elements.
	- For example, let's say we have two partitions and left side has 7 elements and right side has 5 elements, and k is 9.
	- We don't need to sort left side 7 elements, what matters is that those are top 7 elements among 9.
	- Now we only focus on the right side which include 5 elements and we find top '2' elements here, and so on.
  - In worst case, it can take O(N^2) same as quick sort, but it's not likely to happen mostly.
	  - For example, if we choose a pivot element as the largest of smallest number from the given range.

# Big O(time)
- using PQ
  - TIME : O(NlogN)
	- SPACE : O(K)

- using Quick Selection
  - TIME : O(N) <-- O(N + N/2 + N/4 + ... + N/N) = O(2N)
  - SPACE : O(1)

# Code

## Using PQ

```cpp
class Solution {
public:
    vector<vector<int>> kClosest(vector<vector<int>>& points, int k) {
       priority_queue<pair<int,int>>pq;
       for (int i = 0; i < points.size(); i++) {
            int dist = (points[i][0] * points[i][0]) + (points[i][1] * points[i][1]);
            pq.push({dist, i});
            if (pq.size() > k) pq.pop();
       }
       vector<vector<int>> ans;
       while(!pq.empty()) {
        ans.push_back({points[pq.top().second]});
        pq.pop();
       }
       return ans;
    }
};
```

## Using Quick Selection

```cpp
class Solution {
public:
    vector<vector<int>> kClosest(vector<vector<int>>& points, int k) {
        return quickSelect(points, k);
    }
private:
    vector<vector<int>> quickSelect(vector<vector<int>>& points, int k) {
        int left = 0, right = points.size() - 1;
        int pivotIndex = points.size();
        while(pivotIndex != k) {
            pivotIndex = getPivot(points, left, right);
            if (pivotIndex < k) left = pivotIndex;
            else right = pivotIndex -1;
        }
        return vector<vector<int>> (points.begin(), points.begin() + k);
    }
    int getPivot(vector<vector<int>>& points, int left, int right) {
        int pivotDist = getSquaredDistance(points[(left + right) / 2]);
        while(left <= right) {
            while(getSquaredDistance(points[left])  < pivotDist) left++;
            while(getSquaredDistance(points[right]) > pivotDist) right--;
            if (left <= right) swap(points[left++], points[right--]);
        }
        if (getSquaredDistance(points[left]) < pivotDist) left +=1;
        return left;
    }
    int getSquaredDistance(vector<int>& point) {
        return point[0] * point[0] + point[1] * point[1];
    }
};
```
