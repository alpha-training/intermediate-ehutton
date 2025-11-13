\l schema.q

\d .u
t:tables`.
w:t!() / `trade`quote!(((7i;`);(8i;`JPM`GE);(9i;enlist`IBM));enlist(9i;enlist`IBM))

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
add:{w[x]::w[x],(.z.w;y)}

pub:{[t;x]{[t;x;w]if[count x:sel[x]w 1;neg[first w](`upd;t;x)]}[t;x]each w t}

sub:{if[x~`;:sub[;y]each t];if[not x in t;'x];del[x;.z.w];add[x;y]}

pc:{del[;x]each t}

end:{neg[union/[w[;;0]]]@\:(`.u.end;x)}

upd:{[t;x]
	c:key flip get t;	/ same as calling cols, but works from a child namespace
	pub[t;$[0>type first x;enlist;flip]c!x];
	}

.z.ts:{
    T:rand t;
    n:1+rand 1000;
    S:`AAPL`BP`COST`DIS`EBAY;
    a:(n#.z.p;n?S),$[T=`trade;1#n;2#n]?\:100f;
    upd[T;a];
 } 

\d .

/.event.add[`.z.pc;`.u.pc]; REMEMBER TO UNCOMMENT THIS 


/ trade:([] sym:5#`JPM`GOOG`MSFT;price:5?100f;time:.z.p+1+til 5)
/ quote:([] sym:5#`JPM`GOOG`MSFT;bid:5?100f;ask:5?100f;time:.z.p+1+til 5)
/
q).u.T:rand .u.t
q).u.n:1+rand 1000
q).u.S:`AAPL`BP`COST`DIS`EBAY;
q).u.a:(.u.n#.z.p;.u.n?.u.S),$[.u.T=`trade;1#.u.n;2#.u.n]?\:100f;