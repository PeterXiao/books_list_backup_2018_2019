#include<iostream>   
#include<cstdio>  
using namespace std;

int gcd(int x, int y) {
    return y ? gcd(y, x % y): x;
}
int main()
{
    int x, y;
    scanf("%d %d", &x, &y);
    printf("%d\n", gcd(x, y));
    return 0;
}