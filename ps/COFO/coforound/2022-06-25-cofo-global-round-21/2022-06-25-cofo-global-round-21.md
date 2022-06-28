---
layout: post
title : "COFO::Global Round 21"
subtitle: "cofo round"
type: "codeforce div all"
ps: true
cofo: true
round: true
text: true
author: "beenpow"
post-header: true
header-img: "https://www.spotebi.com/wp-content/uploads/2019/01/one-day-day-one-workout-motivation-spotebi.jpg"
order: 1
date: "2022-06-25"
---

# COFO::Global Round #21
- [Link : COFO::Global round 21)](https://codeforces.com/contest/1696)
- solved : 
  - A : 00:10
  - B : 00:32
  - C : pretest passed. But failed on real-test.
    - 모두 ll을 썼는데, 변수 하나에 실수로 int 형으로 선택해서 틀렸습니다.
  - rank : 5978
  - score : 1302

## Problem A : NIT orz!

- level : 800
- tag : bitmasks, greedy

### point
- n, z 을 입력받습니다.
- n개의 원소로 이루어진 배열 a를 받습니다.
- 원하는 만큼의 작업을 통해 배열 a에 포함된 원소의 값을 변형하고, 이 중 최대값을 출력합니다.
- 작업의 내용은 다음과 같습니다.
  - 원소 a[i]를 선택합니다.
  - z 값을 a[i] and z 값으로 대체합니다.
  - a[i] 값을 a[i] or z 값으로 대체합니다.
  - 위 작업은 동시에 이루어집니다.

### Design
- and 와 or를 통해 z값을 계속 바꿔갈 수 있습니다.
- 하지만 결국, z는 and 연산에만 영향을 받기때문에 값이 초기값보다 커질 순 없겠죠.
- 따라서, 초기에 주어진 a[i] 원소 중 z와 or 연산을 해서 가장 큰 값을 고르면 됩니다.


#### Big O(time)
- O(N)

### Code

```cpp
#include<bits/stdc++.h>
#define all(a) a.begin(), a.end()
#define sz(a) (int) a.size()
#define rep(i, a, b) for(int i=(a); i <(b); i++)
#define r_rep(i, a, b) for(int i=(a); i >(b); i--)
typedef long long ll;
using namespace std;

ll n, z;
vector<ll> a;
void solve () {
    cin >> n >> z;
    a.resize(n);
    ll mx = -1;
    rep(i, 0, n) {
        cin >> a[i];
        mx = max(mx, a[i] | z);
    }
    cout << mx << '\n';
}
int main(){
    int tc; cin >>tc;
    while(tc--)
        solve();
    return 0;
}

```

## Problem B : NIT Destroys the Universe

- level : 900
- tag : greedy

### Point
- 길이 n짜리 배열 a가 주어집니다.
- 최소한의 작업을 이용하여 모든 원소를 0으로 만들고, 이때의 작업의 수를 출력합니다.
- 작업은 다음과 같습니다.
  - 범위 l, r 을 정합니다.
  - w = mex({a[l], a[l+1], ..., a[r]}) 을 통해 w를 구하고, 범위 [l:r]에 있는 모든 원소를 w로 대체합니다.
  - mex는 0이상의 가장 작은 수 중 원소에 포함되지 않은 수를 의미합니다.

### Design
- 0으로 만들지 않으면 의미가 없습니다.
- 또한, mex를 구할때 가장 작은 수를 이용하기 때문에 해당 집단에 0의 값이 있는지 없는지만 중요합니다.
- 즉, 1이상의 모든 수는 1로 대체될 수 있습니다.
- 그럼 이제, 배열에는 0과 1만 남았다고 생각해도 됩니다.
- 이제 남은 한 가지 observation만 발견하면 문제를 풀 수 있습니다.
- 정답은 무조건 0 or 1 or 2 이 세 값 중 하나입니다.
- 0이 나오는 경우는, 모든 원소가 처음부터 0인 경우입니다.
- 1이 나오는 경운는, 1의 원소의 나열의 사이에 0이 포함되지 않은 경우입니다.
  - ex) 00000111110000000
  - 1의 집합만 한번에 0으로 만들어주면 되겠죠
