#include <iostream>
#include <cstdio>
#include <algorithm>
#include <vector>
#include <queue>
using namespace std;
const int maxx = 100010;
const int INF = 1 << 30;

class DisjointSet {
public:
    // rank记录树的高度
    vector<int> rank, p;
    DisjointSet() {};
    DisjointSet(int size) {
        rank.resize(size, 0);
        p.resize(size, 0);
        for (int i = 0; i < size; i++)
            makeSet(i);
    }
    void makeSet(int i) {
        p[i] = i;
        rank[i] = 0;
    }

    bool same(int x, int y) {
        return findSet(x) == findSet(y);
    }

    void unite(int x, int y) {
        link(findSet(x), findSet(y));
    }

    void link(int x, int y) {
        // 包含x的树的高度更高，则将y的树合并到x上
        if (rank[x] > rank[y])
            p[y] = x;
        else {
            p[x] = y;
            if (rank[x] == rank[y])
                rank[y]++;
        }
    }
    int findSet(int x) {
        if (x != p[x])
            p[x] = findSet(p[x]);
        return p[x];
    }
};

class Edge {
public:
    int source, target, cost;
    Edge(int source = 0, int target = 0, int cost = 0) :
        source(source), target(target), cost(cost) {}
    bool operator < (const Edge &e) const {
        return cost < e.cost;
    }
};


int kruskal(int n, vector<Edge> edges) {
    int totalCost = 0;
    sort(edges.begin(), edges.end());

    DisjointSet dset = DisjointSet(n + 1);
    for (int i = 0; i < n; i++)
        dset.makeSet(i);

    int len = edges.size();
    for (int i = 0; i < len; i++) {
        Edge e = edges[i];
        // 判断是否会成环
        if (!dset.same(e.source, e.target)) {
            // 添加最小生成树的边
            //MST.push_back(e);
            totalCost += e.cost;
            dset.unite(e.source, e.target);
        }
    }
    return totalCost;
}
int main() {

    int n, m, cost;
    int source, target;
    scanf("%d %d", &n, &m);
    vector<Edge> edges;
    for (int i = 0; i < m; i++) {
        scanf("%d %d %d", &source, &target, &cost);
        edges.push_back(Edge(source, target, cost));
    }
    printf("%d\n", kruskal(n, edges));
    return 0;
}
