\l /data/alf/polygon/hdb/us_stocks_sip
hdb:select from bar1m where date within 2022.03.03 2022.03.10,sym=`AAPL;

\d .ta
CFG:`n`ku`kd!(5;2f;2f);
relativeStrength:{
  n:CFG`n;
  begin:n#0Nf;
  start:avg((n+1)#x);
  begin,start,{(y+x*(z-1))%z}\[start;(n+1)_x;n] 
  }

rsiMain:{[t]
  n:CFG`n;
  cl:t`close;
  d:cl-prev cl;
  rs:relativeStrength[d*d>0]%relativeStrength[abs d*d<0];
  update rsi:100*rs%(1+rs)from t
 }

\d .
/
/ 1. Load EmbedPy
\l p.q

/ 2. Initialize Python Environment
/ We must add 'src' to the path so Python can find your 'qtrader' package
sys: .p.import`sys
sys[`:path.append]"src"

/ 3. Import your Custom Module
/ This corresponds to src/qtrader/providers/yahoo/historical/rest.py
yhMod: .p.import`qtrader.providers.yahoo.historical.rest

/ 4. Wrapper Function
/ Valid intervals: "1m", "1h", "1d"
getHistory:{[ticker; days]
  
  / A. Instantiate the class
  client: yhMod[`:YahooHistorical][];
  
  / B. Call Python
  / We use 'pykw' for keyword arguments.
  / We ask for 'days' worth of data with '1h' interval.
  period: string[days],"d";
  pyDf: client[`:get_bars][ticker; `period pykw period; `interval pykw "1h"];
  
  / C. Fix Columns (The Critical Step)
  / yfinance returns MultiIndex columns (e.g. ('open', 'MSFT')).
  / EmbedPy chokes on this. We must flatten them to simple strings.
  cleanCols: ("time"; "sym"; "open"; "high"; "low"; "close"; "volume");
  pyDf[:; `columns] cleanCols;
  
  / D. Convert to q
  / We unkey (0!) to return a flat table
  0! .p.py2q pyDf
 };

/ --- Usage Example ---
/ q) \l yahoo.q
/ q) t: getHistory["MSFT"; 5]
/ q) show t