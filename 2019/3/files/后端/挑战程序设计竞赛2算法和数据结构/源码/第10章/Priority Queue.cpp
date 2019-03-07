#include <iostream>
#include <cstdio>
#include <algorithm>
using namespace std;
const int maxx = 2000000;
const int INF = 1 << 30;

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

int extract() 
{
    int maxv;
    if (n < 1)
        return -INF;
    maxv = A[1];
    A[1] = A[n--];
    maxHeapify(1);
    return maxv;
}

int insert(int key) {
    n++;
    int i = n;
    A[n] = -INF;
    if (key < A[i])
        return -INF;
    A[i] = key;
    while (i > 1 && A[i / 2] < A[i]) {
        swap(A[i], A[i / 2]);
        i /= 2;
    }

}
int main()
{
    char op[20];
    int k;
    while (scanf("%s", op) != EOF&&op[2] != 'd') {
        if (op[0] == 'i') {
            scanf("%d", &k);
            insert(k);
        }
        else {
            printf("%d\n", extract());
        }
    }
    return 0;
}
