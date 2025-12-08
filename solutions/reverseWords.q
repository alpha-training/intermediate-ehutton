reverseWords:{
  c:x value group sums differ x in punc:" !()-{}[]:;@?.,";
  c[where i]:reverse c where i:not first each c in punc;
  raze c
 }



/
c[where i]:reverse c where i:not first each c in punc

Reverse the words but not punctuation:


q)reverseWords "Hello, world! How are you?"
"you, are! How world Hello?"