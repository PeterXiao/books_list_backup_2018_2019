#include<iostream>   
#include<cstdio>  
#include<algorithm>
#include<stack>
using namespace std;
const int maxx = 1410;

int H, W;
int buffer[maxx][maxx];
int T[maxx][maxx];
struct Rectangle { int height; int pos; };

int getLargestRectangle(int size, int height[]) {
    stack<Rectangle> S;
    int maxv = 0;
    // 使得栈顶元素必定大于最后元素，使得前面的值被计算进来
    height[size] = 0;

    for (int i = 0; i <= size; i++) {
        Rectangle rect;
        rect.height = height[i];
        rect.pos = i;
        // 当S为空
        if (S.empty())
            S.push(rect);
        // 栈顶的高度小于当前的高度
        else if (S.top().height < rect.height)
            S.push(rect);
        // 栈顶的高度大于当前的高度
        else if (S.top().height > rect.height) {
            int target = i;
            // 栈顶的高度大于等于当前的高度
            // 出现小于栈顶高度的代表pre.pos~i之间都存在高度为pre.height的干净瓷砖
            // 此时可以计算当前的面积
            while (!S.empty() && S.top().height >= rect.height) {
                Rectangle pre = S.top(); S.pop();
                // 长 * 宽
                int area = pre.height * (i - pre.pos);
                maxv = max(maxv, area);
                target = pre.pos;
            }
            // 加上前面的宽度（下标设置为之前的），以便后面有合适的瓷砖进行计算
            rect.pos = target;
            S.push(rect);
        }
    }
    return maxv;
}

int solve() {
    // 以行为直方图,计算纵向的干净长度
    for (int j = 0; j < W; j++) {
        for (int i = 0; i < H; i++) {
            if (buffer[i][j])
                T[i][j] = 0;
            else
                T[i][j] = (i > 0) ? T[i - 1][j] + 1 : 1;
        }
    }

    // 从行计算出当前行的最大面积
    int maxv = 0;
    for (int i = 0; i < H; i++)
        maxv = max(maxv, getLargestRectangle(W, T[i]));
    return maxv;
}
int main()
{
    scanf("%d %d", &H, &W);
    for (int i = 0; i < H; i++)
        for (int j = 0; j < W; j++)
            scanf("%d", &buffer[i][j]);

    printf("%d\n", solve());
    return 0;
}