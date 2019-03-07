#include<iostream>   
#include<cstdio>  
using namespace std;
typedef long long LL;

LL mod_pow(LL n, LL m, LL mod) {
    LL res = 1;
    while (m > 0) {
        if (m & 1)
            res = res * n % mod;
        n = n * n % mod;
        m >>= 1;
    }
    return res;
}
int main()
{
    LL n, m;
    LL mod = 1000000007;
    scanf("%lld %lld", &n, &m);
    printf("%d\n", mod_pow(n, m , mod));
    return 0;
}