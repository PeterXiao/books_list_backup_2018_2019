/*实现双向链表功能*/
#include<iostream>
#include<cstdio>
#include<cstdlib>
#include<cstring>
using namespace std;

const int maxx = 100000 + 10;
struct Node {
    int key;
    Node *prev, *next;
};

Node *nil;

// 链表初始化
void init() {
    nil = (Node *)malloc(sizeof(Node));
    //C++ nil = new Node();
    nil->next = nil;
    nil->prev = nil;
}

// 从链表搜索出值为key的结点 O(n)
Node* listSearch(int key) {
    // 从链表头结点开始访问
    Node *cur = nil->next;
    while (cur != nil && cur->key != key) {
        cur = cur->next;
    }
    return cur;
}

// 打印链表
void printList() {
    Node *cur = nil->next;
    int flag = 0;
    while (cur != nil) {
        if (flag++ > 0)
            printf(" ");
        printf("%d", cur->key);
        cur = cur->next;
    }
    printf("\n");
}

// 删除结点t
void deleteNode(Node *t) {
    // t为头结点不做处理
    if (t == nil)
        return;
    t->prev->next = t->next;
    t->next->prev = t->prev;
    free(t);
    //C++ delete(t);
}

// 删除头结点
void deleteFirst() {
    deleteNode(nil->next);
}

// 删除尾结点
void deleteLast() {
    deleteNode(nil->prev);
}

// 删除指定的key O(n)
void deleteKey(int key) {
    deleteNode(listSearch(key));
}

// 在链表头部添加元素key
void insert(int key) {
    Node *x = (Node *)malloc(sizeof(Node));
    //C++ Node *x = new Node();
    x->key = key;

    x->next = nil->next;
    nil->next->prev = x;
    nil->next = x;
    x->prev = nil;
}
int main() {
    int n, key, size = 0;
    char op[20];
    scanf("%d", &n);
    getchar();
    // 初始化链表
    init();
    for (int i = 0; i < n; i++) {
        scanf("%s %d", op, &key);
        if (op[0] == 'i') {
            insert(key);
            size++;
        }
        else {
            if (strlen(op) > 6) {
                if (op[6] == 'F') {//删除头结点
                    deleteFirst();
                }
                else {//删除尾结点
                    deleteLast();
                }
            }
            else { //删除结点
                deleteKey(key);
            }
            size--;
        }
    }
    printList();
    return 0;
}
