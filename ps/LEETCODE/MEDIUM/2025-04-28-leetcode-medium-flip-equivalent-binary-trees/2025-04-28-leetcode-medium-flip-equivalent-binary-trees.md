---
layout: post
title : "Leetcode::problem flip equivalent binary trees"
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
date: "2025-04-28"
---

# Leetcode::flip equivalent binary trees
- [Link : Leetcode:flip equivalent binary trees](https://leetcode.com/problems/flip-equivalent-binary-trees/description/)
- Solved, 10 10 15 40 2
- level : medium

# point
- Given the roots of two binary trees root1 and root2, return true if the two trees are flip equivalent or false otherwise.

# Design
- It seems quite simple, but make it look like simple is not.
- The basic concept of solving this problem is this.
    - Implementing DFS with two different binary tree's root nodes.
    - Check if each root's left and right should be swapped.
    - Call a dfs with two left child and another dfs with two right child.
    - Repeat above implemtnation.
- The only thing we need to make it crystal clear is the part of base condition.
    - For example, each root can be null if we does not check if it's null before calling a dfs.
- Also, it's necessary to check child is null or not before swapping them.
- Other than that, it's simple implementation.

# Big O(time)
- TIME : O(N)
- SPACE : O(N)

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
    int VAL(TreeNode* root){return root==nullptr?-1:root->val;}
    // null 인 노드도 들어온다.
    bool dfs(TreeNode* root1, TreeNode* root2) {
        if (VAL(root1) != VAL(root2)) return false;
        if (VAL(root1) == -1) return true;
        if (VAL(root1->left) != VAL(root2->left)) swap(root2->left, root2->right);
        if (VAL(root1->left) != VAL(root2->left)) return false;
        return dfs(root1->left, root2->left) & dfs(root1->right, root2->right);
    }
    bool flipEquiv(TreeNode* root1, TreeNode* root2) {
        if (root1 == nullptr) return root2 == nullptr;
        if (root2 == nullptr) return root1 == nullptr;
        if (root1->val != root2->val) return false;
        return dfs(root1, root2);
    }
};

```