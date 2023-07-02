---
layout: post
title : "Leetcode::problem(1642) Furthest Building you can reach"
subtitle: "Leetcode ps medium"
type: "Leetcode medium"
medium: true
ps: true
leetcode: true
text: true
author: "beenpow"
post-header: true
header-img: ""https://i.ytimg.com/vi/3EXe5cx5S-0/maxresdefault.jpg
order: 1
date: "2023-07-02"
---

# Leetcode::Furthest building you can reach
- [Link : Leetcode::furthest building you can reach](https://leetcode.com/problems/furthest-building-you-can-reach/description/?envType=study-plan-v2&envId=apple-spring-23-high-frequency)

- level : medium

# point
- Heights of buildings are given with bricks and ladders
- Find the furthest building you can go
- From building i to i + 1,
  - You can get to the i + 1 building only if one of below conditions meet
    - For height[i] >= height[i+1]
      - Nothing to do
    - For height[i] < height[i+1]
      - remained bricks > (height[i+1] - height[i])
      - ladders > 0

# Design
- Approach 2 and 4 are very helpful to understand every edge of this problem, so it's worth to know them all

## Approach 2
- We can solve this problem with a min heap
- We matain top k bricks on this heap ( k == ladders )
- As you can see, this is the list of bricks that is substitued by ladders
- Other bricks are summed and checked if it exceeds the given bricks


## Approach 4
- We can use binary search for this problem
  - Since there a certain point that distinguish 'possible' section and 'impossible' section to reach
- To do this, we have to make O(N) for the checking function if it is possible to get 'target' building
  - Obviously, index of building is the one that we are binary searching
- Making the 'checking function' O(N) is the important part
  - We only need { gap, index } array as sorted once before we do binary search
    - gap is the difference between heights[i+1] and heights[i], only when it's positive integer
    - index is 'i' for above example
  - Then we gotta sort the array
  - Let's call this sorted array as 'sorted array'
- Now we are all set to do checking function, which is 'isPossible' on my code
- We just need to iterate 'sorted array' until we pass the 'target' point
- If the index is over the target, continue
- Otherwise,
  - If we have more bricks then 'gap', use bricks
  - Othewise
    - If we have more ladders to use, use ladder
    - Otherwise, impossible to get to the 'target'

- In a nutshell, we use all bricks first and when we are out of bricks we use ladders
- The reason of doing this way is that we use 'sorted array' in brick size
  - It means, we used our bricks from the smallest bricks, so there's no more of optimization of using bricks


# Big O(time)
- approach 2 : O(NlogN)
- approach 4 : O(NlogN)

# Code

## Approach 2 ( Min heap )

```cpp
// 30m : checked hint
class Solution {
public:
    int furthestBuilding(vector<int>& heights, int bricks, int ladders) {
        priority_queue<int> topK;
        
        int bst = 0, sumBricks = 0;

        for(int i = 0; i < (int) heights.size() - 1; i++) {
            if (heights[i] >= heights[i + 1]) {
                // do nothing
            } else {
                topK.push(-(heights[i + 1] - heights[i]));
                if ((int)topK.size() > ladders) {
                    int top = - topK.top(); topK.pop();
                    if (sumBricks + top > bricks) break;
                    sumBricks += top;
                }
            }

            bst++;
        }
        return bst;
    }
};
```


## Approach 4 ( binary search + sort )

```cpp
class Solution {
public:
    int totBricks, totLadders;
    vector<pair<int,int> > vp;
    bool isPossible(vector<int> heights, int target) {
        int bricks = totBricks, ladders = totLadders;

        for(int i = 0; i < vp.size(); i++) {
            int gap = vp[i].first, id = vp[i].second;
            if (id > target) continue;
            if (bricks >= gap) bricks -= gap;
            else if (ladders > 0) ladders--;
            else return false;
        }
        return true;
    }

    int bs(vector<int> heights, int le, int ri) {
        while(le < ri) {
            int mid = (le + ri) / 2;
            if (isPossible(heights, mid)) {
                le = mid + 1;
            } else ri = mid;
        }
        return ri;
    }

    int furthestBuilding(vector<int>& heights, int bricks, int ladders) {
        totBricks = bricks, totLadders = ladders;
        for(int i = 0; i < heights.size() - 1; i++) {
            int gap = heights[i + 1] - heights[i];
            if (gap <= 0) continue;
            vp.push_back({gap, i});
        }
        sort(vp.begin(), vp.end());
        int mx = bs(heights, 0, heights.size() - 1);
        return mx;
    }
};
```
