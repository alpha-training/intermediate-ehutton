longestRun:{
    k:x where(next[x]=x+1)or prev[x]=x-1; / list of all runs  2 3 4 3 4 5 6 2 3 4 5 6 7
    s:where not prev[k]=k-1; / indices where the run starts
    L:1_(deltas s,count k); / lenght of each run
    e:1_(s-1),count[k]-1; / index where the run ends 
    (first k[s where L=max L])+til max 1+e-s

 }
