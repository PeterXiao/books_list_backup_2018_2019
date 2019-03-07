#include <iostream>
#include <algorithm>
#include <cstdio>
#include <cstring>
using namespace std;
const int INF = 1 << 30;
const int maxx = 10010;

int dp[maxx], s[maxx];
int w[maxx], v[maxx];
int main() {
    int n, W;
    int A[100];
    int T[50000 + 10];
    scanf("%d %d", &n, &W);
    memset(dp, 0, sizeof(dp));
    memset(s, 0, sizeof(s));
    for (int i = 1; i <= n; i++)
    {
        scanf("%d %d", &v[i], &w[i]);
        s[i] = s[i - 1] + w[i];
    }
    for (int i = 1; i <= n; i++)
    {
        int b = max(w[i], W - s[n] + s[i - 1]);
        for (int j = W; j >= b; j--)
            dp[j] = max(dp[j], dp[j - w[i]] + v[i]);
    }
    printf("%d\n", dp[W]);
    return 0;
}
