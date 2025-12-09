to24h:{
    t:(-18h)$first a:flip(0 8)_/:x; / 44
    p:a[1]like" PM"; / 20
    n:t within 12 12:59:59; / 34
    t:?[p&not n;t+12*3600;t]; / 59
    t:?[not[p]& n;t-12*3600;t]; / 58
    t
 }
