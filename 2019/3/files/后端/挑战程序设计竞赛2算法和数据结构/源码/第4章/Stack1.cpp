/*实现栈的功能*/
#include<iostream>
#include<cstdio>
using namespace std;

// 实现栈的功能

// top是指向栈顶的指针， s是实现栈结构的数组
int top, S[1000];

// 将x压入栈的操作
void push(int x) {
    // top加1之后将元素插入到top所指的位置
    S[++top] = x;
}

// 将栈顶元素返回并删除
int pop() {
    top--;
    return S[top + 1];
}

// 字符转数字
int CharToInt(char s[]) {
    int ans = 0, i = 0;
    while (s[i] != '\0') {
        ans = ans * 10 + s[i] - '0';
        i++;
    }
    return ans;
}
int main() {
    char s[1000];
    int a, b;
    // 清空栈
    top = 0; 
    while(scanf("%s",s)!=EOF){
            if (s[0] == '+') {
                b = pop();a = pop();
                push(a + b);
            }else if (s[0] == '-') {
                b = pop(); a = pop();
                push(a - b);
            }else if (s[0] == '*') {
                b = pop(); a = pop();
                push(a * b);
            }else {
                push(CharToInt(s));
            }
    }
    printf("%d\n",pop());

    return 0;
}