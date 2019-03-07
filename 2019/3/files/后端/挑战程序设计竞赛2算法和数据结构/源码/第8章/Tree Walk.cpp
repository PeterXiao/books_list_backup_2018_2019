#include<iostream>
#include<cstdio>
#include<algorithm>
#include<cmath>
using namespace std;
const int MAX = 100005;
const int NIL = -1;


struct Node {
    int parent, left, right;
};
Node Tree[MAX];
int n;
//前序排序
void PreorderTreeWalk(int u) {
    if (u == NIL)
        return;
    printf(" %d", u);
    PreorderTreeWalk(Tree[u].left);
    PreorderTreeWalk(Tree[u].right);
}
//中序排序
void InorderTreeWalk(int u) {
    if (u == NIL)
        return;
    InorderTreeWalk(Tree[u].left);
    printf(" %d", u);
    InorderTreeWalk(Tree[u].right);
}
//后序排序
void PostorderTreeWalk(int u) {
    if (u == NIL)
        return;
    PostorderTreeWalk(Tree[u].left);
    PostorderTreeWalk(Tree[u].right);
    printf(" %d", u);
}


int main() {
    int n;
    int u, l, r, root;
    scanf("%d", &n);

    for (int i = 0; i < n; i++) {
        Tree[i].parent = Tree[i].left = Tree[i].right = NIL;
    }

    for (int i = 0; i < n; i++) {
        scanf("%d %d %d", &u, &l, &r);
        Tree[u].left = l;
        Tree[u].right = r;
        Tree[l].parent = u;
        Tree[r].parent = u;
    }
    for (int i = 0; i < n; i++) {
        if (Tree[i].parent == NIL)
            root = i;
    }
    printf("Preorder\n");
    PreorderTreeWalk(root);
    printf("\nInorder\n");
    InorderTreeWalk(root);
    printf("\nPostorder\n");
    PostorderTreeWalk(root);
    printf("\n");
    return 0;
}
