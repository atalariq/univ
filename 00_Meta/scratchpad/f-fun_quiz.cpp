#include <bits/stdc++.h>
using namespace std;

using ll = long long;

const ll MOD = 1e9+7;
const ll INV = 500000004;

int main(){
  ios_base::sync_with_stdio(false);
  cin.tie(nullptr);

  ll N, S;
  cin >> N >> S;
  N %= MOD, S %= MOD;
  ll NS = (N * S) % MOD;
  ll ans = ((NS * (NS+1) % MOD) * INV) % MOD;
  ans -= ((N * (N-1) % MOD) * INV) % MOD;
  ans %= MOD;
  ans += (ans < 0) ? MOD : 0;
  cout << ans;
}
