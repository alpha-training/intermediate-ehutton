longestRun:{
  d:1=1_deltas x;
  b:where 1b,not[d],1b; / where the runs are split
  length:-1+1_deltas b;
  m:first where length=max length; / index of the max length
  s:b[m]; / start if longest run
  l:length[m]+1; / +1 because deltas is 1 shorter than x
  x s+til l
 }