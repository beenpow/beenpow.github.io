---
layout: post
title : "Leetcode::problem(1125) Smallest Sufficient Team"
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
date: "2024-04-20"
---

# Leetcode::Smallest Sufficient Team
- [Link : Leetcode::Smallest Sufficient Team](https://leetcode.com/problems/smallest-sufficient-team/description/)

- level : hard
- Tried for 150m, solved by referring to Edit

# point
- You are given a list of required skills 'req_skills' and a list of people
- i-th person, people[i] contains a list of skills that the person has.
- Consider a sufficient team: a set of people such that for every requried skill in req_skills, there is at least one person in the team who has that skill
- Return any sufficient team of the smallest possible size, represented by the index of each person.

# Design
- If we think about this problem as DP, we would think below ways
  - In each dfs, have this person or not
	- So, we would have 2^60 as time complexity which will cause TLE.
	- Since there's no way to re-use pre-calculated result of previous dfs, we can not solve the problem with this approach.

- Now we have bitmask dynamic programming approach, make sure what makes this approach acceptable in a time complexity manner.
- Let's define dp as below
- DP[bitmask] = people list
  - Let me explain it
	- We've got at most 16 skills and 60 people
	- It's possible to to use each bit as a ticker of each skill
	- For example, if bitmask = 0101 -> Which means, it's a skill set of first and third skill
	- Basically, bitmask is a set of skills
	- Let's look at 'people list' part
	- Since we have at most 60 people, it's possible to make each person as a bit by using long long (64 bits)
- There can be many people list to make DP[bitmask] has smallest count of bits of 'people list'.
- But we are making sure that bit count of 'people list' to be minimal
- Now we are ready to do bottom-up dynamic programming
- We will use two nested loops,
	  - for (int bitmastk = 1; bitmask != (1 << m); bitmask++)
		  - for (int i = 0; i < n; i++)
- It means that, for every skill set, we find smallest bit count of DP[bitmask], which means
  - a less number of people to make the skill set (bitmask)
- The thing we have to understand surely is this.
- DP[bitmask] is set by iterating people list. And that is done for 'bitmask' of DP.
- And this will be only used as 'excludingMe' bit from next skill set which is greater than 'bitmask'.
  - The reason why this part was confusing is that we are not sure if DP[i] is called and used as increasing order.
  - I'm saying that it is called as an order of increaing.


# Big O(time)
- Time : (2^16) * 60 -> (2^m) * n
- Space : O(N)

# Code

```cpp
class Solution {
public:
    vector<int> smallestSufficientTeam(vector<string>& req_skills, vector<vector<string>>& people) {
        int n = people.size(), m = req_skills.size();
        map<string, int> skills;
        for(int i = 0; i < m; i++)
            skills[req_skills[i]] = i;
        
        vector<int> personHave(n, 0);
        for(int i = 0; i < n; i++) {
            int skillset = 0;
            for(int j = 0; j < people[i].size(); j++) {
                if (skills.find(people[i][j]) == skills.end()) continue;
                int id = skills[people[i][j]];
                skillset |= (1 << id);
            }
            personHave[i] = skillset;
        }

        vector<long long> DP((1 << m), (1LL << n) - 1);
        DP[0] = 0;

        for (int bitmask = 1; bitmask != (1 << m); bitmask++) {
            for (int i = 0; i < n; i++) {
                int excludingMe = bitmask & ( ~ personHave[i] );
                if (excludingMe == bitmask) continue;

                long long newPeople = DP[excludingMe] | (1LL << i);
                if (__builtin_popcountll(DP[bitmask]) > __builtin_popcountll(newPeople)) {
                    DP[bitmask] = newPeople;
                }
            }
        }

        vector<int> ans;
        int bitmask = (1 << m) - 1;
        long long ppl = DP[bitmask];
        for(int i = 0; i < n; i++) {
            if (ppl & (1LL << i)) {
                ans.push_back(i);
            }
        }
        return ans;
    }
};
```
