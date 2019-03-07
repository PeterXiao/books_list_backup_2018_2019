#include<iostream>
#include<cstdio>
#include<cmath>
using namespace std;

// 打印数列A
void print(int A[],int n) {
    for (int i = 0; i < n; i++)
        printf("%d%c", A[i], i == n - 1 ? '\n' : ' ');
}
// 插入排序法
void insertsort(int A[], int n) {
    // 从第二个开始,往前找比当前的小的值，
    // 比当前值大的就往后移，知道找到小于等于A[i]的
    for (int i = 1; i < n; i++) {
        int j = i - 1;
        int v = A[i];
        while (j >= 0 && A[j] > v) {
            A[j + 1] = A[j];
            j--;
        }
        A[j + 1] = v;
        print(A, n);
    }
}
int main() {
    int n, A[110];
    scanf("%d", &n);
    for (int i = 0; i < n; i++)
        scanf("%d", &A[i]);
    print(A, n);
    insertsort(A, n);
    return 0;
}