---
layout: post
title : "Leetcode::problem(11) container with most water"
subtitle: "Leetcode ps medium"
type: "Leetcode medium"
medium: true
ps: true
leetcode: true
text: true
author: "beenpow"
post-header: true
header-img: "https://www.spotebi.com/wp-content/uploads/2019/01/one-day-day-one-workout-motivation-spotebi.jpg"
order: 1
date: "2023-12-22"
---

# Leetcode::Continaer with most water
- [Link : Leetcode::Container with most water](https://leetcode.com/problems/container-with-most-water/description/)

- level : medium

# point
- You are given an integer array 'height' of length 'n'.
- There are n vertical lines drawn such that the two endpoints of the i-th line are (i, 0) and (i, height[i])
- Find two lines that together with the x-axis form a container, such that the container contins the most water

# Design
- There can be two approaches
- Using vector and map is intuitive so I svoled the problem with this first
  - This method can be found after thinking about brtue-force way
	- The logic is simple
	  - When two lines contain water, less height line is always used and we use this method
		- If we have height sorted array, we can iterate from left to right
		- When i-th value is used, left side of it (0 ~ (i-1)th) is not used
		- We only check right side of 'i', because they have taller height than 'i' has.
		- Now we only need to figure out how to find the maximum width
		- To achieve this, we can have 'right side of array' as map which is index-sorted always
 
- Using two pointers is the one faster
  - We use two pointers from the left and right points
	- Then move smaller height point to another direction (left point moves to right, right point moves to left)
	- We caculate the amount of water that two pointers can contain
	- We know that the one point always moves is the smaller one, because otherwise the container's height can not get greater by iterating
	- Also, it is known that we start from 0 and n-1 points which means we have full capacity of width as a start.


# Big O(time)
- using vector and map
  - O(NlogN)
- using two pointers
  - O(N)

# Code

## using vector and map

```cpp
class Solution {
public:
    int maxArea(vector<int>& height) {
        vector<pair<int,int> > v1; // {value, index}
        map<int, int> m1; // m1[index] = value
        for(int i = 0; i < height.size(); i++) {
            v1.push_back({height[i], i});
            m1[i] = height[i];
        }

        sort(v1.begin(), v1.end());

        int ret = -1;
        for(int i = 0; i < v1.size(); i++) {
            int value = v1[i].first;
            int idx = v1[i].second;
            
            // If we are pointing out the same {index, value}, it should be excluded.
            int t1 = ((m1.begin()->first  == idx) ? -1 : abs(idx - m1.begin()->first));
            int t2 = ((m1.rbegin()->first == idx) ? -1 : abs(idx - m1.rbegin()->first));
            ret = max(ret, max(t1, t2) * value);
            
            m1.erase(idx);
        }

        return ret;
    }
};
/*


- 양 변을 선택해야하고, 하나의 변은 무조건 자신의 모든 높이를 사용함.
- 이걸 역이용해서,
- k 번째 변을 잡고,
  - 0 ~ k-1 까지의 변 중 k 번째 변의 높이 이상인 애들과의 값을 구하기
  - k+1 ~ n-1 까지의 변 중 k 번째 변의 높이 이상인 애들과의 값을 구하기

## Faster ##
. 위 과정을 빠르게 진행할 방법이 있을까

. 0 1 2 3 4 5 6 7 8 (index)
. 1 8 6 2 5 4 8 3 7 (value)

. 0 3 7 5 4 2 8 1 6 (index)
. 1 2 3 4 5 6 7 8 8 (value)
 - 1 입장에서보면 그 뒤는 모두 자신보다 큼
 - 따라서 1의 인덱스 0과 가장 큰 차이가 나는 인덱스를 찾으면 '8' 임.
 - 따라서, 1 * (8 - 0) = 8
 
 - 2 입장에서보면 그 뒤는 모두 자신보다 큼
 - 따라서 2의 인덱스 3과 가장 큰 차이가 나는 인덱스를 우측에서 찾으면 되고, 이것은 '8' 임.
 - 따라서 2 * (8 - 3) = 10

 - 3 입장에서보면 그 뒤는 모두 자신보다 큼
 - 따라서 3의 인덱스인 7과 가장 큰 차이가 나는 인덱스를 우측에서 찾으면 되고, 이것은 '1' 임.
 - 3 * (7 - 1) = 18
 
 ...
 
 - 7 입장에서 보면 그 뒤는 모두 자신보다 큼
 - 따라서 7의 인덱스 8과 가장 큰 차이가 나는 인덱스를 우측에서 찾으면 되고, 이것은 '1' 임.
 - 7 * (8 - 1) = 49

위 과정을 요약해보면,,,,,
index 와 value 의 값이 고정되어 있고 움직이기 않기 때문에 이걸 패턴화 시킬 수 있을것 같음.
근데 문제는, 어떤 인덱스는 현재 인덱스보다 낮고, 어떤 인덱스는 현재 인덱스보다 높음.

어차피 우측에서만 찾고, 우측방향으로 looping을 해가니까 이걸 두 구역으로 나누는건 어떨까

base 1 : {value, index} 로 sorting 된 vector :: vector<pair<int,int> > v1 // {value, index}
base 2 : {index, value} 로 sorting 된 map    :: map<int> m1 // m1[index] = value

. iterating v1
    . v1[i] = {value, index}
    . t1 = abs(index - m1.back().first)
    . t2 = abs(index - m1.begin().first)
    . calc = value * max(t1, t2)
    . m1.erase({index, value})


. | 0 3 7 5 4 2 8 1 6 (index)
. | 1 2 3 4 5 6 7 8 8 (value)

. 0 | 3 7 5 4 2 8 1 6 (index)
. 1 | 2 3 4 5 6 7 8 8 (value)
  ^

. 0 3 | 7 5 4 2 8 1 6 (index)
. 1 2 | 3 4 5 6 7 8 8 (value)
    ^

. 0 3 7 | 5 4 2 8 1 6 (index)
. 1 2 3 | 4 5 6 7 8 8 (value)
      ^

. 0 3 7 5 | 4 2 8 1 6 (index)
. 1 2 3 4 | 5 6 7 8 8 (value)
        ^

...

. 0 3 7 5 4 2 8 | 1 6 (index)
. 1 2 3 4 5 6 7 | 8 8 (value)

*/
```

## using two pointers

```cpp
class Solution {
public:
    int maxArea(vector<int>& height) {
        int le = 0, ri = height.size() - 1;
        int ret = 0;
        while(le < ri) {
            ret = max(ret, (ri - le) * min(height[le], height[ri]));
            if (height[le] <= height[ri]) le++;
            else ri--;
        }
        return ret;
    }
};
```
