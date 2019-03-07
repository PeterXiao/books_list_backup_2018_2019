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
// 圆类
class Circle {
public:
    Point c;
    double r;
    Circle() {};
    Circle(Point c, double r) :c(c), r(r) {}
};
// 定义向量
typedef Point Vector;
// 定义直线
typedef Segment Line;
// 定义多边形
typedef vector<Point> Polygon;

/***************************点、向量****************************/

double norm(Point p) { return p.x * p.x + p.y * p.y; }
double abs(Point p) { return sqrt(norm(p)); }

// 向量的内积
double dot(Point a, Point b) {
    return a.x * b.x + a.y * b.y;
}
// 向量的外积
double cross(Point a, Point b) {
    return a.x * b.y - a.y * b.x;
}

// 向量a，b是否正交 <==> 内积为0
bool isOrthogonal(Vector a, Vector b) {
    return equals(dot(a, b), 0.0);
}
bool isOrthogonal(Point a1, Point a2, Point b1, Point b2) {
    return equals(dot(a1 - a2, b1 - b2), 0.0);
}

// 向量a，b是否平行 <==> 外积为0
bool isParallel(Vector a, Vector b) {
    return equals(cross(a, b), 0.0);
}
bool isParallel(Point a1, Point a2, Point b1, Point b2) {
    return equals(cross(a1 - a2, b1 - b2), 0.0);
}

// 点p在线段s上的投影
Point project(Segment s, Point p) {
    Vector base = s.p2 - s.p1;
    double r = dot(p - s.p1, base) / norm(base);
    return s.p1 + base * r ;
}

//以线段s为对称轴与点p成线对称的点
Point reflect(Segment s, Point p) {
    return p + (project(s, p) - p) * 2.0;
}

// 点a到点b的距离
double getDistance(Point a, Point b) {
    return abs(a - b);
}

// 线段l和点p的距离
double getDistanceLP(Line l, Point p) {
    return abs( cross(l.p2 - l.p1, p - l.p1) / abs(l.p2 - l.p1) );
}

// 线段s与点p的距离
double getDistanceSP(Segment s, Point p) {
    if (dot(s.p2 - s.p1, p - s.p1) < 0.0)
        return abs(p - s.p1);
    if (dot(s.p1 - s.p2, p - s.p2) < 0.0)
        return abs(p - s.p2);
    return getDistanceLP(s, p);
}



/*************************线段********************************/
// 线段s1，s2是否正交 <==> 内积为0
bool isOrthogonal(Segment s1, Segment s2) {
    return equals(dot(s1.p2 - s1.p1, s2.p2 - s2.p1), 0.0);
}

// 线段s1，s2是否平行 <==> 外积为0
bool isParallel(Segment s1, Segment s2) {
    return equals(cross(s1.p2 - s1.p1, s2.p2 - s2.p1), 0.0);
}

// 逆时针方向ccw（Counter-Clockwise）
static const int COUNTER_CLOCKWISE = 1;
static const int CLOCKWISE = -1;
static const int ONLINE_BACK = 2;
static const int ONLINE_FRONT = -2;
static const int ON_SEGMENT = 0;

int ccw(Point p0, Point p1, Point p2) {
    Vector a = p1 - p0;
    Vector b = p2 - p0;
    if (cross(a, b) > EPS) return COUNTER_CLOCKWISE;
    if (cross(a, b) < -EPS) return CLOCKWISE;
    if (dot(a, b) < -EPS) return ONLINE_BACK;
    if (norm(a) < norm(b)) return ONLINE_FRONT;
    return ON_SEGMENT;
}

// 判断线段p1p2和线段p3p4是否相交
bool intersect(Point p1, Point p2, Point p3, Point p4) {
    return (ccw(p1, p2, p3) * ccw(p1, p2, p4) <= 0 &&
        ccw(p3, p4, p1) * ccw(p3, p4, p2) <= 0);
}

//判断线段s1和s2是否相交
bool intersect(Segment s1, Segment s2) {
    return intersect(s1.p1, s1.p2, s2.p1, s2.p2);
}

// 线段s1和线段s2的距离
double getDistance(Segment s1, Segment s2) {
    // 相交
    if (intersect(s1, s2))
        return 0.0;
    return min(min(getDistanceSP(s1, s2.p1), getDistanceSP(s1, s2.p2)),
        min(getDistanceSP(s2, s1.p1), getDistanceSP(s2, s1.p2)));
}

// 线段s1与线段s2的交点
Point getCrossPoint(Segment s1, Segment s2) {
    Vector base = s2.p2 - s2.p1;
    double d1 = abs(cross(base, s1.p1 - s2.p1));
    double d2 = abs(cross(base, s1.p2 - s2.p1));
    double t = d1 / (d1 + d2);
    return s1.p1 + (s1.p2 - s1.p1) * t;
}

/***************************圆****************************/

// 圆c和直线l的交点
pair<Point, Point> getCrossPoints(Circle c, Line l) {
    Vector pr = project(l, c.c);
    Vector e = (l.p2 - l.p1) / abs(l.p2 - l.p1);
    double base = sqrt(c.r * c.r - norm(pr - c.c));
    return make_pair(pr + e * base, pr - e * base);
}

// 圆c1和圆c2的交点
double arg(Vector p) { return atan2(p.y, p.x); }
Vector polar(double a, double r) { return Point(cos(r) * a, sin(r) * a); }

pair<Point, Point> getCrossPoints(Circle c1, Circle c2) {
    double d = abs(c1.c - c2.c);
    double a = acos((c1.r * c1.r + d * d - c2.r * c2.r) / (2 * c1.r * d));
    double t = arg(c2.c - c1.c);
    return make_pair(c1.c + polar(c1.r, t + a), c1.c + polar(c1.r, t - a));
}

/***************************多边形****************************/
// 点的内包
/*
    IN 2
    ON 1
    OUT 0
*/
int contains(Polygon g, Point p) {
    int n = g.size();
    bool x = false;
    for (int i = 0; i < n; i++) {
        Point a = g[i] - p, b = g[(i + 1) % n] - p;
        if (abs(cross(a, b)) < EPS && dot(a, b) < EPS) return 1;
        if (a.y > b.y) swap(a, b);
        if (a.y < EPS && EPS < b.y && cross(a, b) > EPS)
            x = !x;
    }
    return (x ? 2 : 0);
}
int cmp(Point A, Point B)                     //竖直排序  
{
    return (A.y<B.y || (A.y == B.y&&A.x<B.x));
}
// 凸包
Polygon andrewScan(Polygon s) {
    Polygon u, l;
    int len = s.size();
    if (len < 3) return s;


    // 以x，y为基准升序排序
    sort(s.begin(), s.end());
    // 将x值最小的两个点添加到u
    u.push_back(s[0]);
    u.push_back(s[1]);

    // 将x值最大的两个点添加到l
    l.push_back(s[len - 1]);
    l.push_back(s[len - 2]);

    // 构建凸包上部
    for (int i = 2; i < len; i++) {
        for (int j = u.size(); j >= 2 && ccw(u[j - 2], u[j - 1], s[i]) >= 0; j--) {
            u.pop_back();
        }
        u.push_back(s[i]);
    }
    // 构建凸包下部
    for (int i = len - 3; i >= 0; i--) {
        for (int j = l.size(); j >= 2 && ccw(l[j - 2], l[j - 1], s[i]) >= 0; j--) {
                l.pop_back();
        }
        l.push_back(s[i]);
    }

    reverse(l.begin(), l.end());
    for (int i = u.size() - 2; i >= 1; i--)
        l.push_back(u[i]);

    return l;
}
