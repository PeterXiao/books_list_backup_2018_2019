#include <iostream>
#include <algorithm>
#include <cstdio>
using namespace std;
const int INF = 1 << 30;
int main() {
    int n, m;
    int A[100];
    int T[50000 + 10];
    scanf("%d %d", &n, &m);
    for (int i = 0; i < m; i++)
        scanf("%d", &A[i]);
    for (int i = 0; i <= n; i++)
        T[i] = INF;
    T[0] = 0;
    for (int i = 0; i < m; i++) {
        for (int j = A[i]; j <= n; j++)
            T[j] = min(T[j], T[j - A[i]] + 1);
    }
    printf("%d\n", T[n]);
    return 0;
}
