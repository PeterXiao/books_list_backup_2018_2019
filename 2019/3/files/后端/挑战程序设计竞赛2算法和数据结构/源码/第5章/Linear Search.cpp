#include<iostream>
#include<cstdio>
using namespace std;

// 线性搜索
bool LinearSearch(int A[], int n, int key) {
    // 将key设置为数列最后一项
    A[n] = key;
    int i = 0;
    while (A[i] != key)
        i++;
    // 如果i不是n，则代表在原来的数列中找到key，
    // 否则代表原来数列中没有key，找到的是刚才插入到最后的元素
    return i != n;
}
int main() {
    int n, q, key;
    int sum = 0;
    int A[10000 + 10];
    scanf("%d", &n);
    for (int i = 0; i < n; i++)
        scanf("%d", &A[i]);
    scanf("%d", &q);
    for (int i = 0; i < q; i++) {
        scanf("%d", &key);
        if (LinearSearch(A, n, key))
            sum++;
    }
    printf("%d\n", sum);
}
