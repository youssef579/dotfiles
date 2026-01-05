// Problem: $(PROBLEM)
// Group: $(GROUP)
// URL: $(URL)

#include <bits/stdc++.h>
#include <ext/pb_ds/assoc_container.hpp>
#include <ext/pb_ds/tree_policy.hpp>

using namespace std;
using ll = long long;
using ld = long double;
using namespace __gnu_pbds;
template <class T>
using ordered_set = tree<T, null_type, std::less<T>, rb_tree_tag,
                         tree_order_statistics_node_update>;
template <class T>
using ordered_multiset = tree<T, null_type, std::less_equal<T>, rb_tree_tag,
                              tree_order_statistics_node_update>;

#define endl '\n'
#define MOD 1000000007
#define ALL(v) (v).begin(), (v).end()
#define fori(i, l, r) for (int(i) = (l); (i) < (r); (i)++)
#define SuperSonic                                                             \
  ios::sync_with_stdio(false), cin.tie(nullptr), cout.tie(nullptr)

void solve() {
  // @t to toggle testcases. @s to start SMASHING
}

int main() {
  SuperSonic;

  int t = 1;
  // cin >> t;
  while (t--) {
    solve();
  }
}
