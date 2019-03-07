#include <iostream>
#include <cstdio>
#include <cstring>
#include <stack>
#include <vector>
using namespace std;
const int maxx = 1010;
const int INF = 1 << 30;
int n, m[maxx][maxx];
int u, num, v;
int flag[maxx];

int prim() {
    // d数组是保存V-T， p数组是记录MST的
    int d[maxx], p[maxx];
    for (int i = 0; i < n; i++) {
        d[i] = INF;
        p[i] = -1;
        flag[i] = 0;
    }

    d[0] = 0;
    while (1) {
        int minv = INF;
        u = -1;
        // 比较出权值最小的边
        for (int i = 0; i < n; i++) {
            if (minv > d[i] && flag[i] == 0) {
                u = i;
                minv = d[i];
            }
        }

        if (u == -1)
            break;

        // 标记已经加入MST
        flag[u] = 1;

        // 更新未访问的点与已经访问的点之间的最小的边（相对于每个点）
        for (int v = 0; v < n; v++) {
            if (flag[v] == 0 && m[u][v] != INF && d[v] > m[u][v]) {
                d[v] = m[u][v];
                p[v] = u;
            }
        }
    }


    int ans = 0;
    for (int i = 0; i < n; i++)
        if (p[i] != -1)
            ans += m[i][p[i]];

    return ans;
}
int main()
{
    memset(flag, 0, sizeof(flag));
    scanf("%d", &n);

    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            scanf("%d", &m[i][j]);
            if (m[i][j] == -1)
                m[i][j] = INF;
        }
    }
    printf("%d\n", prim());
    return 0;
}
