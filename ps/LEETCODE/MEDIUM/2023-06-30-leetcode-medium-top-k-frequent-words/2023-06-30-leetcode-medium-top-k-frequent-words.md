---
layout: post
title : "Leetcode::problem(692) Top K Frequent Words"
subtitle: "Leetcode ps medium"
type: "Leetcode medium"
medium: true
ps: true
leetcode: true
text: true
author: "beenpow"
post-header: true
header-img: "https://media.tumblr.com/b425f4f92b7619fe3600a2c746271267/tumblr_inline_mlug83d0oY1qhg0wt.jpg"
order: 1
date: "2023-06-30"
---

# Leetcode::Top K Frequent Words
- [Link : Leetcode::Top K Frequent Words](https://leetcode.com/problems/top-k-frequent-words/description/?envType=study-plan-v2&envId=apple-spring-23-high-frequency)

- level : medium
- This problem can be simply solved with 'map'
- There'a another way to use 'bucket sorting + trie'.
- We have to make sure know both ways

# point
- String vector 'words' and k are given
- Find the answer sorted by the frequency from highest to lowest.
- Sort the words with the same frequency by their lexicographical order

# Design

## just using map
- We can find the top k frequent words by using 'map'
- First of all, we need to add all words into map and counting how many are they
- Now we words from map to vector for sorting, make sure you use the word and count together
- Then we use top 'k' words

## Bucket sorting + Trie
- I usually use bucket sort only for hash map, but this editorial shows us that we can use this idea
- Each bucket has it's frequency
- Let's say there are five buckets (bucket[5])
  - bucket[1] has all words that appears once from the given 'words'
  - bucket[2] has all words that appears twice from the given 'words'.
  - ...
- To put words on the bucket, we use 'Trie'
- Because it only takes O(N) to traverse trie and we can traverse by lexicographical order

# Big O(time)
- Including 'map' part -> O(NlogN)
- Excluding 'map' part
  - Just using map -> O(NlogN)
  - Bucket sorting + trie -> O(N)

# Code

## Bucket sorting + Trie

```cpp
const int ALPHABETS = 26;
int K;
vector<string> ans;

class Solution {
public:
    struct Trie {
        bool terminal;
        Trie* child[ALPHABETS];
        Trie() : terminal(false) {
            for(int i = 0; i < ALPHABETS; i++) child[i] = nullptr;
        }
        void addWord(string str) {
            if (str == "") {terminal = true; return;}
            int nxt = (char)(str[0] - 'a');
            if (child[nxt] == nullptr) child[nxt] = new Trie();
            child[nxt]->addWord(&str[1]);
        }
        void find(string str) {
            if (terminal){
                if (K > 0) {
                    ans.push_back(str);
                    //cout << "STR : " << str << ", K : " << K << '\n';
                    K--;
                }
                // return; // Should not return at here. counterexample : {"a", "aa", "aaa"}
            }
            for (int i = 0; i < ALPHABETS; i++) if(child[i] != nullptr) {
                string s = "";
                s.push_back((char)(i + 'a'));
                child[i]->find(str + s);
            }
        }
        void traverse() {
            for(int i = 0; i < ALPHABETS; i++) if (child[i] != nullptr) {
                string s = "";
                s.push_back((char)(i + 'a'));
                child[i]->find(s);
            }
        }
    };

    vector<string> topKFrequent(vector<string>& words, int k) {
        ans.clear();
        map<string, int> cnt;
        for(auto word : words) cnt[word]++;

        int n = words.size();
        vector<Trie> buckets(n + 1, Trie());

        for(auto it = cnt.begin(); it != cnt.end(); it++) {
            buckets[it->second].addWord(it->first);
        }

        K = k;
        for(int i = n; i >= 0 && k >= 0; i--) {
            buckets[i].traverse();
            if (K == 0) break;
            cout << "i : " << i << '\n';
        }
        return ans;
    }
};
```


## just using map

```cpp
class Solution {
public:
    static bool cmp(const pair<int, string> x, const pair<int, string> y) {
        if (x.first > y.first) return true;
        else if (x.first < y.first) return false;
        else {
            return x.second < y.second;
        }
    }
    vector<string> topKFrequent(vector<string>& words, int k) {
        vector<string> str;
        map<string, int> mp;
        for(auto word : words) {
            mp[word]++;
        }
        vector<pair<int, string> > v;
        for(auto it = mp.begin(); it != mp.end(); it++) {
            v.push_back({it->second, it->first});
        }
        sort(v.begin(), v.end(), cmp);
        for(int i = 0; i < k; i++) str.push_back(v[i].second);
        return str;
    }
};
```
