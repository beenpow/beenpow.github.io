---
layout: post
title : "Leetcode::problem all oone data structure"
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
date: "2026-01-02"
---

# Leetcode::all oone data structure
- [Link : Leetcode:all oone data structure](https://leetcode.com/problems/all-oone-data-structure)
- Solved, algorithm 150
- level : hard

# Problem Description
- Design a data structure to store the strings' count with the ability to return the strings with minimum and maximum counts.
    - AllOne()
    - inc(String key)
    - dec(String key)
    - getMaxKey()
    - getMinKey()
- Note that each function must run in O(1) average time complexity.

# How to solve
- I tried to solve just 'swapping' on a vector.
  - But to find the right place after dec or inc operation, it would take O(N) time.
- To solve this problem, and make the 'swapping' operation or 'finding the right place' operation in O(1) time, we need to used a doubly linked list.
- When a key is inc or dec, we find if they exists on the linked list in O(1) time with unordered_map.
- If it exists, we find the node that includes this key in O(1) time and do the operation in O(1) time.
- Because we store the node that has the key, it's not hard to find the right node.
- Then we do operation like, decrease or increase the frequency.
- Since each node has it's own frequency, to do the operations, we need to create a new node with the frequency + 1 or frequency - 1.
- Of course, if there exist such node with the frequency + 1 or frequency - 1, we just need to insert the key to the node and update the map.
- After coming up with this idea, all we need to do is inserting or deleting nodes carefully.
- Often, it makes a double free error, or memory leak error.
- This problem is a good example of storing a frequency on a linked list.
- Because this can not be done with only maps.

# Big O (Time, Space)
- TIME on each operation : O(1)
- SPACE : O(N)

# Code

```cpp
class AllOne {
    class Node {
        public:
            int freq;
            Node* prev;
            Node* next;
            unordered_set<string> keys;
            Node(int _freq) : freq(_freq) {
                prev = next = nullptr;
            }
    };
public:
    Node* head;
    Node* tail;
    unordered_map<string, Node*> map;

    AllOne() {
        head = new Node(-1);
        tail = new Node(5 * 10000 + 9);
        head->next = tail;
        tail->prev = head;
    }
    
    void inc(string key) {
        if (map.find(key) != map.end()) {
            Node* curNode = map[key];
            curNode->keys.erase(key);
            int freq = curNode->freq;
            // 1. create a new node with freq + 1
            if (curNode->next == tail || curNode->next->freq != freq + 1) {
                Node* newNode = new Node(freq + 1);
                
                newNode->prev = curNode;
                newNode->next = curNode->next;

                curNode->next->prev = newNode;
                curNode->next = newNode;

                newNode->keys.insert(key);
                map[key] = newNode;
            }
            // 2. freq + 1 node exists
            else {
                curNode->next->keys.insert(key);
                map[key] = curNode->next;
            }
            
            // delete curNode
            if (curNode->keys.empty()) {
                removeNode(curNode);
            }
        } else {
            Node* curNode = head->next;
            // 1. create a new node with freq 1
            if (curNode == tail || curNode->freq > 1) {
                Node* newNode = new Node(1);

                head->next = newNode;
                newNode->prev = head;

                newNode->next = curNode;
                curNode->prev = newNode;

                newNode->keys.insert(key);
                map[key] = newNode;     
            } 
            // 2. freq 1 Node exists
            else {
                curNode->keys.insert(key);
                map[key] = curNode;
            }
        }
    }
    
    void dec(string key) {
        if (map.find(key) == map.end()) {
            // ERROR
        } else {
            Node* curNode = map[key];
            curNode->keys.erase(key);
            int freq = curNode->freq;
            if (freq == 1) {
                map.erase(key);
            }
            else {
                // 1. Create a new Node with freq - 1
                if (curNode->prev == head || curNode->prev->freq != freq - 1) {
                    Node* newNode = new Node(freq - 1);

                    newNode->prev = curNode->prev;
                    newNode->next = curNode;

                    curNode->prev->next = newNode;
                    curNode->prev = newNode;

                    newNode->keys.insert(key);
                    map[key] = newNode;
                }
                // 2. freq - 1 Node exists
                else {
                    curNode->prev->keys.insert(key);
                    map[key] = curNode->prev;
                }
            }
            
            if (curNode->keys.empty()) {
                removeNode(curNode);
            }
        }
    }
    
    string getMaxKey() {
        if (head->next == tail) return "";
        return *(tail->prev->keys.begin());
    }
    
    string getMinKey() {
        if (head->next == tail) return "";
        return *(head->next->keys.begin());
    }
    // curNode is neither head or tail.
    void removeNode(Node* curNode) {
        curNode->prev->next = curNode->next;
        curNode->next->prev = curNode->prev;

        delete curNode;
    }
};

/**
 * Your AllOne object will be instantiated and called as such:
 * AllOne* obj = new AllOne();
 * obj->inc(key);
 * obj->dec(key);
 * string param_3 = obj->getMaxKey();
 * string param_4 = obj->getMinKey();
 */
```