/*实现队列功能*/
#include<iostream>
#include<cstdio>
#include<algorithm>
using namespace std;

const int maxx = 100000 + 10;
struct task {
    // 任务的名字和耗费的时间
    char name[100];
    int t;
};
task Queue[maxx];

// 指向队头和队尾的指针
int head, tail;


// 判断循环队列是否已满
bool isFull() {
    return head == (tail + 1) % maxx;
}

// 判断循环队列是否为空
bool isEmpty() {
    return head == tail;
}

// 将元素x添加到队列的末尾
void enqueue(task x) {
    Queue[tail] = x;
    // 循环队列
    tail = (tail + 1) % maxx;
}

// 返回队头元素并删除
task dequeue() {
    task x = Queue[head];
    // 循环队列
    head = (head + 1) % maxx;
    return x;
}
int main() {
    int n, q;
    scanf("%d %d", &n, &q);
    for (int i = 0; i < n; i++) {
        scanf("%s %d", Queue[i].name, &Queue[i].t);
    }
    // 当前已经有n个元素
    head = 0; tail = n;
    // 当前时间
    int nowtime = 0;
    while (!isEmpty()) {
        // 取出队头
        task u = dequeue();
        // 执行时间片 p 和 所需要时间u.t
        int c = min(q, u.t);
        // 任务执行了 c ms
        u.t -= c;
        // 当前时间加上c ms
        nowtime += c;
        // 任务还没做完，加入到队尾
        if (u.t > 0) {
            enqueue(u);
        }
        else { // 任务已经完成，打印出结果
            printf("%s %d\n", u.name, nowtime);
        }

    }
    return 0;
}
