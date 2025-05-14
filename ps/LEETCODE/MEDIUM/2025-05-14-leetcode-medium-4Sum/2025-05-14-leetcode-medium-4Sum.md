---
layout: post
title : "Leetcode::problem 4Sum"
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
date: "2025-05-14"
---

# Leetcode::4Sum
- [Link : Leetcode:4Sum](https://leetcode.com/problems/4sum/description/?envType=company&envId=google&favoriteSlug=google-thirty-days)
- Solved, algorithm 180
- level : medium

# point
- Given an array nums of n integers, return an array of all the unique quadruplets {nums[a], nums[b], nums[c], nums[d]} such that:
    - 0 <= a, b, c, d < n
    - a, b, c and d are distinct
    - nums[a] + nums[b] + nums[c] + nums[d] == target

# Design
- There are other problems like, 2Sum, 3Sum.
- They all use similar solutions but it is hard to come up with such methods.
- Below two things are the typical solutions.
    - Two Pointers
        - Let's say the quadraplets are consist of i, j, lo and hi.
        - We make sure below defitions hold.
            - i < j < lo < hi
            - nums[i] <= nums[j] <= nums[lo] <= nums[hi]
        - To use two pointers, we set i and j first by using for-loops.
        - Then we find lo and hi by comparing between the sum of number and the target.
        - If the sum is less than target, we increase lo as 1.
        - If the sum is greater than target, we decreas hi as 1.
        - If the sum is equal to target, we store the quadraplets as an answer.
            - Also, we need to move lo and hi by making sure that they have to be uniquely moved.
    - Hash Set
        - We find the answer with recursive function called 'kSum'.
        - kSum returns k sets of answers.
        - For example,
            - Let's say we try to find the answer {nums[i], nums[j], nums[o], nums[p]}.
            - If k is 2, it means that we return {nums[o], nums[p]}.
            - If k is 3, it means that we return {nums[j], nums[o], nums[p]}.
        - So, for the first and second numbers from the answer, we find them by iterating the numbers with for-loops.
        - Then we find third and fourth numbers with 'twoSum' function.
        - toSum function works same as for 2Sum, 3Sum problems.

# Big O(time)
- two pointers
    - TIME : O(N^3)
    - SPACE : O(N)
- Hash Set
    - TIME : O(N^3)
    - SPACE : O(N)

# Code

## two pointers

```cpp
class Solution {
public:
    vector<vector<int>> fourSum(vector<int>& nums, int target) {
        int n = nums.size();
        if (n < 4) return vector<vector<int>> ();

        sort(nums.begin(), nums.end());
        vector<vector<int>> ans;
        for (int i = 0; i < n - 3; i++) {
            if (i > 0 && nums[i-1] == nums[i]) continue;
            for (int j = i + 1; j < n - 2; j++) {
                if (j > i + 1 && nums[j-1] == nums[j]) continue;
                int lo = j + 1, hi = n - 1;
                while (lo < hi) {
                    long long sum = (long long) nums[i] + nums[j] + nums[lo] + nums[hi];
                    if (sum < target) {
                        lo++;
                    }
                    else if (sum > target) {
                        hi--;
                    }
                    else {
                        ans.push_back({nums[i], nums[j], nums[lo++], nums[hi--]});
                        while(lo < hi && nums[lo-1] == nums[lo]) lo++;
                        while(lo < hi && nums[hi] == nums[hi+1]) hi--;
                    }
                }
            }
        }
        return ans;
    }
};
```

```cpp
class Solution {
public:
    vector<vector<int>> fourSum(vector<int>& nums, int target) {
        int n = nums.size();
        if (n < 4) return vector<vector<int>>();

        vector<vector<int>> ans;
        sort(nums.begin(), nums.end());
        for (int i = 0; i < n - 3; i++) {
            if (i > 0 && nums[i-1] == nums[i]) continue;
            for (int j = i + 1; j < n - 2; j++) {
                if (j > i+1 && nums[j-1] == nums[j]) continue;

                unordered_set<long long> seen;
                for (int k = j + 1; k < n; k++) {
                    long long sum = (long long) nums[i] + nums[j] + nums[k];
                    long long remain = (long long) target - sum;
                    if (seen.count(remain)) {
                        vector<int> tmp = {nums[i], nums[j], nums[k], (int) remain};
                        sort(tmp.begin(), tmp.end());
                        if (ans.empty() || ans.back() != tmp) {
                            ans.push_back(tmp);
                        }
                    }
                    seen.insert(nums[k]);
                }
            }
        }
        return ans;
    }
};
```

## Hash set

```cpp
class Solution {
public:
    vector<vector<int>> fourSum(vector<int>& nums, int target) {
        sort(nums.begin(), nums.end());
        return kSum(nums, target, 0, 4);
    }
    vector<vector<int>> kSum(vector<int>& nums, long long target, int start, int k) {
        vector<vector<int>> res;
        int n = nums.size();

        if (start == n) return res;

        long long avg = target / k;
        if (nums[start] > avg || nums[n - 1] < avg) return res;

        if (k == 2) return twoSum(nums, target, start);

        for (int i = start; i < n; i++) {
            if (i != start && nums[i-1] == nums[i]) continue;
            auto subsets = kSum(nums, target - nums[i], i + 1, k - 1);
            for (auto subset : subsets) {
                res.push_back({nums[i]});
                res.back().insert(res.back().end(), subset.begin(), subset.end());
            }
        }
        return res;
    }
    vector<vector<int>> twoSum(vector<int>& nums, long long target, int start) {
        vector<vector<int>> res;
        unordered_set<long long> seen;
        for (int i = start; i < nums.size(); i++) {
            if (res.empty() || res.back()[1] != nums[i]) {
                if (seen.count(target - nums[i])) {
                    res.push_back({(int)target - nums[i], nums[i]});
                }
            }
            seen.insert(nums[i]);
        }
        return res;
    }
};
```