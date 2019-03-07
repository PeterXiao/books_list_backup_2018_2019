#include<iostream>   
#include<cstdio>  
using namespace std;

int isPrime(int x) {
    if (x < 2)
        return 0;
    else if (x == 2)
        return 1;
    if (x % 2 == 0)
        return 0;
    for (int i = 3; i * i <= x; i += 2)
        if (x % i == 0)
            return 0;
    return 1;
}
int main()
{
    int n, t, cnt = 0;
    scanf("%d", &n);
    for (int i = 0; i < n; i++)
    {
        scanf("%d", &t);
        if (isPrime(t))
            cnt++;
    }
    printf("%d\n", cnt);
    return 0;
}
