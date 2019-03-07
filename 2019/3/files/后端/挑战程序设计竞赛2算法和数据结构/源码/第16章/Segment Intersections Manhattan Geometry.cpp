#include <iostream>
#include <cstdio>
#include <algorithm>
#include <vector>
#include <queue>
#include <cmath>
#include <set>
using namespace std;
#define EPS  (1e-10)
#define equals(a,b) (fabs((a) - (b)) < EPS)

// 点类
class Point {
public :
    double x, y;
    Point() {};
    Point(double x, double y) :x(x), y(y) {}

    Point operator + (Point p) { return Point(x + p.x, y + p.y); }
    Point operator - (Point p) { return Point(x - p.x, y - p.y); }
    Point operator * (double a) { return Point(x * a, y * a); }
    Point operator / (double a) { return Point(x / a, y / a); }

    bool operator < (const Point &p) const {
        return x != p.x ? x < p.x : y < p.y;
    }

    bool operator == (const Point &p) const {
        return fabs(x - p.x) < EPS && fabs(y - p.y) < EPS;
    }
};
// 线段类
class Segment {
public:
    Point p1, p2;
    Segment() {};
    Segment(Point p1, Point p2) :p1(p1), p2(p2) {};
};

#define BOTTOM 0
#define LEFT 1
#define RIGHT 2
#define TOP 3

class EndPoint {
public :
    Point p;
    int seg, st; // 线段的ID，端点的种类
    EndPoint() {}
    EndPoint(Point p, int seg, int st) :p(p), seg(seg), st(st) {}

    bool operator < (const EndPoint &ep) const {
        // 按y坐标升序排序
        if (p.y == ep.p.y) {
            return st < ep.st;
        }else {
            return p.y < ep.p.y;
        }
    }

};
EndPoint EP[2 * 1000010];

// 线段相交问题，曼哈顿几何
int manhattanIntersection(vector<Segment> S) {
    int n = S.size();
    //按照端点的y坐标升序排序
    sort(EP, EP + (2 * n));

    set<int> BT;            // 二叉搜索树
    BT.insert(10000000001); // 设置标记
    int cnt = 0;

    for (int i = 0; i < 2 * n; i++) {
        if (EP[i].st == TOP)
            BT.erase(EP[i].p.x); //删除上端点
        else if (EP[i].st == BOTTOM)
            BT.insert(EP[i].p.x);
        else if (EP[i].st == LEFT) {
            set<int>::iterator b = BT.lower_bound(S[EP[i].seg].p1.x);
            set<int>::iterator e = BT.upper_bound(S[EP[i].seg].p2.x);

            // 加上b到e距离
            cnt += distance(b, e);
        }

    }
    return cnt;
}
int main() {
    vector<Segment> S;
    Segment seg;
    int n , k = 0;
    scanf("%d", &n);
    for (int i = 0; i < n; i++) {
        scanf("%lf %lf %lf %lf", &seg.p1.x, &seg.p1.y, &seg.p2.x, &seg.p2.y);
        //调整端点p1、p2，保证左小右大
        if (seg.p1.y == seg.p2.y) {
            if (seg.p1.x > seg.p2.x)
                swap(seg.p1, seg.p2);
        }
        else if (seg.p1.y > seg.p2.y) {
            swap(seg.p1, seg.p2);
        }

        // 将水平线段添加到端点列表
        if (seg.p1.y == seg.p2.y) {
            EP[k++] = EndPoint(seg.p1, i, LEFT);
            EP[k++] = EndPoint(seg.p2, i, RIGHT);
        }
        else { // 将垂直线段添加到端点列表
            EP[k++] = EndPoint(seg.p1, i, BOTTOM);
            EP[k++] = EndPoint(seg.p2, i, TOP);
        }
        S.push_back(seg);
    }

    printf("%d\n", manhattanIntersection(S));
    return 0;
}