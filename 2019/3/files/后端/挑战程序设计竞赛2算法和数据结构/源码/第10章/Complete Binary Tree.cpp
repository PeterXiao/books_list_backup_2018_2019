#include <iostream>
#include <cstdio>
using namespace std;

// 分别求出结点i的父结点，左子结点、右子结点
int parent(int i) { return i / 2; }
int left(int i) { return 2 * i; }
int right(int i) { return 2 * i + 1; }
int main()
{
    int H[300];
    int n;
    scanf("%d", &n);
    for (int i = 1; i <= n; i++)
        scanf("%d", &H[i]);

    for (int i = 1; i <= n; i++) {
        printf("node %d: key = %d, ", i, H[i]);
        if (parent(i) >= 1)
            printf("parent key = %d, ", H[parent(i)]);
        if (left(i) <= n) 
            printf("left key = %d, ", H[left(i)]);
        if (right(i) <= n)
            printf("right key = %d, ", H[right(i)]);
        printf("\n");
    }
    return 0;
}
