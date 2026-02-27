#include <bits/stdc++.h>
using namespace std;

int main(){
  int x;
  cin >> x;
  cout << x;

  int res = 65 / (x * 1.1) + 80 / (x * 1.6) + 25 / (x *1.5);
  cout << fixed << setprecision(2) << res;
}
