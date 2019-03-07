#include <iostream>
#include <cstdio>
#include <cstring>
#include <algorithm>
using namespace std;
const int maxx = 1010;
int c[maxx][maxx];

int lcs(char s1[],char s2[]) {
    int m = strlen(s1), n = strlen(s2);
    for (int i = 1; i <= m; i++)
        c[i][0] = 0;
    for (int i = 1; i <= n; i++)
        c[0][i] = 0;

    for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
            if (s1[i] == s2[j])
                c[i+1][j+1] = c[i][j] + 1;
            else
                c[i+1][j+1] = max(c[i][j+1], c[i + 1][j]);
        }
    }
    return c[m][n];
}
int main()
{
    char s1[maxx], s2[maxx];
    int t;
    scanf("%d", &t);
    for (int i = 0; i < t; i++) {
        scanf("%s %s", s1, s2);
        printf("%d\n",lcs(s1,s2));
    }

    return 0;
}
