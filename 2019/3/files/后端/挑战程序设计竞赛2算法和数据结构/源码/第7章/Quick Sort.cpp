#include<iostream>
#include<cstdio>
#include<algorithm>
using namespace std;
const int MAX = 500000;

int A[MAX], n;
// 分割
int partition(int p, int r) {
    int x = A[r];
    int i = p - 1;
    for (int j = p; j < r; j++) {
        if (A[j] <= x) {
            i++;
            swap(A[i], A[j]);
        }
    }
    swap(A[i + 1], A[r]);
    return i + 1;
}
int main() {

    scanf("%d", &n);
    for (int i = 0; i < n; i++)
        scanf("%d", &A[i]);

    // 记录Ar的下标
    int p = partition(0, n - 1);

    for (int i = 0; i < n; i++) {
        if(i == p)
            printf("[%d]%c", A[i], i == n - 1 ? '\n' : ' ');
        else
            printf("%d%c", A[i], i == n - 1 ? '\n' : ' ');
    }
    return 0;
}
