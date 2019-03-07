/*实现二分搜索*/
#include<iostream>
#include<cstdio>
using namespace std;

// 二分搜索
bool BinarySearch(int A[], int n, int key) {
    int left = 0 , right = n, mid;

    while (left < right) {
        mid = (left + right) / 2;
        if (key == A[mid])
            return true;

        if(key > A[mid])
            left = mid + 1;
        if (key < A[mid])
            right = mid;
    }
    return false;

}
int main() {
    int n, q, key;
    int sum = 0;
    int A[100000 + 10];
    scanf("%d", &n);
    for (int i = 0; i < n; i++)
        scanf("%d", &A[i]);
    scanf("%d", &q);
    for (int i = 0; i < q; i++) {
        scanf("%d", &key);
        if (BinarySearch(A, n, key))
            sum++;
    }
    printf("%d\n", sum);
}
