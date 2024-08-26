---
layout: post
title : "Leetcode::problem(1650) Lowest Common Ancestor of a Binary Tree 3"
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
date: "2024-08-26"
---

# Leetcode::Lowest Common Ancestor of a Binary Tree 3
- [Link : Leetcode::Lowest Common Ancestor of a Binary Tree 3](https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree-iii)

- level : medium
- took 12 mins to solve

# point
- Given two nodes of a binary tree p and q, return their lowest common ancestor (LCA).

# Design
- The distinct point between this problem and other LCA problems is that this problem has 'parent' node is provided on the node class.
- Also, p and q nodes are given, not exactly root of a binary tree.
- We can find LCA by finding all the ancestors from each p and q.
- Then we reverse the ancestors and compare them.
- While we iterate through both ancestors together, we notice diffent point.
- Previous node of different point is the one we are looking for.

# Big O(time)
- TIME : O(N)
- SPACE : O(N)

# Code

```cpp
/*
// Definition for a Node.
class Node {
public:
    int val;
    Node* left;
    Node* right;
    Node* parent;
};
*/

class Solution {
public:
    Node* lowestCommonAncestor(Node* p, Node * q) {
        vector<Node*> pathP, pathQ;
        uptoTop(p, pathP);
        uptoTop(q, pathQ);

        reverse(pathP.begin(), pathP.end());
        reverse(pathQ.begin(), pathQ.end());

        Node* prev = nullptr;
        int i = 0, j = 0;
        while (i < pathP.size() && j < pathQ.size() && pathP[i] == pathQ[j]) prev = pathP[i], i++, j++;
        return prev;
    }
    void uptoTop(Node* cur, vector<Node*>& path) {
        path.push_back(cur);
        if (cur->parent != nullptr) uptoTop(cur->parent, path);
    }
};
```
