#include<iostream>
#include<cstdio>
#include<cmath>
using namespace std;

int main() {
    int n, t;
    int maxx, minn;
    scanf("%d", &n);
    scanf("%d", &t);
    maxx = -1000000001; minn = t;
    for (int i = 1; i < n; i++) {
        scanf("%d", &t);
        // 先更新当前的最大值
        maxx = maxx < t - minn ? t - minn : maxx;
        // 再更新当前最小值
        minn = minn > t ? t : minn;
    }
    printf("%d\n", maxx);
}