---
layout: post
title : "Leetcode::problem design in memory file system"
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
date: "2026-01-05"
---

# Leetcode::design in memory file system
- [Link : Leetcode:design in memory file system](https://leetcode.com/problems/design-in-memory-file-system)
- Solved, 10 20 20 4 5
- level : hard

# Problem Description
- Design a data structure that simulates an in-memory file system.
    - FileSystem()
    - List<String> ls(String path)
    - void mkdir(String path)
    - void addContentToFile(String filePath, String content)
    - String readContentFromFile(String filePath)

# How to solve
- By utilizing tree structure, we can solve this problem wisely.
- At first we need a Node class to indicate a File or a Directory.
- Also, we put a root Node(for '/') as a root.
- With proper members of a Node such as name, children, isFile, content we can handle tree structure.
- Especially with children, we refer it's children (files, directories).
- The tree structure I used is quite similar with the structure for Trie.

# Big O (Time, Space)
- TIME: O(300 * 100 * 300)
    - Maximum filePath.length is 100.
    - At most 300 calls will be made to ls, mkdir, addContentToFile, and readContentFromFile.
    - A directoy can have at most 300 files or directories.
- SPACE: O(100 * 300)

# Code

```cpp
class FileSystem {
public:
#define DIR 0
#define FILE 1
    class Node {
        public:
            bool isFile;
            string name;
            map<string, Node*> children;
            string content;
            Node(bool _isFile, string _name) : isFile(_isFile), name(_name) {
                children.clear();
                content = "";
            }
    };
    vector<string> parse(string path) {
        vector<string> ret;
        int i = 0;
        string tmp = "";
        while(i < path.size()) {
            if (path[i] == '/') {
                if (tmp != "") ret.push_back(tmp);
                tmp = "";
            } else {
                tmp += path[i];
            }
            i += 1;
        }
        if (tmp != "") ret.push_back(tmp);
        return ret;
    }

    Node* root;
    FileSystem() {
        root = new Node(DIR, "root");
    }
    
    vector<string> ls(string path) {
        vector<string> tree = parse(path);
        Node* curr = root;
        for(auto x : tree) {
            curr = curr->children[x];
        }

        vector<string> ret;
        if (curr->isFile) {
            ret.push_back(curr->name);
        } else {
            for(auto it = curr->children.begin(); it != curr->children.end(); it++) {
                ret.push_back(it->first);
            }
        }
        return ret;
    }
    
    void mkdir(string path) {
        vector<string> tree = parse(path);
        Node* curr = root;
        for(auto x : tree) {
            if (curr->children.find(x) == curr->children.end()) {
                Node* newNode = new Node(DIR, x);
                curr->children[x] = newNode;
            }
            curr = curr->children[x];
        }
    }
    
    void addContentToFile(string filePath, string content) {
        vector<string> tree = parse(filePath);
        Node* curr = root;
        string fileName = "";
        for(auto x : tree) {
            if (x != tree.back()) {
                curr = curr->children[x];
            } else fileName = x;
        }
        if (curr->children.find(fileName) == curr->children.end()) {
            Node* newNode = new Node(FILE, fileName);
            curr->children[fileName] = newNode;
        }
        Node* fileNode = curr->children[fileName];
        fileNode->content += content;
    }
    
    string readContentFromFile(string filePath) {
        vector<string> tree = parse(filePath);
        Node* curr = root;
        string fileName = "";
        for(auto x : tree) {
            curr = curr->children[x];
        }
        string ret = curr->content;
        return ret;
    }
};

/**
 * Your FileSystem object will be instantiated and called as such:
 * FileSystem* obj = new FileSystem();
 * vector<string> param_1 = obj->ls(path);
 * obj->mkdir(path);
 * obj->addContentToFile(filePath,content);
 * string param_4 = obj->readContentFromFile(filePath);
 */
```