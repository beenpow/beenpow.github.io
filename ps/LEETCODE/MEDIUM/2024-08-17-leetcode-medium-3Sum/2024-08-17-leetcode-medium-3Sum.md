---
layout: post
title : "Leetcode::problem(15) 3Sum"
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
date: "2024-08-17"
---

# Leetcode::3Sum
- [Link : Leetcode::3Sum](https://leetcode.com/problems/3sum/description/?envType=company&envId=facebook&favoriteSlug=facebook-thirty-days)

- level : medium
- failed on algorithm

# point
- Given an integer array nums, return all triplets [nums[i], nums[j], nums[k]] such that
- i != j && i != k && j != k and nums[i] + nums[j] + nums[k] == 0.

# Design
## Using two pointers
- We know that possible maximum value of 'n' is relatively small.
- Basically we iterate i and j by increasing order, so we need to sort nums before we do anything.
- If we fixate the first value nums[i], we are able to find nums[j] and num[k] by using logical thinking.
- Since nums[i] is fixed, we start with smallest number and largest number among (j ~ n-1) indices.
- If the sum is less than 0, we move our smallest number indicator to right side.
- If the sum is greater than 0, we move our largest number indicator to left side.
- If we find the sum is equal to 0, we push this triplet to the answer then move smallest number indicator which is nums[j] to right side.

## Using hash set
- Using hash set works similarly with the 'using two pointers' method.
- First of all, we sort the given nums.
- Second, we fix num[i] as we iterate them.
- Third, we iterate num[j] then we get 'complement' as "-nums[i] -num[j]"
- If we've seen this complement on the 'seen' set, we add this triplet to the answer.
- If not, we push num[j] into 'seen'.
- How this mechanism works?
  - The thing is that num[j] that goes into 'seen' is distinct number.
  - So, we leverage this fact.
	- We stack 'num[j]' because any distinct number on the given nums can be a complement sum of other two.

# Big O(time)
- TIME : O(N^2)
- SPACE : O(N)

# Code

## two pointers
```cpp
class Solution {
public:
    vector<vector<int>> ans;
    void findTwoSum(int fi, int j, vector<int>& nums) {
        int lo = j + 1, hi = nums.size() - 1;
        while(lo < hi) {
            if (fi + nums[lo] + nums[hi] > 0) hi--;
            else if (fi + nums[lo] + nums[hi] < 0) lo++;
            else if (fi + nums[lo] + nums[hi] == 0) {
                ans.push_back({fi, nums[lo], nums[hi]});
                while(lo + 1 < nums.size() && nums[lo] == nums[lo + 1]) lo++;
                lo++;
            }
        }
    }
    vector<vector<int>> threeSum(vector<int>& nums) {
        sort(nums.begin(), nums.end());
        for (int i = 0; i < nums.size() && nums[i] <= 0; i++) {
            if (i == 0 || nums[i] != nums[i-1]) {
                findTwoSum(nums[i], i, nums);
            }
        }
        return ans;
    }
};
```

## hash set
```cpp
class Solution {
public:
    void twoSum(int fi, int i, vector<int>& nums, vector<vector<int>>& ans) {
        set<int> seen;
        for (int j = i + 1; j < nums.size(); j++) {
            int complement = - (fi + nums[j]);
            if (seen.count(complement)) {
                ans.push_back( {fi, nums[j], complement} );
                while(j + 1 < nums.size() && nums[j] == nums[j+1]) j++;
            }
            seen.insert(nums[j]);
        }
    }
    vector<vector<int>> threeSum(vector<int>& nums) {
        sort(nums.begin(), nums.end());

        vector<vector<int>> ans;
        for(int i = 0; i < nums.size() && nums[i] <= 0; i++) {
            if (i == 0 || (nums[i] != nums[i-1])) {
                twoSum(nums[i], i, nums, ans);
            }
        }
        return ans;
    }
};
```
