#include<iostream>
#include<cstdio>
#include<cmath>
using namespace std;

// 选择排序法
int selectionSort(int A[], int n) {
    int cnt = 0;

    for (int i = 0; i < n; i++) {
        int minj = i;
        for (int j = i; j < n; j++) {
            if (A[j] < A[minj])
                minj = j;
        }
        if (i != minj)
            swap(A[i], A[minj]), cnt++;
    }
    return cnt;
}
int main() {
    int n, A[110];
    scanf("%d", &n);
    for (int i = 0; i < n; i++)
        scanf("%d", &A[i]);

    int cnt = selectionSort(A, n);
    for (int i = 0; i < n; i++)
        printf("%d%c", A[i], i == n - 1 ? '\n' : ' ');
    printf("%d\n", cnt);
    return 0;
}