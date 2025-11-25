\l /data/alf/polygon/hdb/us_stocks_sip
hdb:select from bar1m where date within 2022.03.03 2022.03.10, sym = `AAPL;

\d .ta
CFG:`n`ku`kd!(5;2f;2f);
rsi:{[t]
  n:CFG`n;
  a:1%n;
  t:update change:close-prev close by sym from t;
  t:update rsi:@[;til n;:;0n] 100-100%1+(a ema 0|change)%(a ema 0|neg change) by sym from t;
  delete change from t;
  t
 }


\d . 