#include<iostream>  
#include<cmath>  
#include<cstdio>  
#include<cstring>  
#include<algorithm>  
using namespace std;
const int maxx = 1410;
int dp[maxx][maxx], G[maxx][maxx];

int getLargestSquare(int H, int W) {
    int maxWidth = 0;
    for (int i = 0; i < H; i++)
        for (int j = 0; j < W; j++) {
            dp[i][j] = (G[i][j] + 1) % 2;
            maxWidth |= dp[i][j];
        }

    for (int i = 1; i < H; i++)
        for (int j = 1; j < W; j++) {
            if (G[i][j]) {
                dp[i][j] = 0;
            }else {
                dp[i][j] = min(dp[i - 1][j - 1], 
                    min(dp[i][j - 1], dp[i - 1][j]) ) + 1;
                maxWidth = max(maxWidth, dp[i][j]);
            }
        }
    return maxWidth * maxWidth;
}
int main()
{
    int H, W;
    scanf("%d %d", &H, &W);
    for (int i = 0; i < H; i++)
        for (int j = 0; j < W; j++)
            scanf("%d", &G[i][j]);

    printf("%d\n", getLargestSquare(H, W));
    return 0;
}
