#include<iostream>  
#include<cmath>  
#include<cstdio>  
#include<cstring>  
#include<algorithm>  
using namespace std;

const int INF = 1e9;
int dp[110000];//记录以a[i]结束的最长子序列的长度  
int a[110000];


int main()
{
    // freopen("in.txt","r",stdin);  
    int n;
    while (scanf("%d", &n) != EOF&&n)
    {
        for (int i = 0; i<n; i++)
            dp[i] = INF;
        for (int i = 0; i<n; i++)
            scanf("%d", &a[i]);

        int len = 0;
        for (int i = 0; i<n; i++)
        {
            *lower_bound(dp, dp + n, a[i]) = a[i];
        }
        printf("%d\n", lower_bound(dp, dp + n, INF) - dp);
    }
    return 0;
}
