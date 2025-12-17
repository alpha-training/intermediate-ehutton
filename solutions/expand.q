tostr:{$[0=count x;"";0=t:type x;.z.s each x;t in -10 10h;x;string x]};

expand:{
  L:(where not x in .Q.an)_x;
  k:`$1_/:L;
  m:(L like"$*")&k in key .conf;
  L[where m]:tostr each .conf k where m;
  if[sum L like "$*";L:.[L;where L like "$*";:;"MISSING"]];
  raze L
 }

expand2:{
  if[not sum d:x="$";:x];
  a:where[d|not x in .Q.an]_x;
  raze@[a;where a like"$*";{$[(::)~r:.conf`$1_x;"MISSING";tostr r]}]
 }

/
expand"$data/procs/$name/$client"

.conf.data:"/disk01/dev"
q)q).conf.name:"tp0"