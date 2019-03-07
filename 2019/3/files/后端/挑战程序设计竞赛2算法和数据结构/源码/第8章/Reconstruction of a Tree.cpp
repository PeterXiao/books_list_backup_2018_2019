#include<iostream>
#include<cstdio>
#include<algorithm>
#include<cmath>
#include<vector>
using namespace std;
vector<int> pre, in, post;
int pos;
int n, k;

void reconstruction(int left, int right) {
    // 遍历到叶结点
    if (left >= right)
        return;

    // 当前子树的根
    int root = pre[pos++];
    // 找出当前根的值在中序数组里的下标
    int m = distance(in.begin(), find(in.begin(), in.end(), root));

    reconstruction(left, m);
    reconstruction(m + 1, right);

    //存入到后序数组
    post.push_back(root);

}
void solve() {
    pos = 0;
    reconstruction(0, pre.size());
    for (int i = 0; i < n; i++) {
        printf("%d%c", post[i], i == n-1?'\n':' ');
    }
}

int main() {
    scanf("%d", &n);
    for (int i = 0; i < n; i++) {
        scanf("%d", &k);
        pre.push_back(k);
    }
    for (int i = 0; i < n; i++) {
        scanf("%d", &k);
        in.push_back(k);
    }
    solve();
    return 0;
}
