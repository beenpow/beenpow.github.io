---
layout: post
title : "Leetcode::problem same tree"
subtitle: "Leetcode ps easy"
type: "Leetcode easy"
easy: true
ps: true
leetcode: true
text: true
author: "beenpow"
post-header: true
header-img: ""
order: 1
date: "2025-05-07"
---

# Leetcode::same tree
- [Link : Leetcode:same tree](https://leetcode.com/problems/same-tree/description/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, 3 3 3 0 0
- level : easy

# point
- Given the rrots of two binary trees p and q, write a function to check if they are the same or not.

# Design
- The problem is about checking all nodes from both trees.
- Because they have to be same, we traverse both trees in a same route.
- If any of conditions are unmet along the way, the trees have difference.
    - For example, values are different.

# Big O(time)
- TIME : O(N)
- SPACE : O(1)

# Code

```cpp
/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode() : val(0), left(nullptr), right(nullptr) {}
 *     TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
 *     TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
 * };
 */
class Solution {
public:
    bool dfs(TreeNode* p, TreeNode *q) {
        if (p == nullptr && q == nullptr) return true;
        if (p == nullptr || q == nullptr) return false;
        if (p->val != q->val) return false;

        return dfs(p->left, q->left) && dfs(p->right, q->right);
    }
    bool isSameTree(TreeNode* p, TreeNode* q) {
        return dfs(p, q);
    }
};
```