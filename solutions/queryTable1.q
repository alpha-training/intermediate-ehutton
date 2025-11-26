/ queryTable1.q
N:10;
trade:([]date:2025.11.01+asc N?N;sym:N?`JPM`GE`IBM;size:100*1+N?10);

queryTable:{[t;c] / queryTable[delete date from trade;((in;`date;2025.11.02 2025.11.03);(=;`sym;enlist`JPM))]
  if[(hasDate:`date in cols t) and not any dateCons:`date=c[;1]; 
    '"A date constraint must be present"
    ];
  if[not hasDate; 
    c:c where not dateCons
    ];
  ?[t;c;0b;()]
 };