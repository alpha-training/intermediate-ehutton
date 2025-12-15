tostr:{$[0=count x;"";0=t:type x;.z.s each x;t in -10 10h;x;string x]}

tonote:{-1_raze tostr[x],'"=",'tostr[y],'" "}

fromnote:(!/)("S*";"=")0:" " vs

fromnote2:(!/)"S= " 0:@