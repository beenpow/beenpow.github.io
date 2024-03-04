---
layout: post
title : "Leetcode::problem(4) Median of Two Sorted Arrays"
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
date: "2023-06-28"
---

# Leetcode::Median of Two Sorted Arrays
- [Link : Leetcode::Median of Two Sorted Arrays](https://leetcode.com/problems/median-of-two-sorted-arrays/description/?envType=study-plan-v2&envId=apple-spring-23-high-frequency)

- level : hard
- failed. Took 4 hrs to understand Approach 2 and 3 from editorial

# point
- Two sorted arrays are given
- Find the median of the two sorted arrays in O(log(m + n))

# Design
- It took quite a while to fully understand of approach 2 and 3, so I want to make it worth to remember

## Approach 2
- We can solve this problem by finding k-th number with the two sorted arrays
- To find the k-th number, we use the way of excluding numbers from the smallest.
- Let's say that we have sorted arrays as A and B
  - aMid is the middle index of A
  - bMid is the middle index of B
  - aMidV is A[aMid], bMidV is B[bMid]
- Now we compare Mid points with k, like below
- if (aMid + bMid < k)
  - if (aMidV <= bMid)
    - It means the left side of A numbers are less than or equal to the left side of B numbers
    - Also, count of left side numbers of A is less than A, we can exclude this left side of A obviously
    - Because, there's no k-th number in the left side of A
  - else
    - It means the left side of B numbers are less than or equal to the left side of A numbers
    - Also, count of left side numbers of B is less than B, we can exclude this left side of B obviously
    - Because, there's no k-th number in the left side of B
- else
  - if (aMidV <= bMidV)
    - It means that we don't need right side of B, since we already have more then k numbers on left side of A and B.
    - Which means, k-th number can be in 1)left side of A 2)left side of B 3) right side of A
  - else

- I bet now you get the idea of it.
- Here's a simple way to summarize
  - We split each array into two parts (left and right)
  - Now we have 4 parts
  - By finding k-th number, there's always a way to throw away one of the 4 parts

## Approach 3
- This approach use binary search as well
- Let's say that we have sorted arrays A and B
  - We have partionA, which can be referred as 'mid' of using binary search
  - partionB = (n + m + 1)/2 - partionA
  - It took some time to understand above one line of code or the drawing on the editorial
- We defined partionA and partionB
- Now we can have 4 parts as left, right side of each array
  - Let's say 
    - maxLeftA = A[partionA-1]
    - minRightA = A[partionA]
    - maxLeftB = B[partionB-1]
    - minRightB = B[partionB]
- With this approach, we have to aseemble smallest half and larger half
  - Smallest half is a list of A_left and B_left
  - Largest half is a list of A_right and B_right
- The thing is that the size of 'Smallest half'
- We intentionally make it's length as (n + m + 1) / 2, because this index will point out the 'median' of two sorted arrays
  - Smallest half(A_left, B_left) < Larger half(A_right, B_right)
  - If the size of Smallest half is (n + m + 1) / 2, the last member of Smallest half will be the 'median' that we are looking for.
- In a nutshell,
  - Because we intentionally keep defining smallest half's size as (n + m + 1) / 2,
  - All we need to do is finding 4 parts that can be re-assembled as 'smallest half'(with A_left and B_left) and 'larger half'(with A_Right and B_Right)



# Big O(time)
- O(log(n x m )) with Approach 2
- O(log(min(n, m)) with Approach 3

# Code

## Approach 2 : O(log(n x m ))

```cpp
class Solution {
public:
    int bs(vector<int> A, vector<int> B, int k, int aStart, int aEnd, int bStart, int bEnd) {
        // [ section A ] [ section B ]
        //                   ^
        //                   k
        // aStart is the last index of A (= A.size() - 1). x is the point of k in B
        // k = aStart + x -> x = k - aStart
        if (aStart > aEnd) {
            return B[k - aStart];
        }

        // [ section B ] [ section A ]
        if (bStart > bEnd) {
            return A[k - bStart];
        }

        int aMid = (aStart + aEnd) / 2, bMid = (bStart + bEnd) / 2;
        int aMidV = A[aMid], bMidV = B[bMid];

        if (aMid + bMid < k) {
            // aMid < k -> no need of left side of A
            if (aMidV <= bMidV) {
                return bs(A, B, k, aMid + 1, aEnd, bStart, bEnd);
            }
            // bMid < k -> no need of left side of B
            else {
                return bs(A, B, k, aStart, aEnd, bMid + 1, bEnd);
            }
        }
        // aMid + bMid >= k
        else {
            // no chance of having k'th on B_right side
            if (aMidV <= bMidV) {
                return bs(A, B, k, aStart, aEnd, bStart, bMid - 1);
            }
            // no chance of having k'th on A_right side
            else {
                return bs(A, B, k, aStart, aMid - 1, bStart, bEnd);
            }
        }
    }
    double findMedianSortedArrays(vector<int>& nums1, vector<int>& nums2) {
        int n1 = nums1.size(), n2 = nums2.size();
        int n = n1 + n2;
        
        if (n % 2 == 1) {
            return bs(nums1, nums2, n/2, 0, n1 - 1, 0, n2 - 1);
        }
        else {
            return (double)(bs(nums1, nums2, n/2, 0, n1 - 1, 0, n2 - 1) + bs(nums1, nums2, n/2 - 1, 0, n1 - 1, 0, n2 - 1)) / 2;
        }
    }
};
```

## Approach 3 : O(log(min(n, m)))

```cpp
class Solution {
public:
    double findMedianSortedArrays(vector<int>& A, vector<int>& B) {
        int m = A.size(), n = B.size();
        if (m > n) return findMedianSortedArrays(B, A);

        int left = 0, right = m;
        while(left <= right) {
            int partionA = (left + right) / 2;
            int partionB = (n + m + 1) / 2 - partionA;

            int maxLeftA  = (partionA == 0 ? -1e7 : A[partionA - 1]);
            int minRightA = (partionA == m ? +1e7 : A[partionA]);
            int maxLeftB  = (partionB == 0 ? -1e7 : B[partionB - 1]);
            int minRightB = (partionB == n ? +1e7 : B[partionB]);

            if (maxLeftA <= minRightB && maxLeftB <= minRightA) {
                if ((n + m) % 2 == 0) {
                    return (double)(max(maxLeftA, maxLeftB) + min(minRightA, minRightB)) / 2.0;
                } else {
                    return max(maxLeftA, maxLeftB);
                }
            }
            else if (maxLeftA > minRightB) {
                right = partionA - 1;
            }
            else if (maxLeftB > minRightA) {
                left = partionA + 1;
            }
            else {
                // nothing can get here
                exit(1);
            }
        }
        return 0.0;
    }
};
```
