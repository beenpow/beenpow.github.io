---
layout: post
title : "Leetcode::problem(314) Binary Tree Vertical Order Traversal"
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
date: "2024-08-24"
---

# Leetcode::Binary Tree Vertical Order Traversal
- [Link : Leetcode::Binary Tree Vertical Order Traversal](https://leetcode.com/problems/binary-tree-vertical-order-traversal/)

- level : medium
- failed to solve, but fully understood with edit.

# point
- Given the root of a binary tree, return the vertical order traversal of its node's values.
- Priority
  - Left Column to Right Column
	- Top row to Bottom row

# Design
- Very interesting problem it is.
- I tried to create a struct that can manage the priority but it got messed up due to ambigous critiria.
- Let me introduce edit's ways which is crystal clear.
- Both methods are very similar.
- First of all, it's necessary to define (row, column) based on the position of nodes.
 -  Root has row, column as (0, 0)
	- Left child of it has, (1, -1).
	- Right child of it has, (1, 1).
	- And so on.
	- Basically, every child's row is equal to parent's row + 1.
	- Also, every move to the left decrease column by 1.
	- Every move to the right decrease column by 1.
- We first traverse nodes and put nodes in a map which has type as int, vector<int>.
  - First element is 'column'.
	- Second element is a list of nodes where each node's column is same.
- DFS
  - We traverse nodes with DFS's preorder.
	- After the traverse, we have column sorted vectors.
	- But we have to sort each vector in row too.
	- Also, if there are several nodes in the same position, we need to sort them too.
	- Fortunately, we don't need to worry about 'same position', because we stacked nodes by 'preorder' dfs.
	  - If there are several nodes on the same position, they are stacked from left to right.
	- So, now we only care about 'row' sort.
	- To achieve this, it's necessary to add 'row' when we push_back node into the vector.
	- Then, after DFS we are able to naively sort them from 0 to max Row.
	- Technically, max row can be up to 100 when the given binary is unbalanced.
- BFS
  - By far, this is the simplest way to solve the problem yet.
	- We use similar technique with DFS.
	- But we gotta think through how BFS traverse the given binary tree.
	- We understand that it traverse from top to bottom and left to right
	- We can leverage this natural mechanism not to sort the result after BFS.
	- If we stack nodes in the same map (int, vector<int>), we don't need to sort.
	- Which yields the time complexity as O(N).

# Big O(time)
- DFS
	- TIME : max ( O(A x B x C), O(N) )
	  - A: number of columns : This can be up to 100 (Unbalanced Tree)
		- B: number of rows : This can be up to 100 (Unbalanced Tree)
		- C: elements in the same (row, col) : This can be up to 50. (Repeating diamond ways only)
		- Note that A and B are related, both can not be maximum value (100) simultaneously.
	- SPACE : O(N)
- BFS
  - TIME : O(N)
	  - Only visiting N nodes which makes the time complexity as O(N)
  - SPACE : O(N)

# Code

## DFS

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
    int mxRow = -1;
    map<int, int> enabledCols; // enabledCols[i] = j. i -> col, j -> index from the vector colToRow;
    vector<vector<pair<int,int>>> colToRow;
    vector<vector<int>> verticalOrder(TreeNode* root) {
        vector<vector<int>> ans;
        if (root == nullptr) return ans;

        dfs(root, 0, 0);
        for (auto it = enabledCols.begin(); it != enabledCols.end(); it++) {
            int i = it->second;
            vector<int> toAns;
            for (int r = 0; r <= mxRow; r++) {
                for (int j = 0; j < colToRow[i].size(); j++) {
                    if (colToRow[i][j].first == r) toAns.push_back(colToRow[i][j].second);
                }
            }

            ans.push_back(toAns);
        }
        return ans;
    }
    void dfs(TreeNode* root, int row, int col) {
        if (root == nullptr) return;
        if (enabledCols.find(col) == enabledCols.end()) {
            enabledCols[col] = colToRow.size();
            colToRow.push_back(vector<pair<int,int>>());
        }

        colToRow[enabledCols[col]].push_back(make_pair(row, root->val));
        dfs(root->left, row + 1, col - 1);
        dfs(root->right, row + 1, col + 1);

        mxRow = max(mxRow, row);
    }
};
```

## BFS

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
    vector<vector<int>> verticalOrder(TreeNode* root) {
        vector<vector<int>> ans;
        if (root == nullptr) return ans;


        map<int, vector<int>> mp;
        queue<pair<TreeNode*, int>> q;

        q.push({root, 0});
        while(!q.empty()) {
            auto x = q.front(); q.pop();
            
            TreeNode* cur = x.first;
            int col = x.second;
            if (mp.find(col) == mp.end()) {
                mp[col] = vector<int>();
            }
            mp[col].push_back(cur->val);
            if (cur->left != nullptr) q.push({cur->left, col -1});
            if (cur->right != nullptr) q.push({cur->right, col + 1});
        }

        for(auto it = mp.begin(); it != mp.end(); it++) {
            ans.push_back(it->second);
        }
        return ans;
    }
};
```
