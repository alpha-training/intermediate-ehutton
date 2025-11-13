\e 1
\p 5009
\d .u

T:`trade`quote
N:100
S:`JPM`GE`IBM
C:T!(`time`sym`price;`time`sym`bid`ask)
l:0Ni / handle to the log file
w:()!()
initLog:{L::`$":log/tp",string[.z.d],".log";
    if[10h=type @[get;L;{x}];L set ()]
    if[not null l;
       @[hclose;l;{x}]
      ];
    l::hopen L;
    i::count get L;
 }
upd:{[t;x]
  i+::1;
  tbl:flip .u.C[t]!x;
  l enlist (`upd;t;tbl);
  /if[count w;.[; (t; tbl)] each value w]
 }

sub:{[t;s]
    w[.z.w]:(t;s);
    :((i;L);"snapshot")
 }

.z.pc:{
   delete x from `w 
 }

.z.ts:{
    t:rand T;
    n:1+rand N;
    a:(n#.z.p;n?S),$[t=`trade;1#n;2#n]?\:100f;
    upd[t;a]
 }

initLog[];

\t 1000