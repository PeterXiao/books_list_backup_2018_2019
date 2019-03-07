/*A*算法*/
#include<iostream>   
#include<cstdio>  
#include<algorithm>
#include<queue>
#include<map>
#include<string>
using namespace std;
const int row = 4;
const int maxx = 16;
const int LIMIT = 100;
struct Puzzle {
    int f[maxx], space, MD;
    int cost;
    bool operator < (const Puzzle &p) const {
        for (int i = 0; i < maxx; i++) {
            if (f[i] != p.f[i])
                return f[i] < p.f[i];
        }
        return false;
    }
};

struct State {
    Puzzle puzzle;
    int estimated;
    bool operator < (const State &s) const {
        return estimated > s.estimated;
    }
};
const int dx[4] = { 0, -1, 0, 1 };
const int dy[4] = { 1, 0, -1 ,0 };
const char dir[4] = { 'r','u','l','d' };
int MDT[maxx][maxx];


int getAllMD(Puzzle pz) {
    int sum = 0;
    for (int i = 0; i < maxx; i++) {
        if (pz.f[i] != maxx)
            sum += MDT[i][pz.f[i] - 1];
    }
    return sum;
}

int astar(Puzzle s) {

    priority_queue<State> PQ;
    s.MD = getAllMD(s);
    s.cost = 0;
    map<Puzzle, bool> V;
    Puzzle u, v;
    State initial;
    initial.puzzle = s;
    initial.estimated = getAllMD(s);
    PQ.push(initial);

    while (!PQ.empty()) {
        State st = PQ.top(); PQ.pop();
        u = st.puzzle;
        if (u.MD == 0)
            return u.cost;
        V[u] = true;
        int sx = u.space / row;
        int sy = u.space % row;
        for (int r = 0; r < 4; r++) {
            int tx = sx + dx[r];
            int ty = sy + dy[r];
            if (tx < 0 || ty < 0 || tx >= row || ty >= row)
                continue;
            v = u;
            // 计算曼哈顿距离的差值，同时交换拼图
            v.MD -= MDT[tx * row + ty][v.f[tx * row + ty] - 1];
            v.MD += MDT[sx * row + sy][v.f[tx * row + ty] - 1];

            swap(v.f[tx * row + ty], v.f[sx * row + sy]);
            v.space = tx * row + ty;
            if (!V[v]) {
                v.cost++;
                State news;
                news.puzzle = v;
                news.estimated = v.cost + v.MD;
                PQ.push(news);
            }
        }
    }

    return -1;
}


int main()
{
    for (int i = 0; i < maxx; i++) {
        for (int j = 0; j < maxx; j++) {
            MDT[i][j] = abs(i / row - j / row) + abs(i % row - j % row);
        }
    }
    Puzzle in;
    for (int i = 0; i < maxx; i++) {
        cin >> in.f[i];
        if (in.f[i] == 0) {
            in.f[i] = maxx;
            in.space = i;
        }
    }

    printf("%d\n", astar(in));
    return 0;
}
