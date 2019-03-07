#include<iostream>
#include<cstdio>
#include<vector>
using namespace std;

//g数组
vector<int>G;
long long cnt;
int A[1000000 + 10];

// 间隔为g的插入排序
void insertionSort(int A[], int n, int g) {
    for (int i = g; i < n; i++) {
        int v = A[i];
        int j = i - g;
        while (j >= 0 && A[j] > v) {
            A[j + g] = A[j];
            j -= g;
            cnt++;
        }
        A[j + g] = v;
    }
}
//希尔排序
void shellsort(int A[], int n) {
    for (int i = G.size() - 1; i >= 0; i--) {
        insertionSort(A, n, G[i]);
    }
}

// 生成g数组
void getArray(int n) {
    for (int h = 1; h <= n;) {
        G.push_back(h);
        h = 3 * h + 1;
    }
}


int main() {

    int n;
    scanf("%d", &n);
    for (int i = 0; i < n; i++)
        scanf("%d", &A[i]);
    getArray(n);
    shellsort(A,n);

    int len = G.size();
    printf("%d\n", len);
    for (int i = len - 1; i >= 0; i--)
        printf("%d%c", G[i], i == 0 ? '\n' : ' ');
    printf("%lld\n", cnt);
    for (int i = 0; i < n; i++)
        printf("%d\n", A[i]);
    return 0;
}
