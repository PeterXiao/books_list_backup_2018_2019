#include<iostream>   
#include<cstdio>  
#include<algorithm>
#include<queue>
#include<map>
#include<string>
using namespace std;
const int row = 3;
const int maxx = 9;

struct Puzzle {
    int f[maxx];
    int space;
    string path;
    bool operator < (const Puzzle &p) const {
        for (int i = 0; i < maxx; i++) {
            if (f[i] != p.f[i])
                return f[i] > p.f[i];
        }
        return false;
    }
};

const int dx[4] = { -1, 0, 1, 0 };
const int dy[4] = { 0, -1, 0 ,1 };
const char dir[4] = { 'u','l','d','r' };

bool isTarget(Puzzle p) {
    for (int i = 0; i < maxx; i++)
        if (p.f[i] != (i + 1))
            return false;
    return true;
}


string bfs(Puzzle s) {
    queue<Puzzle> Q;
    map<Puzzle, bool> V;
    Puzzle u, v;
    s.path = "";
    Q.push(s);
    V[s] = true;

    while (!Q.empty()) {
        u = Q.front(); Q.pop();
        if (isTarget(u))
            return u.path;
        int sx = u.space / row;
        int sy = u.space % row;
        for (int r = 0; r < 4; r++) {
            int tx = sx + dx[r];
            int ty = sy + dy[r];

            if (tx < 0 || ty < 0 || tx >= row || ty >= row)
                continue;
            v = u;
            swap(v.f[u.space], v.f[tx * row + ty]);
            v.space = tx * row + ty;
            if (!V[v]) {
                V[v] = true;
                v.path += dir[r];
                Q.push(v);
            }
        }
    }
    return "unsolveable";
}
int main()
{
    Puzzle in;
    for (int i = 0; i < maxx; i++) {
        cin >> in.f[i];
        if (in.f[i] == 0) {
            in.f[i] = maxx;
            in.space = i;
        }
    }
    string ans = bfs(in);
    printf("%d\n", ans.size());
    return 0;
}