- 2가 나오는 경우는 1의 원소의 나열 중 중간에 0이 포함된 경우입니다.
  - ex) 00001110111100000
  - 최초 1이 나온 지점과 마지막 1이 나온 지점까지를 집합으로 잡고 작업을 진행해서,
  - 모든 원소를 2로 만들어줍니다.
  - 이후 동일 집합에 대해 작업을 한번 더 진행하면 모든 원소가 0이 됩니다.

#### Big O(time)
- O(N)

### Code

```cpp
#include<bits/stdc++.h>
#define all(a) a.begin(), a.end()
#define sz(a) (int) a.size()
#define rep(i, a, b) for(int i=(a); i <(b); i++)
#define r_rep(i, a, b) for(int i=(a); i >(b); i--)
typedef long long ll;
using namespace std;

int n;
vector<ll> a;
int solve () {
    a.clear();
    cin >> n;
    a.resize(n);
    rep(i, 0, n) cin >> a[i];
    int st = 0, en = n-1;
    rep(i, 0, n) {
        if (a[i] == 0) st++;
        else break;
    }
    r_rep(i, n-1, -1) {
        if (a[i] == 0) en--;
        else break;
    }
    if (st > en) return 0;
    int ans = 1;
    bool started = false;
    rep(i, st, en + 1) {
        if (a[i] == 0) {
            if (!started) {
                started = true;
                ans ++;
            }
        } else {
            if (started) {
                started = false;
            }
        }
    }
    if(ans > 1) return 2;
    else return 1;
}
int main(){
    int tc; cin >>tc;
    while(tc--)
        cout << solve() << '\n';
    return 0;
}

```

## Problem C : Fishingprince Plays With Array

- level : 1400
- tag : constructive algorithms, greedy, implementation

### Point
- 길이 n짜리 배열 a와 길이 k짜리 배열 b 그리고 m이 주어집니다.
- a에 원하는 만큼의 작업을 진행해서 배열 b로 바꿀 수 있는지 여부를 출력합니다.
- 작업은 다음과 같습니다.
  - 작업 1
    - a[i]를 선택합니다.
    - a[i]가 m으로 나눠져야 하고, a[i]를 a[i]/m m개로 바꿉니다. 
  - 작업 2
    - a[i]를 선택합니다.
    - a[i], a[i+1], ..., a[i+m-1] 이 모두 같은 값이어햐합니다.
    - 위 원소들을 a[i] * m으로 대체합니다.

### Design
- observation을 얻기까지 많은 시간이 소모되었습니다.
- a와 b를 비교하며 필요할때마다 작업 1과 작업 2를 naive하게 반복하면 TLE가 되도록 만들어진 문제입니다.
- 따라서, 다음과 같은 방법을 사용해야합니다.
- 배열 a의 모든 원소를 작업 1로만 이용해서 모두 분해합니다.
- 그리고 앞에서부터 연속적으로 이 원소들을 저장해둡니다.
- 예를 들어, m = 2 이고 배열 a가 12, 8, 4 라고 하면,
  - [12, 8, 4] -> [6, 6, 4, 4, 2, 2] -> [3, 3, 2, 2, 2, 2, 1, 1, 1, 1]
  - 따라서, 3이 2개, 2가 4개, 1이 4개 인 순서대로 저장해줍니다.
- 그리고, b와 비교하며, b와 a의 원소가 맞지않을때마다 b도 분해해줍니다.
- 혹은 처음부터 b도 미리 분해하고 이 값들만 비교해줘도 됩니다.

#### Big O(time)
- O (n * max(30))
  - m = 2 인경우 복잡도가 최대가 됩니다.

### Code

