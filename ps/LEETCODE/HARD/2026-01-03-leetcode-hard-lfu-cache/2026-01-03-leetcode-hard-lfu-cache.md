---
layout: post
title : "Leetcode::problem lfu cache"
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
date: "2026-01-03"
---

# Leetcode::lfu cache
- [Link : Leetcode:lfu cache](https://leetcode.com/problems/lfu-cache)
- Solved, 10 30 10 32 130
- level : hard

# Problem Description
- Design and implement a data structure for a Least Frequently Used (LFU) cache.
- Implement the LFUCache class:
    - LFUCache(int capacity) Initializes the object with the capacity of the data structure.
    - int get(int key) Gets the value of the key if the key exists in the cache. Otherwise, returns -1.
    - void put(int key, int value) Update the value of the key if present, or inserts the key if not already present. When the cache reaches its capacity, it should invalidate and remove the least frequently used key before inserting a new item. For this problem, when there is a tie (i.e., two or more keys with the same frequency), the least recently used key would be invalidated.
- To determine the least frequently used key, a use counter is maintained for each key in the cache. The key with the smallest use counter is the least frequently used key.

- When a key is first inserted into the cache, its use counter is set to 1 (due to the put operation). The use counter for a key in the cache is incremented either a get or put operation is called on it.
- The functions get and put must each run in O(1) average time complexity.

# How to solve
- I sovled with double linked list and it took some time because I manually created a Node class and connect them.
- However, there exists a simpler solution with hash map and a list.
- Let me introduce both solutions.
- With hash map and a list
    - If we neatly create two hash maps we can solve this problem.
    - But it is hard to come up with such hash maps.
        - unordered_map<int, list<pair,int,int> > > frequencies;
        - unordered_map<int, pair<int, list<pair<int,int> >::iterator> > cache;
    - The actual key and value exists in the list of frequencies.
    - Cache has a iterator to the list of frequencies.
    - Because we can access and erase a element in a list in O(1) time, we can solve this problem in O(1) time with above hash maps.
    - Specifically, frequencies is like a bucket with a frequency as a key.
    - We put every key and value pair in the list of frequencies, and if the frequency is changed, we just need to erase the element and insert it to the next frequency bucket.
- With double linked list
    - It has pretty much same idea with the hash map and a list.
    - For the frequency bucket, I created a Node class.
    - So, each node represents a frequency bucket and it includes deque to handle the erase operation.
    - We know which one pushed first so that we can delete the least recently used key.
    - To achieve this, I utilized 'while' iteration to delete the elements who already changed their frequency bucket and the actual one that will be deleted.
    - This lazy behavior takes O(N) for the total, so it can be devided into O(1) as average.
    - But if we have to achieve O(1) worst-case for each operation, this lazy behavior can not be used.
    - We have to find out better solution like above.
    - However, this solution is accepted which means the system doesn't check if the worst case of each operation takes O(1) or not.

# Big O (Time, Space)
- With hash map and a list
    - TIME : O(1) for get and put
    - SPACE : O(N) for the hash map and the list
- With double linked list
    - TIME : O(1) for get and put
    - SPACE : O(N) for the hash map and the double linked list

# Code

## With hash map and a list
```cpp
class LFUCache {
public:
    int cap;
    int minf;
    unordered_map<int, list<pair<int,int>>> frequencies;
    unordered_map<int, pair<int, list<pair<int,int>>::iterator>> cache;

    void insert(int key, int freq, int value) {
        frequencies[freq].push_back({key, value});
        cache[key].first = freq;
        cache[key].second = --frequencies[freq].end();
    }

    LFUCache(int capacity) {
        cap = capacity;
        minf = 0;
        frequencies.clear();
        cache.clear();
    }
    
    int get(int key) {
        auto it = cache.find(key);
        if (it == cache.end()) return -1;

        int freq = it->second.first;
        auto kv = *(it->second.second);
        frequencies[freq].erase(it->second.second);
        if (frequencies[freq].empty()) {
            frequencies.erase(freq);
            
            if (minf == freq) ++minf;
        }

        insert(key, freq + 1, kv.second);
        return kv.second;
    }
    
    void put(int key, int value) {
        if (cap == 0) return;
        auto it = cache.find(key);
        if (it == cache.end()) {
            if (cap == cache.size()) {
                cache.erase(frequencies[minf].front().first);
                frequencies[minf].pop_front();
                if (frequencies[minf].empty()) {
                    frequencies.erase(minf);
                }
            }
            minf = 1;
            insert(key, 1, value);
        } else {
            (*cache[key].second).second = value;
            get(key);
        }
    }
};

/**
 * Your LFUCache object will be instantiated and called as such:
 * LFUCache* obj = new LFUCache(capacity);
 * int param_1 = obj->get(key);
 * obj->put(key,value);
 */
```

## With double linked list

```cpp
class LFUCache {
public:
    class Node {
        public:
            int freq;
            Node* prev;
            Node* next;
            unordered_map<int, int> getTimeStamp; // key - lastUsed timestamp.
            unordered_map<int, int> getValue; // key - value
            deque<pair<int, int>> keys; // key, timestamp
            Node(int _freq) : freq(_freq) {
                prev = next = nullptr;
                getValue.clear();
                getTimeStamp.clear();
                keys.clear();
            }
    };
    int cap;
    int tm;
    Node* head;
    Node* tail;
    unordered_map<int, Node*> map;

    LFUCache(int capacity) {
        head = new Node(0);
        tail = new Node(2 * 100000 + 9);
        head->next = tail;
        tail->prev = head;
        map.clear();
        cap = capacity;
        tm = 0;
    }
    
    int get(int key) {
        if (map.find(key) == map.end()) return -1;
        tm += 1;
        Node* curNode = map[key];
        int val = curNode->getValue[key];
        int freq = curNode->freq;
        curNode->getValue.erase(key);
        curNode->getTimeStamp.erase(key);

        // 1. create a new node with freq + 1
        if (curNode->next == tail || curNode->next->freq != freq + 1) {
            Node* newNode = new Node(freq + 1);

            map[key] = newNode;
            newNode->getValue[key] = val;
            newNode->getTimeStamp[key] = tm;
            newNode->keys.push_back({key, tm});

            newNode->prev = curNode;
            newNode->next = curNode->next;

            curNode->next->prev = newNode;
            curNode->next = newNode;
        } 
        // 2. There exists a node with freq + 1
        else {    
            curNode->next->getValue[key] = val;
            curNode->next->getTimeStamp[key] = tm;
            curNode->next->keys.push_back({key, tm});
            map[key] = curNode->next;
        }

        // 3. delete current node if it's empty
        if (curNode->getValue.empty()) {
            removeNode(curNode);
        }

        return val;
    }
    
    void put(int key, int value) {
        tm += 1;
        if(cap == 0) return;
        // Full 일때 가장 작은 freq Node 내에 있는 timeStamp 값이 가장 작은 애를 O(1) 에 추려내야하는데..
        bool needPop = (map.size() == cap) && (map.find(key) == map.end());

        // pop one (least freq (least used))
        if (needPop) {
            Node* curNode = head->next;
            if (curNode != tail) {
                if (!curNode->getValue.empty()) {
                    while(true) {
                        auto x = curNode->keys.front();
                        if (curNode->getValue.find(x.first) == curNode->getValue.end()) {
                            if (curNode->keys.size() == 0) cout << "ERROR1\n";
                            curNode->keys.pop_front();
                        } else {
                            if (x.second != curNode->getTimeStamp[x.first]) {
                                if (curNode->keys.size() == 0) cout << "ERROR2\n";
                                curNode->keys.pop_front();
                            } else {
                                // This is the one to be popped.
                                curNode->getTimeStamp.erase(x.first);
                                curNode->getValue.erase(x.first);
                                map.erase(x.first);
                                break;
                            }
                        }
                    }
                    if (curNode->getTimeStamp.empty()) {
                    removeNode(curNode);
            }
                } else {
                    // ERROR
                    cout << "ERROR\n";
                }
            } else{
                // ERROR
                cout << "ERROR\n";
            }
        }


        Node* curNode = (map.find(key) == map.end() ? head : map[key]);
        int freq = (curNode == head ? 0 : curNode->freq);
        
        if (curNode->next == tail || curNode->next->freq != freq + 1) {
            Node* newNode = new Node(freq + 1);

            map[key] = newNode;
            newNode->getValue[key] = value;
            newNode->getTimeStamp[key] = tm;
            newNode->keys.push_back({key, tm});

            newNode->prev = curNode;
            newNode->next = curNode->next;

            curNode->next->prev = newNode;
            curNode->next = newNode;
        } else {
            curNode->next->getValue[key] = value;
            curNode->next->getTimeStamp[key] = tm;
            curNode->next->keys.push_back({key, tm});
            map[key] = curNode->next;
        }
        if (curNode != head) {
            curNode->getTimeStamp.erase(key);
            curNode->getValue.erase(key);
            if (curNode->getTimeStamp.empty()) {
                removeNode(curNode);
            }
        }
    }

    void removeNode(Node* curNode) {
        curNode->prev->next = curNode->next;
        curNode->next->prev = curNode->prev;

        delete curNode;
    }
};

/**
 * Your LFUCache object will be instantiated and called as such:
 * LFUCache* obj = new LFUCache(capacity);
 * int param_1 = obj->get(key);
 * obj->put(key,value);
 */
```