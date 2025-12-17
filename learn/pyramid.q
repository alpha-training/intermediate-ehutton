
pyr:{first{y+(1_x)|(-1_x)}/[reverse x]}


/
In solutions/pyramid.q, write a function pyr to calculate the maximum path through a pyramid.

q)P:1+(1+til 5)?'10	/ generate a random pyramid
q)P
,7
4 9
5 9 1
2 1 6 2
3 3 1 4 9
q)
q)pyr P
35
q)type pyr P		
-7h					/ result is an atom, not a list
Needless to say, pyr should work for a pyramid of any size.