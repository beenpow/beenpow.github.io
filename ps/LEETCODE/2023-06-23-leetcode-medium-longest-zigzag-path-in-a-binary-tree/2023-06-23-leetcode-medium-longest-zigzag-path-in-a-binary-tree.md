---
layout: post
title : "Leetcode::problem(1372) Longest ZigZag Path in a Binary Tree"
subtitle: "Leetcode ps medium"
type: "Leetcode medium"
level: "medium"
ps: true
leetcode: true
text: true
author: "beenpow"
post-header: true
header-img: "https://www.spotebi.com/wp-content/uploads/2019/01/one-day-day-one-workout-motivation-spotebi.jpg"
order: 1
date: "2023-06-23"
---

# Leetcode::Longest ZigZag Path in a Binary Tree
- [Link : Leetcode::Longest ZigZag Path in a binary tree](https://leetcode.com/problems/longest-zigzag-path-in-a-binary-tree/description/?envType=study-plan-v2&envId=apple-spring-23-high-frequency)

- level : medium

# point
- A rooted binary tree is given.
- Find the longest zigzag path length.

# Design
- Since it's binary tree, we always have two options, left and right
- Now we go all the way down from the top by counting zigzag length
- We can achieve this goal by using dfs with parameter zigzagcnt
  - zigzagcnt is length of zigzag path from somewhere to current node.
  - If we want to use another direction beside the direction that came to the current node from it's parent, we have to make this count as 0.
  - Otherwise we can use it.


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

 #define LEFT 0
 #define RIGHT 1
class Solution {
public:
    int mx = 0;
    void dfs(TreeNode* root, int cameDir = -1, int dnZigZagCnt = 0) {
        mx = max(mx, dnZigZagCnt);
        if (cameDir == LEFT) {
            // go left
            if (root->left != nullptr) dfs(root->left, LEFT, 1);

            // go right
            if (root->right != nullptr) dfs(root->right, RIGHT, dnZigZagCnt + 1);
        }
        else if (cameDir == RIGHT) {
            // go left
            if (root->left != nullptr) dfs(root->left, LEFT, dnZigZagCnt + 1);

            // go right
            if (root->right != nullptr) dfs(root->right, RIGHT, 1);
        }
        else {
            // go left
            if (root->left != nullptr) dfs(root->left, LEFT, 1);

            // go right
            if (root->right != nullptr) dfs(root->right, RIGHT,1);
        }
    }
//  노드 root 에서부터 아래로 뻗어갈때 가질 수 있는 최대 ZigZag 갯수
    int longestZigZag(TreeNode* root) {
        dfs(root);
        return mx;
    }
};
```
