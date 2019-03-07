#include <iostream>
#include <cstdio>
#include <vector>
using namespace std;

class DisjointSet {
    public :
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
int main()
{
    int n, a, b,t, q;
    scanf("%d %d", &n, &q);
    DisjointSet ds = DisjointSet(n);
    for (int i = 0; i < q; i++) {
        scanf("%d %d %d", &t, &a, &b);
        if (t == 0)
            ds.unite(a, b);
        else
            printf("%d\n", ds.same(a, b) ? 1 : 0);
    }
    return 0;
}