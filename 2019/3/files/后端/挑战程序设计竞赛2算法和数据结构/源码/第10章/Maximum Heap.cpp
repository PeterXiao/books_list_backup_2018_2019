#include <iostream>
#include <cstdio>
#include <algorithm>
using namespace std;
const int maxx = 2000000;

int A[maxx + 1];
int n;
void maxHeapify(int i) {

    int left = 2 * i, right = 2 * i + 1;
    int largest;

    // 从左子结点、自身、右子结点选出值最大的结点，然后继续往下递归
    if (left <= n && A[left] > A[i])
        largest = left;
    else
        largest = i;

    if (right <= n && A[right] > A[largest])
        largest = right;

    if (largest != i) {
        swap(A[i], A[largest]);
        maxHeapify(largest);
    }

}
int main()
{
    scanf("%d", &n);
    for (int i = 1; i <= n; i++)
        scanf("%d", &A[i]);

    for (int i = n / 2; i >= 1; i--)
        maxHeapify(i);
    for (int i = 1; i <= n; i++)
        printf(" %d", A[i]);
    printf("\n");
    return 0;
}
