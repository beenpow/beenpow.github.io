---
layout: post
title : "Leetcode::problem(2402) Meeting Rooms iii (3)"
subtitle: "Leetcode ps hard"
type: "Leetcod hard"
hard: true
ps: true
leetcode: true
text: true
author: "beenpow"
post-header: true
header-img: ""
order: 1
date: "2024-04-03"
---

# Leetcode::Meeting Rooms iii (3)
- [Link : Leetcode::Meeting Rooms iii (3)](https://leetcode.com/problems/meeting-rooms-iii/description/)

- level : hard
- failed for solving
- The reason was messing up with erase/insert of 'map'.
- I should've used priority_queue to ensure not to make any mistakes on erase/insert

# point
- You are given n meeting rooms and meetings
- Each meeting has start and end time
- All start times are unique
- When there are many meeting rooms available, allocate to the smallest indexed room first
- Find the most used room's used time

# Design
- It's a simple implementation problem, but hard to handle race condition
- To treate race condition well, it is recomended to use priority_queue not map (inserting/deleting several times is not good)
- Logic is quite simple
  - meetings should be sorted first with start time for the convenience of iteration
  - While we are on iteration of meetings, 
	  - 1. Flush used meeting rooms if the meetings are ended
		- 2. If there's any room available for current iterated one, allocate it
		- 3. If not, find the earliest end-soon and low index room from usedRooms (This can be done by O(logN) by using priority_queue)

- One more thing ( check below code chunk, what If i put the chunk on the section // 3.  ? )
  - It's not right to pop all the usedRooms even if they have same endTime when the top of usedRooms was popped // 3.
  - Why is that?
	- Since other usedRooms has same end time, aren't we able to pop them all too ?
  - The reason is obvious but hard to notice sometimes
	- Because there can be unusedRooms left for the next iteration, which means we don't need to pop things from usedRooms before it's necessary
	- Let's make an example to clarify the unclarity of this point
	  - Assume that pq is sorted vector
	  - 0. iteration : st[i], en[i]
		  - 1. Checking if there's any room that has less end time than st[i]. -> no rooms available
		  - 2. check the top end time from pq, let's say this is pq[0]
		  - 3. It's abvious pq[0] > st[i], and we use this room for this iteration
		  - 4. Since pq[1] == pq[0], let's pop pq[1] and put it on available rooms list, and the room number is '0'
    - 5. iteration : st[i+1], en[i+1]
		  - 6. Checking if there's any room that has less end time than st[i+1] -> There is one room as room number '1'.
			- 7. Now we have two rooms available { 0, 1 }
			- 8. Is it always okay to use room '0' at this iteration ? -> The answer is no.
			  - We know that below equation holds
				  - st[i] < pq[1] == pq[0], st[i] < st[i+1]
					- Remider : room '0' has come from pq[1]
					- (end time) pq[1] < st[i+1] <-- Is this always true ? -> The answer is no.
					- st[i] --- A --- pq[1] --- B ---
					  - st[i+1] can be in position of either A or B
						- If it's on B, it's great
						- But when it's on A, it means it's counter example of this asumming which was 'It's okay to pop pq[1]'
- In a nutshell, there's no guarantee that the popped one (from 4.) has earlier time than st[i+1].
  - Since it's not true, it should not be popped out from the first place !!


		
```cpp
                while(!usedRooms.empty() && usedRooms.top().first == earliestEndTime) {
                    unUsed.push({usedRooms.top().second});
                    usedRooms.pop();
                }
```



# Big O(time)
- TIME : O(MlogM + MlogN)
- SPACE : O(N)

# Code

```cpp
// Understanding + Algorithm = 38m + 19m (coding)
class Solution {
public:
typedef long long ll;
vector<ll> usedCnt;
    int mostBooked(int n, vector<vector<int>>& meetings) {
        usedCnt = vector<ll>(n, 0);
        sort(meetings.begin(), meetings.end());
        priority_queue<ll, vector<ll>, greater<ll> > unUsed;
        priority_queue<pair<ll, ll>, vector<pair<ll, ll>>, greater<pair<ll, ll> > > usedRooms;
        // key = end time   (multiple),   value = room number

        for(int i = 0; i < n; i++) unUsed.push(i);

        for(auto meet : meetings) {
            ll st = meet.front(), en = meet.back();

            // 1. pull out if there exist meetings ended before 'st'
            
            while(!usedRooms.empty() && usedRooms.top().first <= st) {
                unUsed.push({usedRooms.top().second});
                usedRooms.pop();
            }
            // 2. If there's yes unused rooms left
            if (!unUsed.empty()) {
                // push
                ll roomNumber = unUsed.top();
                unUsed.pop();
                usedRooms.push({en, roomNumber});
                usedCnt[roomNumber]++;
            }
            // 3. If there's no unsued rooms left
            else {
                // pop from ongoing
                ll earliestEndTime = usedRooms.top().first;
                ll roomNumber = usedRooms.top().second;
                usedRooms.pop();
                usedRooms.push({earliestEndTime + (en - st), roomNumber});
                usedCnt[roomNumber]++;
            }
        }
        ll mxId = -1, mxCnt = 0;
        for(int i = 0; i < n; i++) {
            if (usedCnt[i] > mxCnt) {
                mxCnt = usedCnt[i];
                mxId = i;
            }
        }
        return mxId;
    }
};
```
