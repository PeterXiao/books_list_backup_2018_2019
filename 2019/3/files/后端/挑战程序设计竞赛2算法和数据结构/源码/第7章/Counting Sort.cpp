#include<iostream>
#include<cstdio>
#include<algorithm>
using namespace std;
const int maxx = 2000001;
const int maxnum = 10010;
int A[maxx], B[maxx];
int C[maxnum];

int main() {
    int n;
    scanf("%d", &n);

    //初始化C数组
    for (int i = 0; i < maxnum; i++)
        C[i] = 0;

    for (int i = 0; i < n; i++) {
        scanf("%d", &A[i + 1]);
        //计数到C数组
        C[A[i + 1]]++;
    }

    // 累加和
    for (int i = 1; i < maxnum; i++)
        C[i] += C[i - 1];

    for (int j = 1; j <= n; j++) {
        // 根据C[A[j]]确定A[j]存贮的下标，保存到B数组
        B[C[A[j]]] = A[j];
        // 存储下标往前移动
        C[A[j]] --;
    }
    for (int i = 1; i <= n; i++)
        printf("%d%c", B[i], i == n ? '\n' : ' ');

    return 0;
}
