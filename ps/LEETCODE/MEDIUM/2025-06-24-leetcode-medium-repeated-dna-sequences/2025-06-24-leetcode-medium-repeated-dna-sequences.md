---
layout: post
title : "Leetcode::problem repeated dna sequences"
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
date: "2025-06-24"
---

# Leetcode::repeated dna sequences
- [Link : Leetcode:repeated dna sequences](https://leetcode.com/problems/repeated-dna-sequences/description/)
- Solved, 2 3 5 0 80
- level : medium

# Problem Description
- Given a string s that represents a DNA sequence, return all the 10-letter-long sequences (substrings) that occur more than once in a DNA molecule. You may return the answer in any order.

# How to solve
- Linear-time Slice Using Substring + Hashset
    - I've used a hashset to store the sequences.
    - This would be the most simple solution.
    - But it would be O(NL) time and O(NL) space.
- Rabin-Karp: Constant-time Slice Using Rolling Hash
    - With rolling hash, we can get the hash of the substring in constant time.
    - Because there are only four characters, we can use rabin karp algorithm based on base 4.
    - Each DNA sequence is 10 characters long, so we can get the hash of the substring in constant time.
    - Plus, rolling the hash is also constant time.
        - Specifically, we move the leftmost character out of the window and move the rightmost character into the window in constant time.
- Bit Manipulation: Constant-time Slice Using Bitmask
    - We can use bit manipulation to get the hash of the substring in constant time.
    - We set each character to 2 bits, so that we can use bit manipulation to get the hash of the substring in constant time.
    - So we move the leftmost character out of the window and move the rightmost character into the window in constant time.

# Big O (Time, Space)
- N : length of the string
- L : length of the substring
- Linear-time Slice Using Substring + Hashset
    - TIME : O(NL)
    - SPACE : O(NL)
- Rabin-Karp: Constant-time Slice Using Rolling Hash
    - TIME : O(N)
    - SPACE : O(N)
- Bit Manipulation: Constant-time Slice Using Bitmask
    - TIME : O(N)
    - SPACE : O(N)

# Code

## Linear-time Slice Using Substring + Hashset

```cpp
class Solution {
public:
    vector<string> findRepeatedDnaSequences(string s) {
        if (s.size() < 10) return vector<string>();
        unordered_map<string, int> seq;

        for(int i = 0; i <= s.size() - 10; i++) {
            string t = s.substr(i, 10);
            seq[t]++;
        }

        vector<string> ret;
        for(auto x : seq) {
            if (x.second > 1) ret.push_back(x.first);
        }
        return ret;
    }
};
```
## Rabin-Karp: Constant-time Slice Using Rolling Hash

```cpp
class Solution {
public:
    vector<string> findRepeatedDnaSequences(string s) {
        int L = 10;
        if (s.size() < L) return vector<string>();

        map<char, int> mp;
        mp['A'] = 0, mp['C'] = 1, mp['G'] = 2, mp['T'] = 3;

        vector<int> seq;
        for(int i = 0; i < s.size(); i++) seq.push_back(mp[s[i]]);

        unordered_set<int> seen;
        unordered_set<string> output;

        int v = 0;
        int base = 4, leftMost = pow(base, L);
        for(int i = 0; i <= seq.size() - L; i++) {
            if (i != 0) {
                v *= base;
                v += seq[i + L - 1];
                v -= seq[i - 1] * leftMost;
            } else {
                for (int j = 0; j < 10; j++) {
                    v *= base;
                    v += seq[j];
                }
            }
            if (seen.find(v) != seen.end()) output.insert(s.substr(i, L));
            else seen.insert(v);
        }
        return vector<string>(output.begin(), output.end());
    }
};
```

## Bit Manipulation: Constant-time Slice Using Bitmask

```cpp
class Solution {
public:
    vector<string> findRepeatedDnaSequences(string s) {
        int L = 10;
        if (s.size() < L) return vector<string>();

        map<char, int> mp;
        mp['A'] = 0, mp['C'] = 1, mp['G'] = 2, mp['T'] = 3;

        map<int, char> unmp;
        unmp[0] = 'A', unmp[1] = 'C', unmp[2] = 'G', unmp[3] = 'T';

        vector<int> seq;
        for(int i = 0; i < s.size(); i++) seq.push_back(mp[s[i]]);

        int bitmask = 0;
        map<int, int> seen;
        for(int i = 0; i <= seq.size() - L; i++) {
            if (i != 0) {
                bitmask <<= 2;
                bitmask |= seq[i + L - 1];
                bitmask &= ~(3 << (L * 2));
            } else {
                for (int j = 0; j < L; j++) {
                    bitmask <<= 2;
                    bitmask |= seq[j];
                }
            }
            seen[bitmask]++;
        }
        vector<string> ans;
        for(auto it : seen) {
            if (it.second > 1) {
                int x = it.first;
                cout << x << endl;
                string t = "";
                for(int i = 0; i < 10; i++) {
                    int k = x & 3;
                    char c = unmp[k];
                    t += c;
                    x >>= 2;
                }
                reverse(t.begin(), t.end());
                ans.push_back(t);
            }
        }
        return ans;
    }
};
```