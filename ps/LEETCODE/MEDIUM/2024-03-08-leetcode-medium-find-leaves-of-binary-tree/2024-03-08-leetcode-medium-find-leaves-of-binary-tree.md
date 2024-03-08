---
layout: post
title : "Leetcode::problem(366) Find Leaves of Binary Tree"
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
date: "2024-03-08"
---

# Leetcode::Find Leaves of Binary Tree
- [Link : Leetcode::Find Leaves of Binary Tree](https://leetcode.com/problems/find-leaves-of-binary-tree/description/)

- level : medium
- 23 mins to solve

# point
- Given the root of binary tree, collect a tree's nodes as if you are doing as below
  - Collect all the leaf nodes
	- Remove all the leaf nodes
	- Remove until the tree is empty

# Design
- You'll find O(N^2) solution by using brute force
  - If you literally cut leaves for the depth 'k'
	  - This iteration takes O(N)
  - Since there can be upto O(N) depth, it takes O(N) for launching a traversal each time from the orignal root for the binary tree

- Once you realize that traversing all nodes at every depth is a waste, you'll find a O(N) solution
- Because, what you do is just visiting the same nodes at each depth
- To optimize this part, we can have idea like below
  - At each node, we get longest distance to any leaves
	  - Because this current node can be leaf node when all of it's subtree nodes are deleted which takes the same amount of nodes to the farthest node


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
    int getLongestDistToLeaf(TreeNode* root, vector<vector<int> > & ret) {
        int leDist = max(0, root->left  != nullptr ? getLongestDistToLeaf(root->left, ret) : 0);
        int riDist = max(0, root->right != nullptr ? getLongestDistToLeaf(root->right, ret): 0);
        int mx = max(leDist, riDist);
        ret[mx].push_back(root->val);
        return mx + 1;
    }
    vector<vector<int>> findLeaves(TreeNode* root) {
       vector<vector<int> > ret(101);
       getLongestDistToLeaf(root, ret);
       
       while(ret.back().size() == 0) ret.pop_back();  
       return ret;
    }
};
```
