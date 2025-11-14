lib:`$"shared/myc_",string .z.o
ctil:lib 2:(`ctil;1)

til[5]~ctil 5

\

Linux
gcc -shared -fPIC -DKXVER=3 myc.c -o shared/myc_l64.so

Mac
gcc -bundle -fPIC -DKXVER=3 -undefined dynamic_lookup myc.c -o shared/myc_m64.so
