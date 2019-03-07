#include <iostream>
#include <cstdio>
#include <cstring>
#include <stack>
#include <vector>
using namespace std;
const int maxx = 1010;
const int INF = 1 << 30;
int n, m[maxx][maxx];
int u, v ,k, c;
int flag[maxx];

void dijkstra() {
    int d[maxx];
    for (int i = 0; i < n; i++) {
        d[i] = INF;
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

        // 标记已经加入S
        flag[u] = 1;

        // 更新经由u结点，V-S的v结点的最小成本
        for (int v = 0; v < n; v++) {
            if (flag[v] == 0 && m[u][v] != INF && d[v] > d[u] + m[u][v]) {
                d[v] = d[u] + m[u][v];
            }
        }
    }

    for (int i = 0; i < n; i++)
        printf("%d %d\n", i, d[i] == INF ? -1 : d[i]);
}
int main()
{
    scanf("%d", &n);

    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            m[i][j] = INF;
        }
    }
    for (int i = 0; i < n; i++) {
        scanf("%d %d", &u, &k);
        for (int j = 0; j < k; j++) {
            scanf("%d %d", &v, &c);
            m[u][v] = c;
        }
    }
    dijkstra();
    return 0;
}
