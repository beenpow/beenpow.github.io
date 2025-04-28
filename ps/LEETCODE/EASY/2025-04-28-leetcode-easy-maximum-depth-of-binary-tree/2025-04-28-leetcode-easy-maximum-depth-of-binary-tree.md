---
layout: post
title : "Leetcode::problem maximum depth of binary tree"
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
date: "2025-04-28"
---

# Leetcode::maximum depth of binary tree
- [Link : Leetcode:maximum depth of binary tree](https://leetcode.com/problems/maximum-depth-of-binary-tree/description/)
- Solved, 3 5 30 30 3
- level : easy

# point
- Given the root of a binary tree, return its maximum depth.

# Design
- To check the depth of a binary, it's necessary to dig in all the nodes.
- To achieve that, we simply do dfs and update the maximum depth of the given binary tree.

# Big O(time)
- N : total counts of all nodes.
- M : Maximual depth of binary tree * each function call's stack size.
- TIME : O(N)
- SPACE : O(M)

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
    int dfs(TreeNode* root, int depth) {
        if(root == nullptr) return depth - 1;
        int le = 0, ri = 0;
        if (root->left != nullptr) le = dfs(root->left, depth + 1);
        if (root->right!= nullptr) ri = dfs(root->right, depth + 1);
        return max({depth, le, ri});
    }
    int maxDepth(TreeNode* root) {
        int ret = dfs(root, 1);
        return ret;
    }
};
```