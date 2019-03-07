#include <iostream>
#include <cstdio>
#include <vector>
#include <queue>
#include <list>
#include <algorithm>
using namespace std;
const int maxx = 100010;
const int INF = 1 << 30;

vector<int>G[maxx];
list<int>out;
bool flag[maxx];
int n;
int indeg[maxx];

void bfs(int s) {
    queue<int> q;
    q.push(s);

    while (!q.empty()) {
        int u = q.front(); q.pop();
        out.push_back(u);
        for (int i = 0; i < G[u].size(); i++) {
            int v = G[u][i];
            indeg[v]--;
            if (indeg[v] == 0 && flag[v] == 0) {
                flag[v] = true;
                q.push(v);
            }
        }
    }
}

void tsort() {
    for (int i = 0; i < n; i++) {
        indeg[i] = 0;
        flag[i] = false;
    }

    for (int u = 0; u < n; u++) {
        for (int i = 0; i < G[u].size(); i++) {
            int v = G[u][i];
            indeg[v]++;
        }
    }


    for (int u = 0; u < n; u++) {
        if (indeg[u] == 0 && flag[u] == 0)
            bfs(u);
    }

    for (list<int>::iterator it = out.begin(); it != out.end(); it++)
        printf("%d\n", *it);
}
int main()
{
    int s, t, m;
    scanf("%d %d", &n, &m);
    for (int i = 0; i < m; i++) {
        scanf("%d %d", &s, &t);
        G[s].push_back(t);
    }

    tsort();
    return 0;
}
