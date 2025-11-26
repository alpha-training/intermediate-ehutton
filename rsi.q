\l /data/alf/polygon/hdb/us_stocks_sip
hdb:select from bar1m where date within 2022.03.03 2022.03.10, sym = `AAPL;

\d .ta
CFG:`n`ku`kd!(5;2f;2f);
rsi:{[t]
  n:CFG`n
  alpha:1%n;
  t:update diff:close-prev close by sym from t;
  t:update avgGain:alpha ema 0|diff,avgLoss:alpha ema 0|neg diff by sym from t;
  t:update rsi:@[;til n;:;0n] 100*avgGain%(avgGain+avgLoss) by sym from t;
  delete diff, avgGain, avgLoss from t
 }


\d . 