genS:{
    L:if[x=1;:`$'.Q.A;exit 1]
    `$(cross\)x#enlist .Q.A;
    (L 0):`$'.Q.A;
    :raze L
 }
/
genS:{
    L:$[x=1;`$'.Q.A;`$(cross\)x#enlist .Q.A];
    (L 0):`$'.Q.A;
    :raze L}

/ genSyms:{$[x=1;`$'.Q.A;`$(cross/)x#enlist .Q.A]}