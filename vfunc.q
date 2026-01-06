t:([]sym:10#`JPM`JPM`IBM`JPM`BP;size:sums 10#1 2 -1 -1 2)
vfunc:{(x[0]each x[1]group y)[y]}

/
q)select from t where 4>vfunc[(avg;size);sym]
sym size
--------
JPM 1
JPM 3
IBM 2
JPM 1
JPM 4
JPM 6
IBM 5
JPM 4		/ BP is excluded

q)select from t where 1<vfunc[(first;size);sym]
sym size
--------
IBM 2
BP  3
IBM 5
BP  6		/ JPM is excluded
Constraint