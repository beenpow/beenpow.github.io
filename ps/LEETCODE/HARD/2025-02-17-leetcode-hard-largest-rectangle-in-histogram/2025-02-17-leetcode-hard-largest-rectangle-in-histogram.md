---
layout: post
title : "Leetcode::problem largest rectangle in histogram"
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
date: "2025-02-17"
---

# Leetcode::largest rectangle in histogram
- [Link : Leetcode:largest rectangle in histogram](https://leetcode.com/problems/largest-rectangle-in-histogram/description/)
- Solved, est-rectangle-in-histogram algorithm 120
- level : hard

# point
- Given an array of integers heights representing the histogram's bar height where the width of each bar is 1, return the area of the largest rectangle in the histogram.

# Design
- I've conducted 5 different way of solving this problem.
- Please check further on 'Code' section if you would like to check them all.
- I assume that we know how to solve this with brute force which can be upto O(N^2).
- Approaching with 'Divide and Conquer' and 'Stack' is very important.
- 'Divide and Conquer'
  - We can divide a given range of heights into two sectors based on the minimum height on the range.
	- So, we find this minHeight value by naively iterating all the values on the range, which takes O(N).
	- After that, we call each divided sector seperately as we use the 'Divide and Conquer' method.
	- Since we divide into two sections, the depth of the tree can be from O(logN) to O(N) in worst scenario.
	- Totally, it takes O(NlogN) ~ O(N^2)
	- However, if we incorporate 'segmentTree' when we find the minHeight index which took O(N), we can easily find the value by O(logN).
		- The fact that we can use 'segmentTree' to find the minimum height index is very interesting, since we usually use this method to get the sum of the given range.
	- The tree[node] can be referred as minimum height index on the range for the node.
- 'Stack'
  - With a stack, the problem can be solved in O(N) time complexity.
	- We maintain a stack with ascending order.
	  - Before we start, we store '-1' into the stack to set the leftmost bar.
  - During iteration of the given array, if the current height is less than the stack.top(), we calculate the area with height value as stack.top().
	  - H = stack.top()
	    - It means, we find area that's height is stack.top().
		- Width is defined as (i - stk.top() - 1).
		  - It means, the width is ranged from the previous index of curren index for H to current index.
		- Now we get the area by calculating H * Width.
	- After iteration, if there are still values on the stack we calculate with pretty much similar way like above.
	- The only difference is that we define Width as (heights.size() - stk.top() - 1).
	- Because, there is no curent index as 'i', which mean the rightmost index of the area is the end of the given array.
  - In a nutshell,
	  - We maintain a stack with ascending order.
		- If anything comes that is less than the stack's top, we calculate area with the height from stack's top index.
		- The values in the stack after iteration represent their rightmost index for the area is the end of the given array.

# Big O(time)
- Bruteforce : O(N^3)
- Better Bruteforce : O(N^2)
- Divide and Conquer : O(NlogN) ~ O(N^2)
- Divide and Conquer with segTree : O(NlogN)
- Using stack : O(N)

# Code

## Brtueforce : O(N^3)

```cpp
class Solution {
public:
    // Approach 1. Bruteforce O(N^3)
    int largestRectangleArea(vector<int>& heights) {
        int sz = heights.size();
        long long int ret = 0;
        for (int st = 0; st < sz; st++) {
            for (int en = st; en < sz; en++) {
                int minH = INT_MAX;
                for (int j = st; j <= en; j++) {
                    minH = min(minH, heights[j]);
                }
                ret = max(ret, (long long int) minH * (en - st + 1));
            }
        }
        return ret;
    }
};
```

## Better Bruteforce : O(N^2)

```cpp
class Solution {
public:
    // Approach 2. Better Bruteforce O(N^2)
    int largestRectangleArea(vector<int>& heights) {
        int sz = heights.size();
        long long int ret = 0;
        for (int st = 0; st < sz; st++) {
            int minH = INT_MAX;
            for (int en = st; en < sz; en++) {
                minH = min(minH, heights[en]);
                ret = max(ret, (long long int) minH * (en - st + 1));
            }
        }
        return ret;
    }
};
```

## Divide and Conquer : O(NlogN) ~ O(N^2)

```cpp
class Solution {
public:
    // Approach 3. divide and conquer O(NlogN) ~ O(N^2)
    int divAndConq(int st, int en, vector<int>& h) {
        if (st > en) return 0;
        int minIndex = st;
        for(int i = st; i <= en; i++) {
            if (h[i] < h[minIndex]) minIndex = i;
        }
        return max({h[minIndex] * (en - st + 1),
                    divAndConq(st, minIndex - 1, h),
                    divAndConq(minIndex + 1, en, h)});
    }
    int largestRectangleArea(vector<int>& heights) {
        return divAndConq(0, heights.size() - 1, heights);
    }
};
```

## Divide and Conquer : O(NlogN)

```cpp
class Solution {
public:
#define NOT_VALID -1
    vector<int> tree; // tree[i] : minIdex on the range on i of segTree

    // Approach 4. divide and conquer with segTree O(NlogN)

    int init(int rangeLe, int rangeRi, int node, vector<int>& h) {
        if (rangeLe == rangeRi) return tree[node] = rangeLe;
        int m = (rangeLe + rangeRi) / 2;
        int leftSideMinIndex  = init(rangeLe, m, node * 2, h);
        int rightSideMinIndex = init(m+1, rangeRi, node * 2 + 1, h);
        return tree[node] = (h[leftSideMinIndex] < h[rightSideMinIndex] ? leftSideMinIndex : rightSideMinIndex);
    }
    // get minIndex on the given range
    int query(int rangeLe, int rangeRi, int node, int wantLe, int wantRi, vector<int>& h) {
        if (rangeRi < wantLe || wantRi < rangeLe) return NOT_VALID;
        if (wantLe <= rangeLe && rangeRi <= wantRi) return tree[node];

        int mid = (rangeLe + rangeRi) / 2;
        int leftSideMinIndex  = query(rangeLe, mid, node * 2, wantLe, wantRi, h);
        int rightSideMinIndex = query(mid + 1, rangeRi, node * 2 + 1, wantLe, wantRi, h);
        if (leftSideMinIndex == NOT_VALID) return rightSideMinIndex;
        if (rightSideMinIndex == NOT_VALID) return leftSideMinIndex;
        return h[leftSideMinIndex] < h[rightSideMinIndex] ? leftSideMinIndex : rightSideMinIndex;
    }

    int findMaxSum(int st, int en, vector<int>& h) {
        if (st > en) return 0;
        if (st == en) return h[st];

        int minIndex = query(0, h.size() - 1, 1, st, en, h);
        int leftSideMaxSum  = findMaxSum(st, minIndex - 1, h);
        int rightSideMaxSum = findMaxSum(minIndex + 1, en, h);

        return max({
            h[minIndex] * (en - st + 1),
            leftSideMaxSum,
            rightSideMaxSum
            });
    }

    int largestRectangleArea(vector<int>& heights) {
        tree.resize(heights.size() * 4);
        init(0, heights.size() - 1, 1, heights);

        return findMaxSum(0, heights.size() - 1, heights);
    }
};
```


## Using Stack : O(N)

```cpp
class Solution {
public:
    int largestRectangleArea(vector<int>& heights) {
        int maxSum = 0;
        stack<int> stk;
        stk.push(-1);
        for(int i = 0; i < heights.size(); i++) {
            while((stk.top() != -1) && heights[stk.top()] >= heights[i]) {
                int h = heights[stk.top()];
                stk.pop();
                int w = i - stk.top() - 1;
                maxSum = max(maxSum, h * w);
            }
            stk.push(i);
        }
        while(stk.top() != -1) {
            int h = heights[stk.top()];
            stk.pop();
            int w = heights.size() - stk.top() - 1;
            maxSum = max(maxSum, h * w);
        }
        return maxSum;
    }
};
```
