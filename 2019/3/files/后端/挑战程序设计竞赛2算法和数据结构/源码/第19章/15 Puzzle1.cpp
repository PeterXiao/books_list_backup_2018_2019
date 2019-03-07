/*IDA*算法*/
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
};

const int dx[4] = { 0, -1, 0, 1 };
const int dy[4] = { 1, 0, -1 ,0 };
const char dir[4] = { 'r','u','l','d' };
int MDT[maxx][maxx];

Puzzle state;
int limit;
int path[LIMIT];

int getAllMD(Puzzle pz) {
    int sum = 0;
    for (int i = 0; i < maxx; i++) {
        if (pz.f[i] != maxx)
            sum += MDT[i][pz.f[i] - 1];
    }
    return sum;
}

bool isSolved() {
    for (int i = 0; i < maxx; i++)
        if (state.f[i] != i + 1)
            return false;
    return true;
}

bool dfs(int depth, int prev) {

    if (state.MD == 0)
        return true;

    // 如果当前的深度加上启发值超过了限制，则进行剪枝
    if (depth + state.MD > limit)
        return false;

    int sx = state.space / row;
    int sy = state.space % row;

    Puzzle tmp;
    for (int r = 0; r < 4; r++) {
        int tx = sx + dx[r];
        int ty = sy + dy[r];
        if (tx < 0 || ty < 0 || tx >= row || ty >= row)
            continue;
        if (max(prev, r) - min(prev, r) == 2)
            continue;
        tmp = state;
        // 计算曼哈顿距离的差值，同时交换拼图
        state.MD -= MDT[tx * row + ty][state.f[tx * row + ty] - 1];
        state.MD += MDT[sx * row + sy][state.f[tx * row + ty] - 1];
        swap(state.f[tx * row + ty], state.f[sx * row + sy]);
        state.space = tx * row + ty;
        if (dfs(depth + 1, r)) {
            path[depth] = r;
            return true;
        }
        state = tmp;
    }
    return false;
}

string iterative_deepening(Puzzle in) {
    // 初始状态的曼哈顿距离
    in.MD = getAllMD(in);
    for (limit = in.MD; limit <= LIMIT; limit++) {
        state = in;
        if (dfs(0, -100)) {
            string ans = "";
            for (int i = 0; i < limit; i++)
                ans += dir[path[i]];
            return ans;
        }
    }
    return "unsolvable";
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
    string ans = iterative_deepening(in);
    printf("%d\n", ans.size());
    return 0;
}