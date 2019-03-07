#include <iostream>
#include <cstdio>
#include <cstring>
#include <queue>
#include <vector>
#include <algorithm>
using namespace std;
const int maxx = 10010;
const int INF = 1 << 30;
int n;
int flag[maxx];
// 加权有向图的邻接表表示法，pair.first是顶点v，pair.second是权值
vector<pair<int, int> > adj[maxx];

void dijkstra() {
    priority_queue<pair<int, int> > PQ;
    int d[maxx];
    for (int i = 0; i < n; i++) {
        d[i] = INF;
        flag[i] = 0;
    }

    d[0] = 0;
    PQ.push(make_pair(0, 0));
    while (!PQ.empty()) {

        pair<int, int> f = PQ.top(); PQ.pop();
        int u = f.second;

        // 标记已经加入S
        flag[u] = 1;

        //如果不是最小最短路径则忽略
        if (d[u] < f.first *(-1))
            continue;
        int len = adj[u].size();
        for (int j = 0; j < len; j++) {
            int v = adj[u][j].first;
            if (flag[v] == 0 && d[v] > d[u] + adj[u][j].second) {
                d[v] = d[u] + adj[u][j].second;
                // priority_queue默认取最大值，所以乘以-1
                PQ.push(make_pair(d[v] * (-1), v));
            }
        }
    }

    for (int i = 0; i < n; i++)
        printf("%d %d\n", i, d[i] == INF ? -1 : d[i]);
}
int main()
{
    int u, v, k, c;
    scanf("%d", &n);
    for (int i = 0; i < n; i++) {
        scanf("%d %d", &u, &k);
        for (int j = 0; j < k; j++) {
            scanf("%d %d", &v, &c);
            adj[u].push_back(make_pair(v, c));
        }
    }
    dijkstra();
    return 0;
}
