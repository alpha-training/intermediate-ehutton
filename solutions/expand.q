tostr:{$[0=count x;"";0=t:type x;.z.s each x;t in -10 10h;x;string x]};

.conf.data:"/disk01/dev"
.conf.name:"tp0"

expand:{ / total time 290. the ssrs take 250
    x:ssr[x;"$data";.conf.data];
    x:ssr[x;"$name";.conf.name];
    if[sum x="$";a:"/" vs x;
        a first where a like "$*":"MISSING";
        x:(raze/)"/",/:1_a];
    x
 }

/
q)expand"test"
"test									/ no effect, as no $
q)expand"$data"
"/disk01/dev"							
q)expand"$data/procs/$name"
"/disk01/dev/procs/tp0"
q)expand"$data/procs/$name/$client"
"/disk01/dev/procs/tp0/MISSING"			/ handles undefined
q)expand"$data/procs/$name.csv"
"/disk01/dev/procs/tp0.csv				/ handles breaks
q)expand"$data/procs/$name-dev.csv"
"/disk01/dev/procs/tp0-dev.csv