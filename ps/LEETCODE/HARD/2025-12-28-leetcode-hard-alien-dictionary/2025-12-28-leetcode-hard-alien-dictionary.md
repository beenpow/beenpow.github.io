---
layout: post
title : "Leetcode::problem alien dictionary"
subtitle: "Leetcode ps hard"
type: "Leetcode hard"
hard: true
ps: true
leetcode: true
text: true
author: "beenpow"
post-header: true
header-img: ""
order: 1
date: "2025-12-28"
---

# Leetcode::alien dictionary
- [Link : Leetcode:alien dictionary](https://leetcode.com/problems/alien-dictionary/description)
- Solved, 10 30 20 5 5
- level : hard

# Problem Description
- Return a string of the unique letters in the new alien language sorted in lexicographically increasing order by the new language's rules.

# How to solve
- Alien language has it's own order for the English alphabet.
- All we need to do is find the order and print them.
- I was considering both disjoint set and topolocial sort to solve this problem.
- However disjoint set can not make a proper ordering, so excluded.
- Let's say each alphabet character represents a node.
- Every time we compare adjacent words, we may get one pair of edge between two nodes.
    - Since they are lexicographically ordered, we get at most one pair of edge.
    - When the given words are like "ab" and "abc", we can not get an edge.
    - While we are connecting nodes, we also get indegree count for all the alphabets.
- Then we follow the typical routine of a topological sort.
    - Push nodes that has no indegree to the queue.
    - Pop a value from a queue and remove one indegree from it's neighbors.
    - If it's neighbor has no indegree then push it to the queue.
- One thing we have to be carefult is this case.
    - "abc", "ab"
    - It's not lexicographically ordered, so in this case we have to return "" as a result.

# Big O (Time, Space)
- TIME
    - O(NK)
        - N is the number of words.
        - K is the length of a word.
- SPACE
    - O(NK)

# Code

```cpp
class Solution {
public:
    string alienOrder(vector<string>& words) {
        const int ALPHABETS = 26;
        int n = words.size();
        set<int> seen;
        vector<int> indegree(ALPHABETS, 0);
        vector<set<int> > grp(ALPHABETS);

        // 0. adding all alphabet characters to 'seen'.
        for (int i = 0; i < n; i++) for (int j = 0; j < words[i].size(); j++) seen.insert(words[i][j] - 'a');

        // 1. making a directed graph while getting indegree.
        for (int i = 1; i < n; i++) {
            int len = min(words[i-1].size(), words[i].size());
            bool found = false;
            for (int j = 0; j < len; j++) if (words[i-1][j] != words[i][j]) {
                int prev = words[i-1][j] - 'a';
                int nxt  = words[i][j] - 'a';
                if (grp[prev].find(nxt) == grp[prev].end()) {
                    grp[prev].insert(nxt);
                    indegree[nxt]++;
                }
                found = true;
                break;
            }
            // For the case of ["abc", "ab"].
            if (found == false && words[i-1].size() > words[i].size()) {
                return "";
            }
        }

        queue<int> q;
        // 2. Push alphabets that has no indegree.
        for (int i = 0; i < ALPHABETS; i++) {
            if (seen.find(i) != seen.end() && indegree[i] == 0) q.push(i);
        }

        string str = "";
        // 3. Run the topological sort algorithm.
        while (!q.empty()) {
            int cur = q.front(); q.pop();
            str += (cur + 'a');

            for (auto it = grp[cur].begin(); it != grp[cur].end(); it++) {
                int nxt = *it;
                indegree[nxt]--;
                if (indegree[nxt] == 0) {
                    q.push(nxt);
                }
            }
        }

        // 4. Check if there is a cycle.
        for (int i = 0; i < ALPHABETS; i++) if (indegree[i] > 0) {
            return "";
        }

        return str;
    }
};
```