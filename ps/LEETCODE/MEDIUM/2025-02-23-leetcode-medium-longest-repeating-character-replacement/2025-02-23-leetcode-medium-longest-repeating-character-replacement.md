---
layout: post
title : "Leetcode::problem longest repeating character replacement"
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
date: "2025-02-23"
---

# Leetcode::longest repeating character replacement
- [Link : Leetcode:longest repeating character replacement](https://leetcode.com/problems/longest-repeating-character-replacement/description/?envType=company&envId=google&favoriteSlug=google-three-months)
- Solved, algorithm 120
- level : medium

# point
- You are given a string s and an integer k.
- You can choose any character of the string and change it to any other uppercase English character.
- You can perform this operation at most k times.
- Return the length of the longest substring containing the same letter you can get after performing the above operations.

# Design
- Every approach that are introduced on Editorial page is valuable, so we need to know all of them.
- Appr. 1 : Binary Search + Sliding Window
  - We are able to use binary search for this problem.
	- Specifically, we set the possible length and test if it works.
	- The supporting background why we can use binary search for this problem is like below.
	  - If we are able to solve with binary, it means that there is a length 'len'.
		- If 'len' can be the substring containing the same letter, so do 'len - 1', 'len -2', ... '1'.
	- After we set the length by binary search, we need to check if we can make 'len' with the given condition from the problem.
	- It's possible to check the validation with a frequency map.
	- We set our window size as 'len', then we use the most frequent character's count with 'k', then see if we can make 'len'.
- Appr. 2 : Sliding Window(Slow)
  - First of all, we only focus on each character at once.
	- Then, we do sliding window with that character.
	- Nothing else.
- Appr. 3 : Sliding Window(Fast)
  - This method is very interesting.
	- It's basically very similar with Appr. 2.
	- However, we do not set each iteration with each character.
	- We only iterate the whole string once.
	- While we iterate the given string, we maintain the frequency of each character and a maxiumFrequencyCount too.
	- The way we maintain the frequency of each chracter is pretty much same like other methods.
	- The only thing we need to focus is 'maxiumFrequencyCount'.
	- At every iteration, we check this iteration's value can update the maxiumFrequencyCount.
	- If the value can be increased(updated), we do not move window's left bar.
	- If not, we move the left bar.
	- It means that we increase the size of the window when we spare one of k, since we have more frequent value.

# Big O(time)
- Appr. 1 : Binary Search + Sliding Window
 - Time : O(NlogN)
 - Space : O(N)
- Appr. 2 : Sliding Window(Slow)
  - Time : O(NM), where M is the unique characters count
	- SPACE : O(M)
- Appr. 3 : Sliding Window(Fast)
  - Time : O(N)
	- Space : O(N)

# Code

## Approach 1. Binary Search + Sliding Window : O(NlogN)

```cpp
class Solution {
public:
// Approach 1. Binary Search + for loop : O(NlogN)
    bool valid(string s, int len, int k) {
        map<char, int> freq;
        int le = 0, maxFreq = 0;
        for(int ri = 0; ri < s.size(); ri++) {
            freq[s[ri]]++;
            if (ri - le + 1 > len) {
                freq[s[le]]--;
                le++;
            }
            maxFreq = max(maxFreq, freq[s[ri]]);
            if (maxFreq + k >= len) return true;
        }
        return false;
    }
    int characterReplacement(string s, int k) {
        int le = 0, ri = s.size();
        while(le <= ri) {
            int mid = (le + ri) / 2;
            if (valid(s, mid, k))
                le = mid + 1;
            else ri = mid - 1;
        }
        return ri;
    }
};
```

## Approach 2. Sliding Window(Slow) : O(NM)

```cpp
class Solution {
public:
// Approach 2. Sliding Window (Slow) : O(NM)
    int characterReplacement(string s, int k) {
        set<char> cha;
        for(int i = 0; i < s.size(); i++) cha.insert(s[i]);

        int maxLen = 0;
        for(auto c : cha) {
            int le = 0, freq = 0;
            for(int ri = 0; ri < s.size(); ri++) {
                if (s[ri] == c) freq++;
                if (freq + k < ri - le + 1) {
                    if (s[le] == c) freq--;
                    le++;
                }
                maxLen = max(maxLen, ri - le + 1);
            }
        }
        return maxLen;
    }
};
```

## Approach 3. Sliding Window(Fast) : O(N)

```cpp
class Solution {
public:
// Approach 3. Sliding Window (Fast) : O(N)
    int characterReplacement(string s, int k) {
        map<char, int> freq;
        int maxFreq = 0;
        int le = 0, maxLen = 0;
        for (int ri = 0; ri < s.size(); ri++) {
            freq[s[ri]]++;
            maxFreq = max(maxFreq, freq[s[ri]]);

            if (ri - le + 1 > maxFreq + k) {
                freq[s[le]]--;
                le++;
            }
            
            maxLen = max(maxLen, ri - le + 1);
        }
        return maxLen;
    }
};
```
