---
layout: post
title : "Leetcode::problem design circular queue"
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
date: "2025-10-28"
---

# Leetcode::design circular queue
- [Link : Leetcode:design circular queue](https://leetcode.com/problems/design-circular-queue)
- Solved, 5 8 7 3 0
- level : medium

# Problem Description
- Design your implementation of the circular queue.

# How to solve
- The brief structure of the circular queue is given.
- What we need to do is filling out the functions.
- Only thing we have to be certain about is the indices of front and rear when we create a circular queue.
- For example, if we naively keep enqueueing size of the queue can be larger than we assigned, so front and rear can be overlapped.
- To figure this out, we always check the size before we enQueue or deQueue.
- Also, making the indices circular is the ky.
    - For example, rear = (rear + 1) % SZ.
        - When we enQueue.

# Big O (Time, Space)
- TIME : O(3000) // maximum call count
- SPACE : O(k)

# Code

```cpp
class MyCircularQueue {
public:
    int SZ = 3005;
    int Q[3006];
    int cnt = 0;
    int front = 0, rear = 0;
    MyCircularQueue(int k) {
        SZ = k;
    }
    
    bool enQueue(int value) {
        if(cnt == SZ) return false;
        Q[rear] = value;
        rear = (rear+1)%SZ;
        cnt += 1;
        return true;
    }
    
    bool deQueue() {
        if(cnt == 0) return false;
        front = (front + 1) % SZ;
        cnt -= 1;
        return true;
    }
    
    int Front() {
        if(cnt == 0) return -1;
        return Q[front];
    }
    
    int Rear() {
        if(cnt == 0) return -1;
        return Q[(rear - 1 + SZ) % SZ];
    }
    
    bool isEmpty() {
        return cnt == 0;
    }
    
    bool isFull() {
        return cnt == SZ;
    }
};

/**
 * Your MyCircularQueue object will be instantiated and called as such:
 * MyCircularQueue* obj = new MyCircularQueue(k);
 * bool param_1 = obj->enQueue(value);
 * bool param_2 = obj->deQueue();
 * int param_3 = obj->Front();
 * int param_4 = obj->Rear();
 * bool param_5 = obj->isEmpty();
 * bool param_6 = obj->isFull();
 */
```