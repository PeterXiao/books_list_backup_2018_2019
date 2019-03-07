#include<iostream>
#include<cstdio>
#include<cstring>
using namespace std;
typedef long long LL;
LL A[100000 + 10];
int n, k;
//模拟装货过程
bool check(LL P) {
    int cnt = k;
    for (int i = 0; i < n; ) {
        LL t = P;
        cnt--;
        // 卡车已经用完，证明卡车当前最大装载量不能装完货物
        if (cnt < 0)
            return false;
        while (i < n && t >= 0) {
            // 剩余重量可以装上当前货物
            if (t >= A[i])
                t -= A[i],i++;
            //装不下则用下一辆卡车去装
            if (t < A[i])
                break;
        }
    }
    return true;
}
// 二分找出P的最小值
LL BinarySearch(LL sum) {
    LL left = 0, right = sum;
    LL mid;
    while (left + 1 < right) {
        mid = (left + right) / 2;
        //可以装好货物
        if (check(mid))
            right = mid;
        else
            left = mid;
    }

    return right;
}
int main() {
    LL sum = 0;
    scanf("%d %d", &n, &k);
    for (int i = 0; i < n; i++) {
        scanf("%lld", &A[i]);
        sum += A[i];
    }
    LL P = BinarySearch(sum);
    printf("%lld\n", P);
    return 0;
}
