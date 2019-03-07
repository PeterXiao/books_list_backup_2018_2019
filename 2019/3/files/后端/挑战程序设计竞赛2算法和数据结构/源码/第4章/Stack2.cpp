/*利用STL的stack类*/
#include<iostream>
#include<cstdio>
#include<stack>
using namespace std;

// 字符转数字
int CharToInt(char s[]) {
    int ans = 0, i = 0;
    while (s[i] != '\0') {
        ans = ans * 10 + s[i] - '0';
        i++;
    }
    return ans;
}

int main() 
{
    char s[1000];
    int a, b;
    stack<int> S;

    while(scanf("%s",s)!=EOF){
            if (s[0] == '+') {
                b = S.top(); S.pop();
                a = S.top(); S.pop();
                S.push(a + b);
            }else if (s[0] == '-') {
                b = S.top(); S.pop();
                a = S.top(); S.pop();
                S.push(a - b);
            }else if (s[0] == '*') {
                b = S.top(); S.pop();
                a = S.top(); S.pop();
                S.push(a * b);
            }else {
                S.push(CharToInt(s));
            }
    }
    printf("%d\n", S.top());

    return 0;
}