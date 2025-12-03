longestRun:{
  d:1=1_0N-':x;
  b:where 1b,not[d],1b; / where the runs are split, all indices where the runs are not 
  len:-1+1_deltas b;
  m:first where len=max len; / index of the max length
  s:b m; / start if longest run
  l:1+len m; / +1 because deltas is 1 shorter than x
  x s+til l
 }