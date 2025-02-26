---
layout: post
title : "Leetcode::problem longest consecutive sequence"
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
date: "2025-02-26"
---

# Leetcode::longest consecutive sequence
- [Link : Leetcode:longest consecutive sequence](https://leetcode.com/problems/longest-consecutive-sequence/description/?envType=company&envId=google&favoriteSlug=google-three-months)
- Solved, 5 20 15 15 25
- level : medium

# point
- Given an unsorted array of integers nums, return the length of the longest consecutive elements sequence.
- You must write an algorithm that runs in O(N) time.

# Design
- I solved by using 'Unordered_map + DSU(Disjoint Set Union'.
- However, the Editorial suggest that we can simply count without DSU.
- Here's the logic to solve this problem.
  - To determine if there is a consecutive sequence at index i, we need to check left and right of the index.
	- For example, to find out if a[i] is in a sequence, we should check both a[i]-1 and a[i]+1.
- Since we must solve the problem in O(N) time, only thing we can use for checking a[i-1] and a[i+1] values is unordered_set or unordered_map.
- Because it takes O(1) for insert and delete with the structures.
- Then we now have unordered_set or unordered_map from the given array nums.
- Now we think... should we check both side like a[i]-1 and a[i]+1 ?
- Not necessarily.
- We simply can check a[i]+1 from a[i].
- And if there is a[i+1] in the structure, we know this is a sequence.
- For connecting those two values, I used DSU which seems have longer lines of code comparing to the Edit's way.
- The Edit suggest that we can solve this connecting part by just iterating the structure.
- It checks if there is a[i]-1 in the structure.
- If there is not, it means a[i] can be the start point of a sequence.
  - Then we check a[i]+1, a[i]+2, ...
- It's just a simple extension of thinking but incredibly usefult tactic!



# Big O(time)
- For both methods on #Code section.
  - Time : O(N)
  - Space : O(N)

# Code

## Unordered_map + DSU(Disjoint Set Uinon)

```cpp
class Solution {
public:
    vector<int> parent, sz;
    int find(int u) {
        if (parent[u] == u) return u;
        return parent[u] = find(parent[u]);
    }
    int longestConsecutive(vector<int>& nums) {
        int ans = 0;
        unordered_map<int, int> nums_uid;

        int uid = 0;
        for(int i = 0; i < nums.size(); i++) {
            if (nums_uid.find(nums[i]) == nums_uid.end()) {
                nums_uid[nums[i]] = uid++;
            } else {
                // Do nothing
            }
        }
        
        int n = nums_uid.size();
        parent = vector<int>(n + 1), sz = vector<int>(n + 1);
        for(int i = 0; i < n; i++) {
            parent[i] = i;
            sz[i] = 1;
        }

        for(int i = 0; i < nums.size(); i++) {
            if (nums_uid.find(nums[i]+1) == nums_uid.end()) continue;
            int uidCur = nums_uid[nums[i]];
            int uidNxt = nums_uid[nums[i] + 1];
            
            int pUidCur = find(uidCur);
            int pUidNxt = find(uidNxt);

            // This will not occur, since no same value remains in a map.
            if (pUidCur == pUidNxt) {
                // Exception.
            } else {
                if (sz[pUidCur] < sz[pUidNxt]) {
                    sz[pUidNxt] += sz[pUidCur];
                    parent[pUidCur] = pUidNxt;
                } else {
                    sz[pUidCur] += sz[pUidNxt];
                    parent[pUidNxt] = pUidCur;
                }
            }
        }

        for(int i = 0; i < n; i++) {
            ans = max(ans, sz[i]);
        }

        return ans;
    }
};
```

## Unordered_set

```cpp
class Solution {
public:
    int longestConsecutive(vector<int>& nums) {
        unordered_set<int> uos(nums.begin(), nums.end());
        int ans = 0;
        for(auto cur : uos) {
            // This is the start point of a streak
            if (uos.count(cur - 1) == false) {
                int curNum = cur;
                int streakLen = 1;
                while(uos.count(curNum + 1) == true) {
                    curNum += 1;
                    streakLen++;
                }
                ans = max(ans, streakLen);
            }
        }
        return ans;
    }
};
```
