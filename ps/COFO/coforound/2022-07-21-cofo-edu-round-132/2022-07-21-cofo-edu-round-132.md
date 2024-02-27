---
layout: post
title : "COFO::Cofo Edu Round 132"
subtitle: "cofo round"
type: "codeforce div 2"
ps: true
cofo: true
round: true
text: true
author: "beenpow"
post-header: true
header-img: "https://www.spotebi.com/wp-content/uploads/2019/01/one-day-day-one-workout-motivation-spotebi.jpg"
order: 1
date: "2022-07-21"
---

# COFO::Cofo Edu Round #132
- [Link : COFO::Cofo edu round 132)](https://codeforces.com/contest/1709)
- solved : 
  - A : 00:05
  - B : 00:22
  - C : 
  - D : -7
  - rank : 4074 
  - score : 2 solved

## Problem A : Three Doors

- level : 
- tag : brute force, greedy, implementation, math

### point
- 3개의 door가 있습니다.
  - 각 door를 열면 다른 door를 열 수 있는 키가 있습니다.
- 최초에 키 하나가 주어질때 3개의 door를 모두 열 수 있는지 여부를 출력합니다.

### Design
- 문제에서 요구하는대로 주어진키로 열수있는 방들을 순서대로 방문가능한지 체크합니다.

#### Big O(time)
- O(3)

### Code

```cpp
#include<bits/stdc++.h>
#define all(a) a.begin(), a.end()
#define sz(a) (int) a.size()
#define rep(i, a, b) for(int i=(a); i <(b); i++)
#define r_rep(i, a, b) for(int i=(a); i >(b); i--)
typedef long long ll;
using namespace std;

int x;
int a[4];
bool solve () {
    cin >> x;
    rep(i, 1, 4) cin >> a[i];
    if(a[x] != 0 && a[a[x]] != 0) return true;
    return false;
}

int main(){
    int tc; cin >> tc;
    while(tc--) {
        if(solve())cout << "YES\n";
        else cout << "NO\n";
    }
        
    return 0;
}

```

## Problem B : Also Try Minecraft

- level : 
- tag : data structures, dp, implementation

### Point
- n개의 원소로 이루어진 배열 a가 주어집니다.
  - a[i] 는 i번째 위치의 높이라 합시다.
- m개의 쿼리가 주어집니다.
  - 첫번째 위치에서 두번째 위치로 이동하려 할때, 다음의 결과를 출력합니다.
    - i인덱스에서 i-1 or i+1 인덱스로 이동하려고 합니다.
    - i인덱스에서의 높이를 p, 다른 높이를 q라고 합시다.
     - p가 q보다 큰 경우 p - q 만큼의 damage를 받습니다.
  - 이동은 좌 혹은 우로 한칸 이동가능하며, 이동중 받는 총 damage를 출력합니다.

### Design
- 내려갈땐 무조건 데미지를 받습니다.
- 매번 같은 범위를 이동할땐 같은 값만큼의 데미지를 받기때문에 한번만 구해두고 게속 사용하면 되겠죠.
- 이를 prefix sum과 suffix sum으로 데미지의 누적합을 구할 수 있습니다.

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
const int MAXN = 100009;

int n, m;
ll a[MAXN];
ll psum[MAXN], ssum[MAXN];
void solve () {
    cin >> n >> m;
    rep(i, 0, n) {
        cin >> a[i];
        psum[i] = ssum[i] = 0;
    }
    rep(i, 1, n) {
        psum[i] = psum[i-1] + (a[i-1] > a[i] ? (a[i-1] - a[i]) : 0);
    }
    r_rep(i, n-2, -1) {
        ssum[i] = ssum[i+1] + (a[i+1] > a[i] ? (a[i+1] - a[i]) : 0);
    }
    
    while(m--) {
        int s, t;
        cin >> s >> t;
        s--, t--;
        if (s < t) cout << psum[t] - psum[s] << '\n';
        else cout << ssum[t] - ssum[s] << '\n';
    }
}
int main(){
    //int tc; cin >> tc;
    //while(tc--) {
        solve ();
    //}
        
    return 0;
}

```

## Problem C : Recover an RBS

- level : 
- tag : constructive algorithms, greedy, implementation, strings
- 재밌는 풀이이니 꼭 기억해둬야겠습니다.

### Point
- 좌측괄호와 우측괄호로 이루어진 braket 세트가 주어집니다.
- 이때 이 세트는 right 한 짝이맞는 세트입니다.
- 이때, 몇 군데가 물음표로 바뀐상태로 string으로 주어집니다.
- 물음표 위치에 좌측 혹은 우측괄호를 넣어서 다시 right한 상태로 만드려고 할때, right 한 상태가 하나뿐인지 여부를 출력합니다.

### Design
- 아이디어가 매우 신박합니다.
- 물음표에 들어가야할 좌측괄호의 갯수와 우측괄호의 갯수는 한번에 구해낼 수 있습니다.
  - 총길이의 절반만큼 있어야하기 때문이죠.
- 이제 물음표의 맨 좌측부터 무조건 좌측괄호만 채우고, 남은 좌측괄호가 없는 순간부터 나머지는 모두 우측괄호로만 채웁니다.
- 이 경우 무조건 right 한 브라켓 세트가 이루어집니다.
- (((())) 처럼 말이죠.
  - 제 생각엔, 브라켓은 늘 좌측부터 열려야하기때문에 일단 모든 브라켓을 열어주고 닫기때문에 무조건 가능한 방법이라고 생각합니다.
- right 한 경우가 1개가 아닌 경우 다음의 작업이 무조건 가능합니다.
  - ((()())
  - 즉, 최우측의 좌측괄호와 최좌측의 우측괄호를 swap 하는 방법입니다.
- 이 방법으로 답이 1개뿐인지 알 수 있습니다.


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

void solve () {
    auto check = [](const string& s) {
        int bal = 0;
        for(char c : s) {
            if (c == '(') ++bal;
            if (c == ')') --bal;
            if (bal < 0) return false;
        }
        return bal == 0;
    };
    
    string s;
    cin >> s;
    int le = sz(s)/2, ri = sz(s)/2;
    vector<int> pos;
    rep(i, 0, sz(s)) {
        if(s[i] == '(') le--;
        else if(s[i] == ')') ri--;
        else pos.push_back(i);
    }
    
    // This will always work
    rep(i, 0, sz(pos)) {
        if (i < le) s[pos[i]] = '(';
        else s[pos[i]] = ')';
    }
    
    bool ok = true;
    if (le > 0 && ri > 0) {
        swap(s[pos[le-1]], s[pos[le]]);
        if (check(s)) ok = false;
    }
    
    if(ok) cout << "YES\n";
    else cout << "NO\n";
}
int main(){
    ios_base::sync_with_stdio(0); cin.tie(0);
    int tc; cin >> tc;
    while(tc--)
        solve();
    return 0;
}

```

## Problem D : Rorororobot
- level : 
- tag : binary search, data structures, greedy, math

### Point
- n과 m이 주어집니다.
- m개의 원소로 이루어진 배열 a가 주어집니다.
  - a[i] : i번째 열의 1부터 blocked된 높이
- q개의 쿼리가 주어집니다.
  - sx, sy, ex, ey, k
  - 위치 (sx, sy)에서 (ex, ey)로 k칸씩 이동하려고 할때 도착할 수 있는지 여부를 출력합니다.

### Design
- 세그로 잘 접근했지만 2가지를 놓쳐서 시간내에 풀지못했습니다.
  - cin.tie를 사용하지 않아서 TLE가 발생
  - 문제가 발생하진 않았지만, 시작점에서 2번째 위치로 갈때 갈 수 있는 위치를 애매하게 구했습니다.
    - 정확히 O(1)에 구할 수 있는데도 말이죠.
- 문제 풀이는 이렇습니다.
- blocked 된 부분은 x = 1 부터 연속으로 되어있습니다.
- 즉 윗공간이 비게되죠.
- 따라서 열간 이동하려면 윗공간을 이용해야 합니다.
- 그럼 다음과 같은 경로가 나옵니다.
- 1번 위치 : sx sy
- 2번 위치 : A sy
- 3번 위치 : A ey
- 4번 위치 : ex ey
- 1번위치에서 2번 위치로 가는 방법은 k를 이용해서 n의 끝까지 갈 수 있는 점을 구해내면 됩니다.
- 이후 2번 위치에서 3번 위치로 갈때는 해당 열 사이의 가장 높은 블락보다 높은 위치로 이동해야 합니다.
- 따라서 A값을 구할때 세그트리를 이용해서 구간내에 가장 높은 값을 구해내면됩니다.
- 나머지 연산은 이제 k칸씩 이동해서 도달할 수 있는지 여부만 체크해주면 됩니다.

#### Big O(time)
- O(qlogn)

### Code

```cpp
#include<bits/stdc++.h>
#define all(a) a.begin(), a.end()
#define sz(a) (int) a.size()
#define rep(i, a, b) for(int i=(a); i <(b); i++)
#define r_rep(i, a, b) for(int i=(a); i >(b); i--)
typedef long long ll;
using namespace std;
const ll MAXN = 1e9 + 9, MAXM = 200000 + 9;

int n, m;
int a[MAXM];
int tree[4 * MAXM];
int init(int start, int end, int node) {
    if(start == end) return tree[node] = a[start];
    int mid = (start + end) / 2;
    return tree[node] = max(init(start, mid, node * 2), init(mid + 1, end, node * 2 + 1));
}
int MX(int start, int end, int node, int left, int right) {
    if(left > end || right < start) return 0;
    if(left <= start && end <= right) return tree[node];
    int mid = (start + end) / 2;
    return max(MX(start, mid, node * 2, left, right), MX(mid + 1, end, node * 2 + 1, left, right));
}
int getMaxRow(int columna, int columnb) {
    if(columna > columnb) swap(columna, columnb);
    int mx = MX(0, m-1, 1, columna, columnb);
    return mx;
}
bool ableToMove(ll x, ll y, const ll k) {
    if(x > y) swap(x, y);
    ll diff = y - x;
    ll r = diff % k;
    return r == 0;
}
bool each() {
    int sx, sy, ex, ey, k;
    cin >> sx >> sy >> ex >> ey >> k;
    sy--, ey--;
    if(sy == ey) {
        if(ableToMove(sx, ex, k)) return true;
        else return false;
    } else {
        // mx = find max value of row (range[sy:ey])
        int mx = getMaxRow(sy, ey);
        int z = mx + 1;
        if (z > n) return false;

        ll A = 1LL * (n - sx)/k*k + sx;
        bool okay = false;
        if(A >= z && A <= n) okay = true;
        if(!okay) return false;
        
        // [2] (A, sy) -> (A, ey)
        if(!ableToMove(sy, ey, k)) return false;
        
        // [3] (A, ey) -> (ex, ey)
        if(!ableToMove(A, ex, k)) return false;
    }
    return true;
}
void solve () {
    cin >> n >> m;
    rep(i, 0, m) cin >> a[i];
    
    /* init */
    init(0, m-1, 1);
    
    int q; cin >> q;
    while(q--) {
        if (each()) cout << "YES\n";
        else cout << "NO\n";
    }
}
int main(){
    ios_base::sync_with_stdio(0); cin.tie(0);
    solve () ;
    return 0;
}

```
