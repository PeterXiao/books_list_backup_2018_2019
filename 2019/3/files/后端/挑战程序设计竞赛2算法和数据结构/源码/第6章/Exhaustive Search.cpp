#include<iostream>
#include<cstdio>
using namespace std;

int n, A[30];

// 递归穷举
bool solve(int i, int m) {
    // 已经找到得到m的组合方式
    if (m == 0)
        return true;
    // 已经穷举过A的全部元素了
    if (i >= n)
        return false;
    // 分别穷举 不选A[i] 和 选择A[i]的情况
    return solve(i + 1, m) || solve(i + 1, m - A[i]);
}
int main(){
    int t, M;
    scanf("%d", &n);
    for (int i = 0; i < n; i++) {
        scanf("%d", &A[i]);
    }
    scanf("%d", &t);
    for (int i = 0; i < t; i++) {
        scanf("%d", &M);
        if (solve(0, M))
            printf("yes\n");
        else
            printf("no\n");
    }
    return 0;
}
