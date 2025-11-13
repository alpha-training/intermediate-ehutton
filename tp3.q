/ tp2.q
\e 1
\p 5009
\l schema.q

\d .u
t:tables`.;
w:t!(); / `trade`quote!(((7i;`);(8i;`JPM`GE);(9i;enlist`IBM));enlist(9i;enlist`IBM))
l:0Ni;			/ handle to the log file, default to null
i:0;				/ number of updates received today, default to 0

ld:{[d]
    L::`$":log/tp",string[d],".log";
    if[not null l;
       @[hclose;l;{x}]
      ];
    if[10h=type @[get;L;{x}];L set ()];
    l::hopen L;
    i::count get L;
 }
 
upd:{[t;x] / upd[`trade;table_data]
    i+::1;
    c:key flip get t;
    if[not -12h=type first first x;
       x:flip .z.p,/:flip x;
	];
	pub[t;$[0>type first x;enlist;flip]c!x];
    l enlist (`upd;t;x);
 }
 
/ delete subscription
/ x=table name, y=handle
del:{w[x]::w[x] where not y=first each w[x]} 

/ select from table (only give subscriber what they want)
/ x=table data, y=sym(s) or `
sel:{
    $[y~enlist`;
       :x;
       :select from x where sym in y
     ]
 }
 
/ add subscription
/ x=table name, y=sym(s) or `
add:{w[x]::w[x],enlist(.z.w;y)}

pub:{[t;x]{[t;x;w]if[count x:sel[x]w 1;neg[first w](`upd;t;x)]}[t;x]each w t}

sub:{if[x~`;
        :sub[;y]each t];
        if[not x in t;'x]; / if table name not in all tables then crash with 'X
        del[x;.z.w];
        add[x;y]
 }

pc:{del[;x]each t}

end:{neg[union/[.u.w[;;0]]]@\:(`.u.end;x)}

tick:{
	t::tables`.;
    w::t!(); / `trade`quote!(((7i;`);(8i;`JPM`GE);(9i;enlist`IBM));enlist(9i;enlist`IBM))
	d::.z.d; / define d globally (as current date)
	ld d;	 / call ld
 }
.z.ts:{
    T:rand t;
    n:1+rand 1000;
    S:`AAPL`BP`COST`DIS`EBAY;
    a:(n#.z.p;n?S),$[T=`trade;1#n;2#n]?\:100f; / (enlist(n?S)),$[T=`trade;1#n;2#n]?\:100f
    upd[T;a];
 } 

\d .
.u.tick[]

/ trade:([] sym:5#`JPM`GOOG`MSFT;price:5?100f;time:.z.p+1+til 5)
/ quote:([] sym:5#`JPM`GOOG`MSFT;bid:5?100f;ask:5?100f;time:.z.p+1+til 5)
/
q).u.T:rand .u.t
q).u.n:1+rand 1000
q).u.S:`AAPL`BP`COST`DIS`EBAY;
q).u.a:(n#.z.p;n?S),$[T=`trade;1#n;2#n]?\:100f;
q).u.a:(.u.n#.z.p;.u.n?.u.S),$[.u.T=`trade;1#.u.n;2#.u.n]?\:100f;