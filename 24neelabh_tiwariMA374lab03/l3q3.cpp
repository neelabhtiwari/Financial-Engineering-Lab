#include<bits/stdc++.h>
using namespace std;

map<pair<double,double>,double> mp;

double recurse(double n,double mx,double S,double T,double r,double sig, double M,double u, double d,double p,double q,double dt){

  if(mp.find({mx,S})!=mp.end()) return mp[{mx,S}];

  if(n==M){
    mp[{mx,S}]=mx-S;
    return mx-S;
  }

  double up=recurse(n+1,max(mx,S*u),S*u,T,r,sig,M,u,d,p,q,dt);
  double dn=recurse(n+1,max(mx,S*d),S*d,T,r,sig,M,u,d,p,q,dt);
  double pc=(exp(-r*dt))*(p*up+q*dn);
  mp[{mx,S}]=pc;
  return pc;
}

double optprice(double S0,double T,double r,double sig, double M){
  double dt=T/M;
  double u=exp(sig*sqrt(dt)+(r-sig*sig/2)*dt);
  double d=exp(-sig*sqrt(dt)+(r-sig*sig/2)*dt);
  double p=(exp(r*dt)-d)/(u-d);
  double q=1-p;
  mp.clear();
  double ans=recurse(0,S0,S0,T,r,sig,M,u,d,p,q,dt);
  return ans;
}

int main(){
  double S0=100,T=1,r=0.08,sig=0.2;

  vector<double> m;
  m.push_back(20); m.push_back(25); m.push_back(50);

  for(int i=0;i<m.size();i++){
    cout<<"For "<<m[i]<<" - "<<optprice(S0,T,r,sig,m[i])<<endl;
  }

  return 0;
}
