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
int n, Depth[MAX], Height[MAX];

int getDegree(int u) {
    int deg = 0;
    if (Tree[u].left != NIL)
        deg++;
    if (Tree[u].right != NIL)
        deg++;
    return deg;
}
void setDepth(int u, int depth) {
    if (u == NIL)
        return;
    Depth[u] = depth;
    setDepth(Tree[u].left, depth + 1);
    setDepth(Tree[u].right, depth + 1);
}

int setHeight(int u) {
    int h1 = 0, h2 = 0;
    if (Tree[u].left != NIL)
        h1 = setHeight(Tree[u].left) + 1;
    if (Tree[u].right != NIL)
        h2 = setHeight(Tree[u].right) + 1;
    return Height[u] = max(h1, h2);
}

int getSibling(int u) {
    if (Tree[u].parent == NIL)
        return NIL;
    //存在左兄弟
    if (Tree[Tree[u].parent].left != u && Tree[Tree[u].parent].left != NIL)
        return Tree[Tree[u].parent].left;
    //存在右兄弟
    if (Tree[Tree[u].parent].right != u && Tree[Tree[u].parent].right != NIL)
        return Tree[Tree[u].parent].right;
    return NIL;
}

void print(int u) {
    printf("node %d: parent = %d, sibling = %d, degree = %d, depth = %d, height = %d, "
        , u, Tree[u].parent, getSibling(u), getDegree(u), Depth[u], Height[u]);

    if (Tree[u].parent == NIL)
        printf("root\n");
    else if (Tree[u].left != NIL || Tree[u].right != NIL)
        printf("internal node\n");
    else
        printf("leaf\n");
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
    setHeight(root);
    setDepth(root, 0);
    for (int i = 0; i < n; i++)
        print(i);
    return 0;
}
