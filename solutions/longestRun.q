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
  a1:([]i:til count x;d:1=0N-':x); / table with index and boolean check
  b:exec i from a1 where not d; / keep only start indices
  len:1_deltas b,count x; / next start - current start
  m:first where len=max len; / index of the max length
  s:b m; / start of longest run
  l:len m;  / length of longest run
  x[s]+til l
 }
longestRun4:{
  a1:([]v:x;d:1=0N-':x); / table with index and boolean check do ind:i from a1 instead of til 
  a2:select from a1 where not (d=0)and 0=next d; / from where we just need to get where one run starts and another run ends
  a2:update ind:i from a2;
  a3:select from a2 where (d=0)or ind=max ind; / ALWAYS DO COND1,COND2. NEVER DO COND1 AND COND 2 
  a4:update l:0N-':ind from a3;
  d:exec v,l from a4 where l=max l;
  reverse (first d`l){x-1}\first d`v
 }

longestRun5:{[x]
    t:([] v:x;b:1=0N-':x);
    t2:select from t where b|next b,not[b]|not next b; / start and end points of runs
    t3:update spn:0N-':v from t2;
    t4:select from t3 where b=1;
    d:select from t4 where spn=max spn;
    V:first d`v;S:first d`spn;
    -S+V+1+til S
    }
/
longestRun4:{
  a1:([]v:x;d:1=0N-':x); / table with index and boolean check do ind:i from a1 instead of til 
  a1:update ind:i from a1;
  a2:delete from a1 where (d=0)and 0=next d; / from where we just need to get where one run starts and another run ends
  a3:select from a2 where (d=0)or 0=next d; / ALWAYS DO COND1,COND2. NEVER DO COND1 AND COND 2 
  a4:update l:0N-':ind from a3;
  a5:select from a4 where d=1;
  a6:select from a5 where l=max l
  reverse (first a6`l){x-1}\first a6`v
  }


/

s:exec v from a4 where not d;
e:exec v from a4 where d;


longestRun3:{ / longestRun5 x:3 1 2 9 4 8 3 4 5 6 1 4 2 3 4 5 6 7
    x:x,0;
    a1:([]1=0N-':x;ind:til count x);
    a1:delete from a1 where ((x=0) and 0=next x);
    s:exec ind from a1 where x=0;
    e:exec ind from a1 where (x=1) and 0=next x;
    m:s where l=n:max l:e-s; / index where max run starts
    x[first s where l=n]+til n+1

 }

/
Q:100 1000 10000 100000 1000000 10000000 100000000
{(longestRun[p]~longestRun2 p:x?30)} each Q

