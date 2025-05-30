---
layout: post
title : "Leetcode::problem accounts merge"
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
date: "2025-05-30"
---

# Leetcode::accounts merge
- [Link : Leetcode:accounts merge](https://leetcode.com/problems/accounts-merge/description/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, algorithm 180
- level : medium

# Problem Description
- Given a list of accounts, merge them if they have the same email.
- Return the list of accounts after merging.
    - Each account is a list of strings, the first string is the name, and the rest are emails.
    - The emails are unique within a single account.
    - The accounts are unique.
    - The accounts are given in no particular order.

# How to solve
- DFS
    - Use DFS to find all the emails that are connected.
    - We create a person's emails as a 'start' of a graph.
    - At the center of the graph, we have the first email.
    - Then same emails from other accounts are connected naturally.
    - With this manner, we are able to find all connected emails.
- Union Find
    - Use Union Find to find all the emails that are connected.
    - It's a simple way of finding the answer, but it's rather hard to come up with a clear solution.
    - So we have to make it crystal clear before we jump into the solution.
    - We use a map to store emails as a key, and the index of the account as a value.
    - While storing, we check if the email is already in the map.
    - If it is, we use Union Find to merge the account.
    - After storing, we use a map to store the index of the account as a key, and the emails as a value.
        - So it's like a reverse map of the first map.
    - Then we know how many emails are connected to the account.
    - We can use this information to return the answer.
# Big O (Time, Space)
- DFS
    - Time : O(n * m)
    - Space : O(n * m)
- Union Find
    - Time : O(n * m)
    - Space : O(n * m)

# Code

## DFS

```cpp
class Solution {
public:
    unordered_set<string> visited;
    unordered_map<string, vector<string>> adj;

    void DFS(vector<string>& mergedAccount, string curEmail) {
        visited.insert(curEmail);
        mergedAccount.push_back(curEmail);
        for (auto nextEmail : adj[curEmail]) {
            if (visited.find(nextEmail) == visited.end()) {
                DFS(mergedAccount, nextEmail);
            }
        }
    }
    vector<vector<string>> accountsMerge(vector<vector<string>>& accounts) {
        int n = accounts.size();
        for (auto account : accounts) {
            string firstEmail = account[1];
            for (int j = 2; j < account.size(); j++) {
                adj[firstEmail].push_back(account[j]);
                adj[account[j]].push_back(firstEmail);
            }
        }

        vector<vector<string>> mergedAccounts;
        for (auto account : accounts) {
            string name = account[0];
            string firstEmail = account[1];
            if (visited.find(firstEmail) == visited.end()) {
                vector<string> mergedAccount;
                mergedAccount.push_back(name);
                DFS(mergedAccount, firstEmail);
                sort(mergedAccount.begin() + 1, mergedAccount.end());

                mergedAccounts.push_back(mergedAccount);
            }
        }

        return mergedAccounts;
    }
};
```


## Union Find

```cpp
class Solution {
public:

    int findParent(int x, vector<int>& p) {
        if (p[x] == x) return p[x];
        return p[x] = findParent(p[x], p);
    }
    void dsuMerge(int u, int v, vector<int>& p, vector<int>& sz) {
        int pu = findParent(u, p);
        int pv = findParent(v, p);

        if (pu == pv) return;
        if (sz[pu] >= sz[pv]) {
            p[pv] = pu;
            sz[pu] += sz[pv];
        } else {
            p[pu] = pv;
            sz[pv] += sz[pu];
        }
    }
    vector<vector<string>> accountsMerge(vector<vector<string>>& accounts) {
        int n = accounts.size();

        // parent
        vector<int> p(n, 0), sz(n, 1);
        for(int i = 0; i < n; i++) p[i] = i;

        unordered_map<string, int> emailGroup;
        for (int i = 0; i < n; i++) {
            for (int j = 1; j < accounts[i].size(); j++) {
                string email = accounts[i][j];
                if (emailGroup.find(email) == emailGroup.end()) {
                    emailGroup[email] = i;
                } else {
                    dsuMerge(i, emailGroup[email], p, sz);
                }
            }
        }

        unordered_map<int, vector<string>> components;
        for (auto emailIterator : emailGroup) {
            string mail = emailIterator.first;
            int group = emailIterator.second;
            components[findParent(group, p)].push_back(mail);
        }

        vector<vector<string>> mergedAccount;
        for (auto componentIterator : components) {
            int group = componentIterator.first;
            vector<string> emails = componentIterator.second;

            vector<string> merged = {accounts[group][0]};
            merged.insert(merged.end(), emails.begin(), emails.end());
            sort(merged.begin() + 1, merged.end());
            
            mergedAccount.push_back(merged);
        }

        return mergedAccount;
    }
};
```

