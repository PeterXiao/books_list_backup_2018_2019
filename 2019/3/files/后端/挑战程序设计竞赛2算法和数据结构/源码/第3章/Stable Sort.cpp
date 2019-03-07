#include<iostream>
#include<cstdio>
#include<cmath>
using namespace std;

struct Card {
    char suit, value;
};
// 冒泡排序法
void bubble(struct Card A[], int n) {
    // 标记是否需要继续冒泡
    int flag = 1;
    for (int i = 0; flag; i++) {
        flag = 0;
        for (int j = n - 1; j >= i + 1; j--) {
            // 交换两个相邻的元素
            if (A[j].value < A[j - 1].value) {
                swap(A[j], A[j - 1]);
                flag = 1;
            }
        }
    }
}
// 选择排序法
void selection(struct Card A[], int n) {
    for (int i = 0; i < n; i++) {
        int minj = i;
        for (int j = i; j < n; j++) {
            if (A[j].value < A[minj].value)
                minj = j;
        }
        if (i != minj)
            swap(A[i], A[minj]);
    }
}
// 冒泡排序法是稳定排序，选择排序后的花色和其比较则可得知排序是否稳定的
bool isStable(struct Card C1[], struct Card C2[], int n) {
    for (int i = 0; i < n; i++) {
        if (C1[i].suit != C2[i].suit)
            return false;
    }
    return true;
}
// 打印输出
void print(struct Card C[], int n) {
    for (int i = 0; i < n; i++) {
        printf("%c%c%c", C[i].suit, C[i].value, i == n - 1 ? '\n' : ' ');
    }
}
int main() {
    Card C1[100], C2[100];
    int n;

    scanf("%d", &n);
    getchar();
    for (int i = 0; i < n; i++) {
        scanf("%c%c", &C1[i].suit, &C1[i].value);
        getchar();
        C2[i] = C1[i];
    }
    // 对于C1数列进行冒泡排序，对C2数列进行选择排序，然后比较两者排序后的花色
    // 则可得知选择排序是否稳定
    bubble(C1, n);
    selection(C2, n);

    print(C1, n);
    printf("Stable\n");
    print(C2, n);
    if (isStable(C1, C2, n))
        printf("Stable\n");
    else
        printf("Not stable\n");

    return 0;
}