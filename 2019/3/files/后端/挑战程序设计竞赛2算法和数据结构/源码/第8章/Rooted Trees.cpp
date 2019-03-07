#include<iostream>
#include<cstdio>
#include<algorithm>
#include<cmath>
using namespace std;
const int MAX = 100005;
const int NIL = -1;


struct Node {
    int p, l, r;
};
Node Tree[MAX];
int n, Depth[MAX];


void print(int u) {
    printf("node %d: ", u);
    printf("parent = %d, ", Tree[u].p);
    printf("depth = %d, ", Depth[u]);

    if (Tree[u].p == NIL)
        printf("root, ");
    else if (Tree[u].l == NIL)
        printf("leaf, ");
    else
        printf("internal node, ");

    printf("[");
    // 从子结点的最左边开始遍历
    int c = Tree[u].l;
    while (c != NIL) {
        printf("%d", c);
        if (Tree[c].r != NIL)
            printf(", ");
        // 跳到右侧紧邻的兄弟结点
        c = Tree[c].r;
    }
    printf("]\n");
}

// 递归得求深度
void rec(int u, int depth) {
    Depth[u] = depth;
    if (Tree[u].r != NIL)  // 右侧兄弟设置为相同深度
        rec(Tree[u].r, depth);
    if (Tree[u].l != NIL)  // 最左侧子结点的深度设置为自己的深度 + 1
        rec(Tree[u].l, depth + 1);
}
int main() {
    int n;
    scanf("%d", &n);

    for (int i = 0; i < n; i++) {
        Tree[i].p = Tree[i].l = Tree[i].r = NIL;
    }
    int v, num, c, l, root;
    for (int i = 0; i < n; i++) {
        // v是当前结点值 ，num是v结点的子结点数 
        scanf("%d %d", &v, &num);
        for (int j = 0; j < num; j++) {
            scanf("%d", &c);

            //设置最左侧结点 和 紧邻右侧兄弟结点
            // l记录的是上一个结点，将当前的结点设置为l的紧邻右侧结点
            if (j == 0)
                Tree[v].l = c;
            else
                Tree[l].r = c;
            l = c;
            // 设置父结点
            Tree[c].p = v;
        }
    }
    // 找出根结点
    for (int i = 0; i < n; i++) {
        if (Tree[i].p == NIL)
            root = i;
    }

    rec(root, 0);
    for (int i = 0; i < n; i++)
        print(i);
    return 0;
}
