#include <iostream>
#include <cstdio>
#include <vector>
#include <queue>
using namespace std;
const int maxx = 100010;
const int INF = 1 << 30;

class Edge {
public:
    int t, w;
    Edge() {};
    Edge(int t ,int w):t(t), w(w) {};
};
vector<Edge> G[maxx];
int n, d[maxx];
bool vis[maxx];
int cnt;

void bfs(int s) {
    for (int i = 0; i < n; i++)
        d[i] = INF;
    queue<int> Q;
    Q.push(s);
    d[s] = 0;

    while (!Q.empty()) {
        int u = Q.front(); Q.pop();
        int len = G[u].size();
        for (int i = 0; i < len; i++) {
            Edge e = G[u][i];
            if (d[e.t] == INF) {
                d[e.t] = d[u] + e.w;
                Q.push(e.t);
            }
        }

    }

}

void solve() {
    // 从任选的结点s出发，选择距离s最远的结点tgt
    bfs(0);

    int maxv = 0, tgt = 0;
    for (int i = 0; i < n; i++) {
        if (d[i] == INF)
            continue;
        if (maxv < d[i]) {
            maxv = d[i];
            tgt = i;
        }
    }


    //从tgt出发，求结点tgt到最远结点的距离maxv
    bfs(tgt);
    maxv = 0;
    for (int i = 0; i < n; i++) {
        if (d[i] == INF)
            continue;
        maxv = max(maxv, d[i]);
    }
    printf("%d\n", maxv);
}
int main() {

    int s, t, w;
    scanf("%d", &n);
    for (int i = 0; i < n - 1; i++) {
        scanf("%d %d %d", &s, &t, &w);
        // 无向图
        G[s].push_back(Edge(t, w));
        G[t].push_back(Edge(s, w));
    }
    solve();
    return 0;
}
