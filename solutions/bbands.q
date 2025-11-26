\l /data/alf/polygon/hdb/us_stocks_sip
hdb:select from bar1m where date within 2022.03.03 2022.03.10, sym = `AAPL;
\d .ta
CFG:`n`ku`kd!(5;2f;2f);

bbands:{[t]
  n:CFG`n;
  ku:CFG`ku;
  kd:CFG`kd;
  t:update sma:n mavg close,md:n mdev close by sym from t;
  t:update 
      sma:@[sma;til(n-1)&count i;:;0n], 
      md:@[md;til(n-1)&count i;:;0n] 
      by sym from t;
  t:update upperBB:sma+ku*md, lowerBB:sma-kd*md from t;
  delete md from t
 }
\d .
