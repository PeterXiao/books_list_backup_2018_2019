/*利用STL的queue类*/
#include<iostream>
#include<cstdio>
#include<algorithm>
#include<queue>
using namespace std;

const int maxx = 100000 + 10;
struct task {
    // 任务的名字和耗费的时间
    char name[100];
    int t;
};
queue<task> Queue;

int main() {
    int n, q;
    scanf("%d %d", &n, &q);
    for (int i = 0; i < n; i++) {
        task t;
        scanf("%s %d", t.name, &t.t);
        Queue.push(t);
    }
    // 当前时间
    int nowtime = 0;
    while (!Queue.empty()) {
        // 取出队头
        task u = Queue.front();
        Queue.pop();
        // 执行时间片 p 和 所需要时间u.t
        int c = min(q, u.t);
        // 任务执行了 c ms
        u.t -= c;
        // 当前时间加上c ms
        nowtime += c;
        // 任务还没做完，加入到队尾
        if (u.t > 0) {
            Queue.push(u);
        }
        else { // 任务已经完成，打印出结果
            printf("%s %d\n", u.name, nowtime);
        }

    }
    return 0;
}
