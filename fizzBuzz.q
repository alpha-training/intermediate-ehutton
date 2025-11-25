fizzBuzz:{
    k:1+til x;
    i:(0=k mod 3)+2*(0=k mod 5);
    L:``Fizz`Buzz`Fizzbuzz;
    L:L[i];
    (k)!((`$ string k)^L)
 }
