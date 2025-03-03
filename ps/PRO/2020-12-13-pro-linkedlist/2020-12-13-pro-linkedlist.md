---
layout: post
title : "Pro::LinkedList"
subtitle: "professional algorithm"
type: "professional"
ps: true
pro: true                                       
text: true
author: "beenpow"
post-header: true
header-img: ""
order: 1
date: "2020-12-13"
---

# LinkedList 정의

```

## Chaining Hash ( with Linked List )

- B형의 경우 문제설명에 최대로 필요한 리스트의 길이가 주어진다고 하니, 아래 방법이 매우 효율적일
  것이라 생각합니다.

- HEAD와 TAIL은 아래와 같이 포함됩니다.
```cpp

table  ----------------------------------------------------
index | 0  | 1  | 2 | 3  | 4 | 5  | 6    | 7 |...|HEAD|TAIL|
val   | 5  | 16 | 2 | 77 | 8 | 12 | 9    |   |...| N/A| N/A|
prev  |HEAD| 0  | 1 | 2  | 3 | 4  | 5    |   |...| -1 |  6 |
next  | 1  | 2  | 3 | 4  | 5 | 6  | TAIL |   |...|  0 | -1 |
       ----------------------------------------------------

HEAD <--> 5 <--> 16 <--> 2 <--> 77 <--> 8 <--> 12 <--> 9 <--> TAIL

```


```cpp
#include <stdio.h>
#include <algorithm>
#include <list>
//#include "Windows.h"
#include <time.h>
using namespace std;

struct NODE {
    int prev;
    int next;
    int val;
};

const int NODE_SIZE = 30000;

//TEST CMD
const int PUSH_BACK = 0;
const int PUSH_FRONT = 1;
const int INSERT = 2;
const int POP_BACK = 3;
const int POP_FRONT = 4;
const int ERASE = 5;

int test_cmd[NODE_SIZE][3];

struct MY_LIST {
    int HEAD = NODE_SIZE;
    int TAIL = NODE_SIZE + 1;
    int pos;
    NODE node[NODE_SIZE + 2];

    MY_LIST() {
        pos = 0;
        node[HEAD].next = TAIL;
        node[TAIL].prev = HEAD;
    }

    void push_back(int data) {
        int prev = node[TAIL].prev;
        int next = node[prev].next; // TAIL;

        node[pos].val = data;

        node[pos].prev = prev;
        node[prev].next = pos;

        node[pos].next = next;
        node[next].prev = pos;
        ++pos;
    }

    void push_front(int data) {
        int next = node[HEAD].next;
        int prev = node[next].prev; // HEAD

        node[pos].val = data;

        node[pos].prev = prev;
        node[prev].next = pos;

        node[pos].next = next;
        node[next].prev = pos;
        ++pos;
    }

    void insert(int p, int data) {
        int next = node[HEAD].next;
        for(int i = 0; i < p; ++i) {
            next = node[next].next;
        }
        int prev = node[next].prev;

        node[pos].val = data;

        node[pos].prev = prev;
        node[prev].next = pos;

        node[pos].next = next;
        node[next].prev = pos;
        ++pos;
    }

    void pop_back() {
        int target = node[TAIL].prev;

        int prev = node[target].prev;
        int next = node[target].next;

        node[prev].next = next;
        node[next].prev = prev;
    }

    void pop_front() {
        int target = node[HEAD].next;

        int prev = node[target].prev;
        int next = node[target].next;

        node[prev].next = next;
        node[next].prev = prev;
    }

    void erase(int p) {
        int target = node[HEAD].next;
        for (int i = 0; i < p; ++i) {
            target = node[target].next;
        }
        int prev = node[target].prev;
        int next = node[target].next;

        node[prev].next = next;
        node[next].prev = prev;
    }
};

MY_LIST my_list;
list<int> stl_list;

int main()
{
    // make test case..
    int cur_size = 0;
    for (int i = 0; i < NODE_SIZE; ++i) {
        if (i < NODE_SIZE / 3) {
            test_cmd[i][0] = rand() % 2;
        }
        else {
            test_cmd[i][0] = rand() % 6;
        }

        switch (test_cmd[i][0]) {
        case PUSH_BACK:
        case PUSH_FRONT: {
            test_cmd[i][1] = rand();
            ++cur_size;
            break;
        }
        case INSERT: {
            test_cmd[i][1] = rand() % cur_size;
            test_cmd[i][2] = rand();
            ++cur_size;
            break;
        }
        case POP_BACK:
        case POP_FRONT: {
            --cur_size;
            break;
        }
        case ERASE: {
            test_cmd[i][1] = rand() % cur_size;
            --cur_size;
            break;
        }
        }
    }

    // test my list
    clock_t my_list_begin = clock();
    for (int i = 0; i < NODE_SIZE; ++i) {
        switch (test_cmd[i][0]) {
        case PUSH_BACK: {
            my_list.push_back(test_cmd[i][1]);
            break;
        }
        case PUSH_FRONT: {
            my_list.push_front(test_cmd[i][1]);
            break;
        }
        case INSERT: {
            my_list.insert(test_cmd[i][1], test_cmd[i][2]);
            break;
        }

        case POP_BACK: {
            my_list.pop_back();
            break;
        }
        case POP_FRONT: {
            my_list.pop_front();
            break;
        }
        case ERASE: {
            my_list.erase(test_cmd[i][1]);
            break;
        }
        }
    }
    clock_t my_list_end = clock();

    // test stl list
    clock_t stl_list_begin = clock();
    for (int i = 0; i < NODE_SIZE; ++i) {
        switch (test_cmd[i][0]) {
        case PUSH_BACK: {
            stl_list.push_back(test_cmd[i][1]);
            break;
        }
        case PUSH_FRONT: {
            stl_list.push_front(test_cmd[i][1]);
            break;
        }
        case INSERT: {
            list<int>::iterator it = stl_list.begin();
            for (int k = 0; k < test_cmd[i][1]; ++k) {
                ++it;
            }
            stl_list.insert(it, test_cmd[i][2]);
            break;
        }

        case POP_BACK: {
            stl_list.pop_back();
            break;
        }
        case POP_FRONT: {
            stl_list.pop_front();
            break;
        }
        case ERASE: {
            list<int>::iterator it = stl_list.begin();
            for (int k = 0; k < test_cmd[i][1]; ++k) {
                ++it;
            }
            stl_list.erase(it);
            break;
        }
        }
    }
    clock_t stl_list_end = clock();

    //time compare
    printf("my list : %d\n", (my_list_end - my_list_begin));
    printf("stl list : %d\n", (stl_list_end - stl_list_begin));

    //result test
    list<int>::iterator it = stl_list.begin();
    int cur = my_list.node[my_list.HEAD].next;
    while (it != stl_list.end()) {
        if (*it != my_list.node[cur].val) {
            printf("Error\n");
        }
        ++it;
        cur = my_list.node[cur].next;
    }

    return 0;
}
```

