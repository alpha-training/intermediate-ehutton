N:20
trade:([]sym:N#`JPM`JPM`GE;side:N#`S`S`B`B`S`B;size:N#100 300 200 100 500 700 200)

addPos:{update pos:sums size*?[side=`B;1;-1] by sym from x}
