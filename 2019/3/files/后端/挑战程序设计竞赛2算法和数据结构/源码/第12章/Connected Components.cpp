#include <iostream>
#include <cstdio>
#include <cstring>
#include <stack>
#include <vector>
using namespace std;
const int maxx = 100010;
int n, m;
int u, num, v;
int flag[maxx];
int color[maxx];
vector<int> G[maxx];

int c = 1;
void dfs(int t) {
    stack<int>s;
    s.push(t);
    color[t] = c;
    while (!s.empty()) {
        int u = s.top(); s.pop();
        int len = G[u].size();
        for (int i = 0; i < len; i++) {
            int v = G[u][i];
            if (flag[v] == 0) {
                color[v] = c;
                flag[v] = 1;
                s.push(v);
            }
        }
    }
}
int main()
{
    int q;
    memset(flag, 0, sizeof(flag));
    scanf("%d %d", &n, &m);
    for (int i = 0; i < m; i++) {
        scanf("%d %d", &u, &v);
        //将顶点v添加到G[u]数组中
        G[u].push_back(v);
        G[v].push_back(u);
    }
    for (int i = 0; i < n; i++) {
        if (flag[i] == 0) {
            dfs(i);
            c++;
        }
    }
    scanf("%d", &q);
    for (int i = 0; i < q; i++) {
        scanf("%d %d", &u, &v);
        if (color[u] == color[v]) {
            printf("yes\n");
        }
        else {
            printf("no\n");
        }
    }
    return 0;
}
