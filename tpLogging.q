

\p 5010

\d .u
/COLS_DICT:()!()
/COLS_DICT[`trade]:.schema.c.trade
/COLS_DICT[`quote]:.schema.c.quote


T:`trade`quote
N:100
S:`JPM`GE`IBM
C:T!(`time`sym`price;`time`sym`bid`ask)
l:0Ni / handle to the log file 
w:()!()

initLog:{L::`$":log/tp",string .z.d;
	if[10h=type @[get;L;{x}];L set ()] 
	if[not null l;
	   @[hclose;l;{x}]
	  ];
	l::hopen L;
	i::count get L;
 }

/Increment (.u.)i by 1
/Use .u.(C) to turn the incoming data into a table
/Write the data to the log file using .u.(l)


upd:{[t;x] 
  i+::1;
  tbl:flip .u.C!x;
  neg[l] string[L]," 0: \",\" 0:tbl";
 }

/ fill in your code from previous exercises

/ The values of the variables i and L as a two element list
/ The string "snapshot"
sub:{[t] 
    w[t]::distinct w[t],.z.w;
	:((i;L);"snapshot")
 }

/ take from elsewhere
.z.pc:{


 }

/ saves us having to use a dummy feed
.z.ts:{
	t:rand T;
	n:1+rand N;
	a:(n#.z.p;n?S),$[t=`trade;1#n;2#n]?\:100f;
	upd[t;a];
 }

initLog[];
/\t 1000