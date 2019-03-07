#include <iostream>
#include <cstdio>
#include <cstring>
#include <queue>
using namespace std;
const int maxx = 110;
int n, m[maxx][maxx];
int u, num, v;
int flag[maxx];
int d[maxx];


void bfs() {
    queue<int>q;

    q.push(1);
    d[1] = 0;
    while (!q.empty()) {
        int u = q.front();
        q.pop();
        for (int i = 2; i <= n; i++) {
            if (m[u][i] == 1 && flag[i] == 0) {
                // 标记为已经访问
                flag[i] = 1;
                // 更新长度
                d[i] = d[u] + 1;
                // 压入栈内
                q.push(i);
            }
        }
    }
}
int main()
{

    scanf("%d", &n);
    memset(m, 0, sizeof(m));
    for (int i = 1; i <= n; i++) {
        scanf("%d %d", &u, &num);

        // 初始化
        flag[i] = 0;
        d[i] = -1;
        for (int j = 1; j <= num; j++) {
            scanf("%d", &v);
            m[u][v] = 1;
        }
    }
    bfs();
    for (int i = 1; i <= n; i++) {
        printf("%d %d\n", i, d[i]);
    }
    return 0;
}
