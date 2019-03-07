#include<iostream>
#include<cstdio>
using namespace std;
const int MAX = 500000;
const int maxnum = 1000000010;

// 两个局部数组
int L[MAX / 2 + 2], R[MAX / 2 + 2];
int A[MAX], n;
long long cnt ;

// 排序和合并
void merge(int left, int mid, int right) {
    int n1 = mid - left;
    int n2 = right - mid;
    for (int i = 0; i < n1; i++) L[i] = A[left + i];
    for (int i = 0; i < n2; i++) R[i] = A[mid + i];

    // 两个局部数组最后添加一个比较大的数
    L[n1] = R[n2] = maxnum;
    int i = 0, j = 0;
    // 合并
    for (int k = left; k < right; k++) {
        if (L[i] <= R[j])
            A[k] = L[i++];
        else {
            A[k] = R[j++];
            cnt += n1 - i;
        }
    }
}
// 分割
void mergeSort(int left, int right) {
    if (left + 1 < right) {
        int mid = (left + right) / 2;
        mergeSort(left, mid);
        mergeSort(mid, right);
        merge(left, mid, right);
    }
}
int main() {

    scanf("%d", &n);
    for (int i = 0; i < n; i++)
        scanf("%d", &A[i]);

    mergeSort(0, n);
    printf("%lld\n", cnt);
    return 0;
}
