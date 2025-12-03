\l /home/ehutton/intermediate-alf/longestRun.q_
longestRun:{
  d:1=trim 0N-':x;
  b:where 1b,not[d],1b; / where the runs are split, all indices where the runs are not 
  len:-1+trim 0N-':b;
  m:first where len=max len; / index of the max length
  s:b m; / start if longest run
  l:1+len m; / +1 because deltas is 1 shorter than x
  x s+til l
 }
longestRun3:{
  len:-1+trim 0N-':b:where 1b,not[1=trim 0N-':x],1b;
  s:b m:first where len=max len; / start if longest run
  x s+til 1+len m
 }

/
Q:100 1000 10000 100000 1000000 10000000 100000000
{longestRun[t]~longestRun2 t:x?30} each Q

