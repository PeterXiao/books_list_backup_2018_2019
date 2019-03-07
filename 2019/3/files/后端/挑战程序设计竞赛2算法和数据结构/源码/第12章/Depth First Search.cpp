#include <iostream>
#include <cstdio>
#include <cstring>
#include <stack>
using namespace std;
const int maxx = 110;
int n, m[maxx][maxx];
int u, num, v;
int d[maxx], f[maxx];
int flag[maxx];
int nowtime = 1;

void dfs(int u) {

    // 入栈时间
    flag[u] = 1;
    d[u] = nowtime++;
    for (int i = 1; i <= n; i++) {
        if (flag[i] == 0 && m[u][i] == 1) {
            dfs(i);
        }
    }
    //出栈时间
    f[u] = nowtime++;
}

int main()
{

    scanf("%d", &n);
    memset(m, 0, sizeof(m));
    memset(f, 0, sizeof(f));
    for (int i = 1; i <= n; i++) {
        scanf("%d %d", &u, &num);
        for (int j = 1; j <= num; j++) {
            scanf("%d", &v);
            m[u][v] = 1;
        }
    }
    for (int i = 1; i <= n; i++) {
        if(flag[i] == 0)
            dfs(i);
    }
    for (int i = 1; i <= n; i++) {
        printf("%d %d %d\n", i, d[i], f[i]);
    }
    return 0;
}
