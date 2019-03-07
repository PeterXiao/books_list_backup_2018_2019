#include <iostream>
#include <cstdio>
#include <cstring>
using namespace std;
const int maxx = 110;

int main()
{
    int n, m[maxx][maxx];
    int u, num, v;
    scanf("%d", &n);
    memset(m, 0, sizeof(m));
    for (int i = 1; i <= n; i++) {
        scanf("%d %d", &u, &num);
        for (int j = 1; j <= num; j++) {
            scanf("%d", &v);
            m[u][v] = 1;
        }
    }

    for (int i = 1; i <= n; i++)
        for (int j = 1; j <= n; j++)
            printf("%d%c", m[i][j], j == n ? '\n' : ' ');

    return 0;
}
