#include<iostream>
#include<cstdio>
#include<cstring>
#include<vector>
#include<stack>
#include<algorithm>
using namespace std;

int main() {
    stack<int> S1;
    stack<pair<int, int> >S2;
    char s[20000 + 10];
    scanf("%s", s);
    int i = 0, sum = 0;
    while (s[i] != '\0') {
        // 若是\则压入栈
        if (s[i] == '\\')
            S1.push(i);
        else if (s[i] == '/' && !S1.empty()) {
            int j = S1.top(); S1.pop();
            // 加上新形成的面积
            sum += i - j;
            int a = i - j;

            // 同一块的合在一起
            while (!S2.empty() && S2.top().first > j) {
                a += S2.top().second; S2.pop();
            }
            S2.push(make_pair(j, a));
        }
        i++;
    }

    vector<int> ans;
    while (!S2.empty()) {
        ans.push_back(S2.top().second);
        S2.pop();
    }
    printf("%d\n", sum);
    int len = ans.size();
    printf("%d", len);
    for (int i = len - 1; i >= 0; i--) {
        printf(" %d", ans[i]);
    }
    printf("\n");
    return 0;
}
