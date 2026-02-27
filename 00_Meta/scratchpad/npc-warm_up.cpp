#include <bits/stdc++.h>
using namespace std;

using ll = long long;
map<string, ll> mp;

int main(){
  ios_base::sync_with_stdio(false);
  cin.tie(nullptr);

  ll t;
  cin >> t;

  string s;
  ll k;
  while(t--){
    cin >> s >> k;
    set<string> subs;
    for(int i = 1; i < 5; i++){
      if(s[i] == '0') continue;
      for(int j = i + 1; j < 5; j++){
        string t = s.substr(i, j-i+1);
        subs.insert(t);
      }
    }
    for(auto sub : subs){
      mp[sub] += k;
    }
  }
  
  ll mx = -1;
  string vac = "";
  for(auto e : mp){
    if(e.second > mx){
      mx = e.second;
      vac = e.first;
    } else if (e.second == mx){
      vac = (stoi(e.first) > stoi(vac)) ? e.first : vac;
    }
  }
  cout << "V" << vac;
}
