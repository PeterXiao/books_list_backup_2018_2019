#include <iostream>
#include <cstdio>
#include <cstring>
#include <algorithm>
using namespace std;
const int maxx = 110;
const int INF = 1 << 30;
int main()
{
    int n, p[maxx], m[maxx][maxx];

    scanf("%d", &n);
    for (int i = 1; i <= n; i++)
        scanf("%d %d", &p[i - 1], &p[i]);

    for (int i = 1; i <= n; i++)
        m[i][i] = 0;


    for (int l = 2; l <= n; l++) {
        for (int i = 1; i <= n - l + 1; i++) {
            int j = i + l - 1;
            m[i][j] = INF;
            for (int k = i; k <= j - 1; k++)
                m[i][j] = min(m[i][j], m[i][k] + m[k + 1][j] + p[i - 1] * p[k] * p[j]);

        }
    }
    printf("%d\n", m[1][n]);
    return 0;
}
