---
layout: post
title : "Leetcode::problem(2265) Count Nodes Equal to Average of Subtree"
subtitle: "Leetcode ps medium"
type: "Leetcode medium"
medium: true
ps: true
leetcode: true
text: true
author: "beenpow"
post-header: true
header-img: "https://www.spotebi.com/wp-content/uploads/2019/01/one-day-day-one-workout-motivation-spotebi.jpg"
order: 1
date: "2024-02-08"
---

# Leetcode::Count Nodes Equal to Average of Subtree
- [Link : Leetcode::Count Nodes Equal to Average of Subtree](https://leetcode.com/problems/count-nodes-equal-to-average-of-subtree/description/)

- level : medium

# point
- Root of binary tree is given
- Find how many nodes meet below expectation
  - Count nodes which has average of subtree as current node's value

# Design
- Simply it's traversal problem of the given binary tree
- The traversal function has only three jobs
  - First, get down to the left child if it has
	- Second, get down to the right child if it has
	- Third, sum left child's return and right child's return
- In the problem, we especially need node count and sum of subtree
- Then we can get the average value from it and compare to the current node's value

# Big O(time)
- O(N)

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
int cntEqual = 0;

    pair<int,int> traverse(TreeNode* cur) {
        int subTreeNodeCount = 1;
        int subTreeNodeSum = cur->val;
        pair<int,int> tmp = {0, 0};
        if (cur->left != nullptr) {
            tmp = traverse(cur->left);
            subTreeNodeCount += tmp.first;
            subTreeNodeSum   += tmp.second;
        }
        if (cur->right != nullptr) {
            tmp = traverse(cur->right);
            subTreeNodeCount += tmp.first;
            subTreeNodeSum   += tmp.second;
        }
        // verify
        if (subTreeNodeSum / subTreeNodeCount == cur->val) cntEqual++;
        return {subTreeNodeCount, subTreeNodeSum};
    }
    int averageOfSubtree(TreeNode* root) {
        traverse(root);
        return cntEqual;
    }
};
```
