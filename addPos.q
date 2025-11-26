N:20
trade:([]sym:N#`JPM`JPM`GE;side:N#`S`S`B`B`S`B;size:N#100 300 200 100 500 700 200)

addPos:{x:update pos:sums @[exec size from x;where `S=exec side from x;neg] from x}

/
where `S=exec side from trade      give inidces of -
where not `S=exec side from trade  gives indices of +