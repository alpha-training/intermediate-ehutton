myPar:{[dir;part;table] / myPar[`:db;.z.d;`trade]
    ` sv ($[type key h:` sv dir,`par.txt;
       `$":",h .q.mod[part;count h:read0 h];dir
     ];
    `$string part;table)
  }