```cpp
#include<bits/stdc++.h>
#define all(a) a.begin(), a.end()
#define sz(a) (int) a.size()
#define rep(i, a, b) for(int i=(a); i <(b); i++)
#define r_rep(i, a, b) for(int i=(a); i >(b); i--)
typedef long long ll;
using namespace std;

int n, m, k;
ll asum, bsum;
vector<ll> a, b;
vector<pair<ll, ll> > c;
void _input() {
    asum = 0, bsum = 0;
    cin >> n >> m;
    a.resize(n);
    rep(i, 0, n) {
        cin >> a[i];
        asum += a[i];
    }
    cin >> k;
    b.resize(k);
    rep(i, 0, k) {
        cin >> b[i];
        bsum += b[i];
    }
}
void paring() {
    c.clear();
    rep(i, 0, n) {
        int cnt = 0;
        ll itr = m, v = a[i];
        while(v % itr == 0) {
            cnt++;
            itr *= m;
        }
        if (cnt == 0) {
            if (c.size() > 0 && c[sz(c) - 1].first == v) c[sz(c) - 1].second++;
            else c.push_back({v, 1});
        }
        else {
            if (c.size() > 0 && c[sz(c) - 1].first == v/(itr/m)) {
                c[sz(c) - 1].second += itr / m;
            } else c.push_back({ v / (itr / m) , itr / m});
            // v = itr/m * x
        }
    }
}
bool solve () {
    _input();
    paring();
    if (asum != bsum) return false;
    int cur = 0;
    rep(i, 0, k) {
        if (b[i] == c[cur].first) {
            c[cur].second--;
            if (c[cur].second == 0) cur++;
        } else if (b[i] > c[cur].first) {
            if (b[i] % m != 0) return false;
            ll itr = m;
            while (b[i] > c[cur].first * itr) {
                itr *= m;
            }
            if (b[i] != c[cur].first * itr) return false;
            if (c[cur].second < itr) return false;
            c[cur].second -= itr;
            if(c[cur].second == 0) cur++;
        } else {
            // can't be happened.
            return false;
        }
        if (cur == sz(c) && i != k-1) return false;
    }
    if (cur != sz(c)) return false;
    return true;
}
int main(){
    int tc; cin >>tc;
    while(tc--) {
        if (solve()) cout << "Yes\n";
        else cout << "No\n";
    }
        
    return 0;
}
```

## Problem D : Permutation Graph
- level : 1900
- tag : binary search, constructive algorithms, data structures, divide and conquer, greedy, shortest paths

### Point
- permutation으로 이루어진 길이 n짜리 배열 a가 주어집니다.
- 첫번째 원소부터 n번째 원소까지 이동할때 가장 빠른 길을 찾아서 그때 지나가는 원소의 갯수를 출력합니다.
- 각 원소끼리 edge 는 다음의 경우 형성됩니다.
  - 1 <= i < j <= n 인 i, j 에 대해
  - 구간[i:j]에 대해, a[i]값이 min이고 a[j]값이 max인경우 
  - 혹은 a[i]값이 max이고 a[j]값이 min인 경우
  - 이 경우 i와 j사이에 edge가 생성됩니다. 

### Design
- O(N)짜리 해결책도 있지만 이해가 조금 어렵습니다.
- 방법은 비슷하니 참고하면 좋을 것 같습니다.
- 핵심점인 해당 문제의 로직은 다음과 같습니다.
- 범위 1:n에 대해, n의 위치 i를 찾습니다.
- x < i < j 라고 할때, 
  - x 위치에 있는 모든 원소는 y로 가기위해서는 i를 무조건 밟고가야합니다.
  - i의 값이 해당 구간에서 가장 큰 값이기 때문에, i를 포함하는 구간은 작업의 결과가 무조건 i가 나오기 때문입니다.
- 이를 통해, 구간 [1:i] + [i+1:i+n] + 1이 답이 된다는 것을 알 수 있습니다.
  - 이제 좌측 구간 [1:i]에서는 가장 작은 값을 가지는 j값을 j인덱스를 찾습니다.
  - 구간 [1:i]에서는 j를 밟지 않고 지나갈 수 없습니다.
  - 그럼 이제 답은, [1:j] + 1 + [i+1:i+n] + 1 이 답이되겠습니다.
- 이런식으로, 구간을 줄여가며 max값과 min값을 번갈아가며 구해주면 답을 찾을 수 있습니다.
- 이를 위해, 구간 최소값과 구간 최대값이 필요하고 이는 세그먼트 트리를 통해 구해주면 O(NlogN)이 됩니다.
- 이를, prefixmax, prefixmin, suffixmax, suffixmin을 통해 구해주면 O(N)이 됩니다.


#### Big O(time)
- O(NlogN)

### Code

