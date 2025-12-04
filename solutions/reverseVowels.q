reverseVowels:{
    c:where x in "AEIOU";
    l:where x in "aeiou";
    x[v]:x reverse v:where x in "AEIOUaeiou";
    x[c]:upper x c;
    x[l]:upper x l;
    :x 
 }
