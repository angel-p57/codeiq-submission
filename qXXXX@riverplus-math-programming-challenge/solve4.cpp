#include <iostream>
#include <cstdint>
#include <queue>

struct myStepper {
  int64_t n,s;
  myStepper(int64_t nv,int64_t sv): n(nv),s(sv) {}
  myStepper next(void) { return myStepper(n+s,s); }
  bool operator<(const myStepper& obj) const { return n>obj.n; }
};

int64_t g(int64_t n) {
  std::priority_queue<myStepper> pq;
  pq.push(myStepper(2,5));
  pq.push(myStepper(3,5));
  int64_t ans=2;
  for ( int64_t i=2;i<=n;i++ ) {
    auto w=i*i+1;
    auto a=w;
    if ( i%2==1 )
      w/=2;
    while ( pq.top().n==i ) {
      auto t=pq.top();
      auto d=t.s;
      w/=d;
      while ( w%d==0 ) {
        w/=d;
        a/=d;
      }
      pq.pop();
      pq.push(t.next());
    }
    if ( w>1&&w-i<=n ) {
      pq.push(myStepper(w-i,w));
      if ( i+w<=n )
        pq.push(myStepper(i+w,w));
    }
    ans+=a;
  }
  return ans;
}

int main() {
  int64_t n=2000000;
  std::cout<<g(n)<<std::endl;
}
