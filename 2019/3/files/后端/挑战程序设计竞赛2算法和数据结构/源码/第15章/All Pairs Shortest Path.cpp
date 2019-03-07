#include <iostream>
#include <cstdio>
#include <vector>
#include <algorithm>
using namespace std;
typedef long long LL;
const int maxx = 110;
const LL INF = (1LL << 32);

int n,q;
LL d[maxx][maxx];

void floyd() {
    for (int k = 0; k < n; k++) {
        for (int i = 0; i < n; i++) {
            if (d[i][k] == INF)
                continue;
            for (int j = 0; j < n; j++) {
                if (d[k][j] == INF)
                    continue;
                d[i][j] = min(d[i][j], d[i][k] + d[k][j]);
            }
        }
    }
}
int main()
{
    int u, v, c;
    scanf("%d %d", &n, &q);

    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++)
            d[i][j] = i == j ? 0 : INF;
    }

    // 输入权值
    for (int i = 0; i < q; i++) {
        scanf("%d %d %d", &u, &v, &c);
        d[u][v] = c;
    }

    floyd();

    // 判断是否存在负环
    bool negative = false;
    for (int i = 0; i < n; i++)
        if (d[i][i] < 0)
            negative = true;

    if (negative)
        printf("NEGATIVE CYCLE\n");
    else {
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                if (d[i][j] == INF)
                    printf("INF");
                else
                    printf("%d", d[i][j]);
                printf("%c", j == n - 1 ? '\n' : ' ');
            }
        }
    }
    return 0;
}
