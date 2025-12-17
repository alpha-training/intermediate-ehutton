L:`:data/tp2025.03.01
loginfo:([table:`quote`trade]chunks:2#enlist 0N;rows:2#enlist 0N)

upd:{
    if[x=`quote;qc+:1;rq+:count first y];
    if[x=`trade;tc+:1;rt+:count first y];
 }

-11!(L);
update chunks:(qc,tc),rows:(rq,rt)from`loginfo;