#include<iostream>
#include<cstdio>
#include<cstring>
using namespace std;
typedef long long LL;
const LL maxx = 1000000 + 10;
char H[maxx][15];

// 将字符转换为数值
LL CharToInt(char ch) {
    if (ch == 'A') return 1;
    if (ch == 'C') return 2;
    if (ch == 'G') return 3;
    if (ch == 'T') return 4;
    return 0;
}

// 将字符串转成数值并生成key
long long getKey(char str[]) {
    LL sum = 0, p = 1;
    LL len = strlen(str);
    for (long long int i = 0; i < len; i++) {
        sum += p * CharToInt(str[i]);
        p *= 5;
    }
    return sum;
}

LL h1(LL key) {
    return key % maxx;
}
LL h2(LL key) {
    return 1 + (key % (maxx - 1));
}
// find 操作
bool find(char str[]) {
    LL key, h;
    key = getKey(str);
    for (LL i = 0;; i++) {
        h = (h1(key) + i * h2(key)) % maxx;
        //找到key
        if (strcmp(H[h], str) == 0) return true;
        // key不存在
        else if (strlen(H[h]) == 0) return false;
    }
    return false;

}
// insert操作
void insert(char str[]) {
    LL key, h;
    key = getKey(str);
    for (LL i = 0;; i++) {
        h = (h1(key) + i * h2(key)) % maxx;
        //找到key
        if (strcmp(H[h], str) == 0) return ;
        // key不存在
        else if (strlen(H[h]) == 0) {
            // 插入
            strcpy(H[h], str);
            return ;
        }
    }
}
int main() {
    int n, q, key;
    char str[20], op[20];
    for (int i = 0; i < maxx; i++)
        H[i][0] = '\0';
    scanf("%d", &n);
    for (int i = 0; i < n; i++) {
        scanf("%s %s", op, str);
        if (op[0] == 'i')
            insert(str);
        else {
            if (find(str))
                printf("yes\n");
            else
                printf("no\n");
        }
    }
    return 0;
}
