---
layout: post
title : "Leetcode::problem(236) Lowest Common Ancestor of a Binary Tree"
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
date: "2024-08-06"
---

# Leetcode::Lowest Common Ancestor of a Binary Tree
- [Link : Leetcode::Lowest Common Ancestor of a Binary Tree](https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree/description/)

- level : medium
- solved : 10 30 10 0 5

# point
- Given a binary tree, find the lowest common ancestor (LCA) of two given nodes in the tree.

# Design
- I've come up with two ideas, both are similar but let me introduce
- First
  - Using parent node (same with second editorial)
	- First, traverse the given tree and stack each node and it's parent
	- Second, find all the parents from point 'p' and stack it
	- Third, while finding all the parent from point 'q', if any of parents exist on the stack above this is the LCA
- Second (Solved this way)
  - Because I din't want to use the concept of 'parent', I used 'common parents' concept
	- Let's say parentQ as all parents start from root to point Q
	- Let's say parentP as all parents start from root to point P
	- If we compare parentP and parentQ, there are common parents start from the first index
	- Compare them and find the last index (LCA) that exist on both parentP and parentQ 

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
 *     TreeNode(int x) : val(x), left(NULL), right(NULL) {}
 * };
 */
class Solution {
public:
    vector<TreeNode*> untilP, untilQ;
    void dfs(TreeNode* cur, TreeNode* target, vector<TreeNode*>& stk, vector<TreeNode*>& final) {
        if (cur == target) {
            final = stk;
            return;
        }
        if (cur->left != nullptr) {
            stk.push_back(cur->left);
            dfs(cur->left, target, stk, final);
            stk.pop_back();
        }
        if (cur->right != nullptr) {
            stk.push_back(cur->right);
            dfs(cur->right, target, stk, final);
            stk.pop_back();
        }
    }
    TreeNode* lowestCommonAncestor(TreeNode* root, TreeNode* p, TreeNode* q) {
        vector<TreeNode*> stk;
        stk.push_back(root);
        dfs(root, p, stk, untilP);

        stk.clear();
        stk.push_back(root);
        dfs(root, q, stk, untilQ);

        TreeNode* ans = nullptr;
        for(int i = 0; i < min(untilP.size(), untilQ.size()); i++) {
            if (untilP[i]->val == untilQ[i]->val) ans = untilP[i];
            else {
                break;
            }
        }
        return ans;
    }
};
```
