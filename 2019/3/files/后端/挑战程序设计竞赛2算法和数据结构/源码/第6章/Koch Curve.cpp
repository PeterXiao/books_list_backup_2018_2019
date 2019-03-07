#include<iostream>
#include<cstdio>
#include<cmath>
using namespace std;

const double PI = acos(-1.0);
struct Point{
    double x,y;
};

void koch(int n, Point a, Point b) {
    // 递归结束
    if (n == 0)
        return;
    // 三等分点s,t ，(u 是 s,t 上方的点)
    Point s, t, u;
    // 角度从度转成弧度
    double th = PI * 60.0 / 180.0;
    s.x = (2.0 * a.x + 1.0 * b.x) / 3.0;
    s.y = (2.0 * a.y + 1.0 * b.y) / 3.0;
    t.x = (1.0 * a.x + 2.0 * b.x) / 3.0;
    t.y = (1.0 * a.y + 2.0 * b.y) / 3.0;
    u.x = (t.x - s.x) * cos(th) - (t.y - s.y) * sin(th) + s.x;
    u.y = (t.x - s.x) * sin(th) + (t.y - s.y) * cos(th) + s.y;


    koch(n - 1, a, s);
    printf("%.8lf %.8lf\n", s.x, s.y);
    koch(n - 1, s, u);
    printf("%.8lf %.8lf\n", u.x, u.y);
    koch(n - 1, u, t);
    printf("%.8lf %.8lf\n", t.x, t.y);
    koch(n - 1, t, b);
}
int main(){
    Point a, b;
    int n;
    scanf("%d", &n);

    // 初始化
    a.x = a.y = 0;
    b.x = 100, b.y = 0;
    printf("%.8lf %.8lf\n", a.x, a.y);
    koch(n, a, b);
    printf("%.8lf %.8lf\n", b.x, b.y);
    return 0;
}
