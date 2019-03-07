#include <iostream>
#include <cstdio>
using namespace std;

int main()
{
    int F[45],n;
    F[0] = F[1] = 1;
    for (int i = 2; i <= 44; i++)
        F[i] = F[i - 1] + F[i - 2];
    scanf("%d", &n);
    printf("%d\n", F[n]);
    return 0;
}
