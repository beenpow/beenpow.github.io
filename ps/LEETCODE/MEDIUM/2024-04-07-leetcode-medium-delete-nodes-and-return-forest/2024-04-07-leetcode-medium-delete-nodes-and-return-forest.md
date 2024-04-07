---
layout: post
title : "Leetcode::problem(1110) Delete Noedes and Return Forest"
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
date: "2024-04-07"
---

# Leetcode::Delete Nodes and Return Forest
- [Link : Leetcode::Delete Nodes and Return Forest](https://leetcode.com/problems/delete-nodes-and-return-forest/)

- level : medium
- 31mins to solve

# point
- Given the root of binary tree, each node in the tree has distinct value
- After deleting nodes from del_nodes, return the roots of the trees in the remaining forest

# Design
- This problem can get tricky
- Not to get distracted by the idea of traversaling the given tree, it is reuqired to make a simple logic
- For this problem, 
  - All we need to do is,
	  - Delete nodes who is in del_node list
		- Push nodes that has no parent node
		  - Knowning parent is a matter of transferring parameters through functions
  - Ths thing is that we do above actions when each tree-traversaling function ends
	  - So, we go down to the bottom first
		- And decide things when we go up to the top

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
    vector<TreeNode*> ret;
    map<int, int> del;

    void traversal(TreeNode* &cur, TreeNode* prev) {

        if (cur->left != nullptr) traversal(cur->left, cur);
        if (cur->right!= nullptr) traversal(cur->right, cur);

        const bool parentDeadPushCur = (prev == nullptr || del.find(prev->val) != del.end()) ? true : false;
        const bool curDead = (del.find(cur->val) != del.end());

        if (curDead) cur = nullptr;
        else if (parentDeadPushCur) ret.push_back(cur);
    }
    vector<TreeNode*> delNodes(TreeNode* root, vector<int>& to_delete) {
        for(auto x : to_delete) del[x]++;
        traversal(root, nullptr);
        return ret;
    }
};
```
