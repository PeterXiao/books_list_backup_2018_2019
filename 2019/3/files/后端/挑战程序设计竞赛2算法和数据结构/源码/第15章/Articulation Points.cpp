#include<cstdio>
#include<vector>
#include<algorithm>
using namespace std;
const int maxx = 100010;
int n, m, order = 0;
int low[maxx], dfn[maxx], father[maxx], son[maxx];
//father:父结点 son:子结点个数 
vector<int> cutpoint, edge[maxx];
vector< pair<int, int> > cutedge;

void tarjan(int u)
{
    dfn[u] = low[u] = ++order;
    bool flag = false;
    for (int i = 0; i<edge[u].size(); i++)
    {
        int v = edge[u][i];
        if (!dfn[v])
        {
            son[u]++;
            father[v] = u;
            tarjan(v);
            if (low[v] >= dfn[u]) flag = true;
            //点u为割点 
            if (low[v]>dfn[u]) cutedge.push_back(make_pair(min(v, u), max(v, u)));
            //边v-u为割边 
            low[u] = min(low[u], low[v]);
        }
        else if (v != father[u]) low[u] = min(low[u], dfn[v]);
    }
    //根节点若有两棵或两棵以上的子树则该为割点
    //非根节点若所有子树节点均没有指向u的祖先节点的回边则为割点
    if ((father[u] == 0 && son[u]>1) || (father[u] && flag)) cutpoint.push_back(u);
}

int main()
{
    scanf("%d%d", &n, &m);
    for (int i = 1; i <= m; i++)
    {
        int u, v;
        scanf("%d%d", &u, &v);
        edge[u+1].push_back(v+1), edge[v+1].push_back(u+1);
    }
    tarjan(1);
    sort(cutedge.begin(), cutedge.end());
    sort(cutpoint.begin(), cutpoint.end());

    int len = cutpoint.size();
    for (int i = 0; i< len; i++) 
        printf("%d\n", cutpoint[i]-1);
    return 0;
}
