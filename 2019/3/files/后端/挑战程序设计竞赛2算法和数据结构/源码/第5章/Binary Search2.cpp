/*利用STL的binary_search*/
#include<iostream>
#include<cstdio>
#include<algorithm>
using namespace std;
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
        if (binary_search(A, A + n, key))
            sum++;
    }
    printf("%d\n", sum);
}
