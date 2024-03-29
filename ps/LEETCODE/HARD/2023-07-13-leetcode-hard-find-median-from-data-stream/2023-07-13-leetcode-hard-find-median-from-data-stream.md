---
layout: post
title : "Leetcode::problem(295) Find Median from Data Stream"
subtitle: "Leetcode ps hard"
type: "Leetcod hard"
hard: true
ps: true
leetcode: true
text: true
author: "beenpow"
post-header: true
header-img: ""
order: 1
date: "2023-07-13"
---

# Leetcode::Find Median from Data Stream
- [Link : Leetcode::Find Median From Data Stream](https://leetcode.com/problems/find-median-from-data-stream/description/?envType=study-plan-v2&envId=apple-spring-23-high-frequency)

- level : hard

# point
- There can be 5 * 10^4 queries of adding numbers on the array
- On 'findMedian' is called, return the median value from the array

# Design
- This is kind of classic problem
- To get median we only need to know middle numbers on the given integers
- So, we can use min heap and max heap to maintain two possible middle numbers
- max heap has smaller numbers, min heap has larger numbers
- Top of max heap and Top of min heap are going to be used to get median value

# Big O(time)
- O(NlogN)

# Code

```cpp
class MedianFinder {
public:
    // small :: max heap
    // large :: min heap
    priority_queue<int> small, large;
    MedianFinder() {
        while(!small.empty()) small.pop();
        while(!large.empty()) large.pop();
    }
    
    void addNum(int num) {
        if (small.empty()) {small.push(num); return;}
        else if (large.empty()) {
            if (small.top() < num) {
                large.push(-num);
            } else {
                large.push(-small.top());
                small.pop();
                small.push(num);
            }
            return;
        }

        if (num <= small.top()) small.push(num);
        else large.push(-num);

        while (small.size() < large.size() && !small.empty()) {
            small.push(-large.top());
            large.pop();
        }
        while (small.size() > large.size() + 1 && !large.empty()) {
            large.push(-small.top());
            small.pop();
        }

    }
    
    double findMedian() {
        int n = small.size(), m = large.size();
        if ((n + m) % 2 == 0) {
            if (n == 0 && m == 0) return 0;
            if (n != m) static_assert("WD", "WTF");
            return (double)(small.top() + - large.top()) / 2;
        }
        else {
            if (n == 0) static_assert("WD", "WFF");
            return (double)small.top();
        }
    }
};

/**
 * Your MedianFinder object will be instantiated and called as such:
 * MedianFinder* obj = new MedianFinder();
 * obj->addNum(num);
 * double param_2 = obj->findMedian();
 */
```

## With approach 4

```cpp
class MedianFinder {
public:
    multiset<int> data;
    multiset<int>::iterator lo_median, hi_median;

    MedianFinder() {

    }
    
    void addNum(int num) {
        int n = data.size();
        data.insert(num);
        if (n == 0) {
            lo_median = hi_median = data.begin();
        }
        // odd -> even
        else if (n & 1) {
            if (num < *lo_median)
                lo_median--;
            else
                hi_median++;
        }
        // even -> odd
        else {
            if (num <= *lo_median)
                lo_median = --hi_median;
            else if (*lo_median < num && num < *hi_median)
                lo_median++, hi_median--;
            else
                lo_median++;
        }
    }
    
    double findMedian() {
        if (data.size() & 1) return (double)*lo_median;
        else return (double)(*lo_median + *hi_median) / 2;
    }
};

/**
 * Your MedianFinder object will be instantiated and called as such:
 * MedianFinder* obj = new MedianFinder();
 * obj->addNum(num);
 * double param_2 = obj->findMedian();
 */
```
