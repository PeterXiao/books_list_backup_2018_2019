#include<iostream>
#include<cstdio>
#include<algorithm>
#include<cmath>
using namespace std;
const int MAX = 5000;
const int maxnum = 10010;
bool V[MAX];

int n, A[MAX], s;
int B[MAX], T[maxnum];
int solve() {
    int ans = 0;

    // T数组的下标是元素值，值是当前的下标，可以用于循环置换群
    for (int i = 0; i < n; i++)
        T[B[i]] = i;
    for (int i = 0; i < n; i++) {
        // 已经在别的置换群使用过了
        if (V[i])
            continue;

        int cur = i;
        int S = 0, m = maxnum, an = 0;
        // 置换群遍历
        while (!V[cur]) {
            V[cur] = true;
            // 置换群数量累加
            an++;
            int v = A[cur];
            // 遍历出置换群的最小值
            m = min(m, v);
            S += v;
            // 置换群的下一个点
            cur = T[v];
        }
        ans += min(S + (an - 2) * m, m + S + (an + 1) * s);
    }
    return ans;

}
int main() {

    scanf("%d", &n);
    s = maxnum;
    for (int i = 0; i < n; i++) {
        scanf("%d", &A[i]);
        s = min(s, A[i]);
        B[i] = A[i];
        V[i] = false;
    }
    sort(B, B + n);
    printf("%d\n", solve());
    return 0;
}