```cpp
#include<bits/stdc++.h>
#define rep(i, a, b) for(int i=(a); i <(b); i++)
#define r_rep(i, a, b) for(int i=(a); i >(b); i--)
#define sz(x) (int)x.size()
#define all(x) x.begin(), x.end()
using namespace std;
#define MAX 0
#define MIN 1
typedef pair<int,int> pi;
int n;
int a[5 * 100001];
pair<int,int> mntree[4 * 5 * 100001], mxtree[4 * 5 * 100001];

pair<int,int> init(const int start, const int end, const int node, const bool who) {
    if (start == end) return who == MAX ? mxtree[node] = pi (a[start], start) : mntree[node] = pi (a[start], start);
    int mid = (start + end) / 2;
    return who == MAX ? mxtree[node] = max( init(start, mid, node * 2, who), init(mid + 1, end, node * 2 + 1, who)) : mntree[node] = min(init(start, mid, node * 2, who), init(mid+1, end, node * 2 + 1, who));
}
// 내가 원하는 범위 : left, right
// 현재 node의 coverage : start, end
pair<int,int> find(const int start, const int end, const int node, const int left, const int right, const bool who) {
    if (left > end || right < start) return who == MAX? pi (-1, -1) : pi (n + 1, -1);
    if (left <= start && end <= right) return who == MAX? mxtree[node] : mntree[node];
    int mid = (start + end) / 2;
    return who == MAX ? max( find(start, mid, node * 2, left, right, who), find(mid + 1, end, node * 2 + 1, left, right, who)) : min( find(start, mid, node * 2, left, right, who), find(mid + 1, end, node * 2 + 1, left, right, who));
}
int dis(const int le, const int ri, const bool who) {
    if (le +1 == ri) return 1;
    if (le == ri) return 0;
    pi whole = find(0, n-1, 1, le, ri, who);
    int mid = whole.second;
    
    int leSum = 0, riSum = 0;
    pi left = find(0, n-1, 1, le, mid, !who);
    if (left.second != -1 && le != whole.second) {
        leSum = 1 + dis(le, left.second, who);
    }
    
    pi right = find(0, n-1, 1, mid + 1, ri, !who);
    if (right.second != -1 && ri != whole.second) {
        riSum = 1 + dis(right.second, ri, who);
    }
    
    return leSum + riSum;
}


void solve () {
    cin >> n;
    rep(i, 0, n) cin >> a[i];
    init(0, n-1, 1, MIN);
    init(0, n-1, 1, MAX);
    int ans = dis(0, n-1, MAX);
    cout << ans << '\n';
}
int main() {
    int tc; cin >> tc;
    while (tc--)
        solve();
    return 0;
}
```

- O(N)짜리 풀이도 공유합니다.
- suffixmin, suffixmax, prefixmin, prefixmax 를 이용한다는 점이 인상적입니다.
- 아직 이해하지 못한 부분은 main에서 왜 pos[1] < pos[n]인 경우에 대해 값을 바꿔주는지 모르겠습니다.
- [link](https://codeforces.com/contest/1696/submission/161822672)

```cpp
#include <bits/stdc++.h>
using namespace std;
 
using i64 = long long;
#define maxN 251000

int a[maxN], sfmn[maxN], sfmx[maxN], prmn[maxN], prmx[maxN], pos[maxN];
int n, m, k;

int calc() {
	sfmn[n] = sfmx[n] = a[n];
	prmn[1] = prmx[1] = a[1];
	for (int i = n - 1; i >= 1; i--) {
		sfmn[i] = min(sfmn[i + 1], a[i]);
		sfmx[i] = max(sfmx[i + 1], a[i]);
	}
	for (int i = 2; i <= n; i++) {
		prmn[i] = min(prmn[i - 1], a[i]);
		prmx[i] = max(prmx[i - 1], a[i]);
	}
	int p = pos[1], cnt = 1;
	while (p != n) {
		if (a[p] == sfmx[p]) p = pos[sfmn[p]], cnt++;
		else p = pos[sfmx[p]], cnt++;
	}
	p = pos[n];
	while (p != 1) {
		if (a[p] == prmx[p]) p = pos[prmn[p]], cnt++;
		else p = pos[prmx[p]], cnt++;
	}
	return cnt;
}

void solve() {
	scanf("%d", &n);
	for (int i = 1; i <= n; i++) {
		scanf("%d", &a[i]);
		pos[a[i]] = i;
	}
	if (n == 1) {
		puts("0");
		return;
	}
	if (pos[1] < pos[n]) {
		for (int i = 1; i <= n; i++) {
			a[i] = n + 1 - a[i];
			pos[a[i]] = i;
		}
	}
	printf("%d\n", calc());
}
int main() {
	int tc;
	scanf("%d", &tc);
	for (int T = 0 ; T < tc; T++) {
		solve();
	}
}
```
