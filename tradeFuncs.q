tradeFill:{[size;orders] / tradeFill[20;4 8 6 4]
    rem:size{0|x-y}\orders;    / get remaining sizes
    pre:size,-1_rem;
    pre&'orders
 }

/ size {[x;y] x-y;:y} \ orders