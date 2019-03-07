/*利用STL的list类*/
#include<iostream>
#include<cstdio>
#include<cstring>
#include<list>
using namespace std;

int main() {
    int n, key;
    char op[20];
    list<int> List;
    scanf("%d", &n);
    getchar();

    for (int i = 0; i < n; i++) {
        scanf("%s %d", op, &key);
        if (op[0] == 'i') {
            List.push_front(key);
        }
        else {
            if (strlen(op) > 6) {
                if (op[6] == 'F') {//删除头结点
                    List.pop_front();
                }
                else {//删除尾结点
                    List.pop_back();
                }
            }
            else { //删除结点
                for (list<int>::iterator it = List.begin(); it != List.end(); it++) {
                    if (*it == key) {
                        List.erase(it);
                        break;
                    }
                }
            }
        }
    }
    int flag = 0;
    for (list<int>::iterator it = List.begin(); it != List.end(); it++) {
        if (flag != 0)
            printf(" ");
        flag++;
        printf("%d", (*it));
    }
    printf("\n");
    return 0;
}
