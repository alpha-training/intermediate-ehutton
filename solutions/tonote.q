tostr:{$[0=count x;"";0=t:type x;.z.s each x;t in -10 10h;x;string x]};

Intent:([]sym:10#`JPM`JPM`GE;strat:`$"strat",/:string 1+til 10;tgtpos:sums 10#500 -200 300)

tonote:{raze tostr[x],'"=",'tostr[y],'" "} / 583 "" sv intead of raze marginally slower 

tonote2:{" " sv tostr[x],'"=",'tostr[y]}
/
tonote:{ why is this one slower (680)
    a:tostr(x;y);
    "" sv a[0],'"=",'a[1],'" "
    }

q)select aggtgt:sum tgtpos,note:tonote[strat;tgtpos]by sym from Intent

