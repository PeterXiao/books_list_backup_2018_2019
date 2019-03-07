#include<iostream>
#include<cstdio>
#include<cmath>
using namespace std;

// 冒泡排序法
int bubbleSort(int A[], int n) {
    int cnt = 0;
    // 标记是否需要继续冒泡
    int flag = 1;
    for (int i = 0; flag; i++) {
        flag = 0;
        for (int j = n - 1; j >= i + 1; j--) {
            // 交换两个相邻的元素
            if (A[j] < A[j - 1]) {
                swap(A[j], A[j - 1]);
                flag = 1;
                cnt++;
            }
        }
    }
    return cnt;
}
int main() {
    int n, A[110];
    scanf("%d", &n);
    for (int i = 0; i < n; i++)
        scanf("%d", &A[i]);

    int cnt = bubbleSort(A, n);
    for (int i = 0; i < n; i++)
        printf("%d%c", A[i], i == n - 1 ? '\n' : ' ');
    printf("%d\n", cnt);
    return 0;
}