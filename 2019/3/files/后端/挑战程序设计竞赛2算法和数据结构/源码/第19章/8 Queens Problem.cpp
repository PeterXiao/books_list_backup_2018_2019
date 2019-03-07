#include<iostream>   
#include<cstdio>  
#include<algorithm>
#include<stack>
using namespace std;
const int maxx = 8;
// 行列、斜列
int row[maxx], col[maxx];
int dpos[maxx * 2 - 1], dneg[maxx * 2 - 1];

int x[maxx][maxx];

void init() {
    for (int i = 0; i < maxx; i++)
        row[i] = col[i] = 0;
    for (int i = 0; i < maxx * 2 - 1; i++)
        dpos[i] = dneg[i] = 0;
    for (int i = 0; i < maxx; i++)
        for (int j = 0; j < maxx; j++)
            x[i][j] = 0;
}
void print() {

    for (int i = 0; i < maxx; i++) {
        for (int j = 0; j < maxx; j++) {
            if (x[i][j] && row[i] != j)
                return;
        }
    }
    for (int i = 0; i < maxx; i++) {
        for (int j = 0; j < maxx; j++) {
            printf("%c", row[i] == j ? 'Q' : '.');
        }
        printf("\n");
    }
}
void recursive(int i) {
    if (i == maxx) {
        print();
        return;
    }

    for (int j = 0; j < maxx; j++) {
        // 不适合放在这里
        if (col[j] || dpos[i + j] || dneg[i - j + maxx - 1])
            continue;

        // 尝试放下这里
        row[i] = j; col[j] = dpos[i + j] = dneg[i - j + maxx - 1] = 1;
        recursive(i + 1);
        // 恢复刚才的操作继续其他的操作
        row[i] = col[j] = dpos[i + j] = dneg[i - j + maxx - 1] = 0;
    }
}
int main()
{
    int k;
    int r, c;
    scanf("%d", &k);
    for (int i = 0; i < k; i++){
        scanf("%d %d", &r, &c);
        x[r][c] = 1;
    }

    recursive(0);
    return 0;
}