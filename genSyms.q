\l /home/ehutton/intermediate-alf/genSyms.q_

genSyms:{[n]
    raze `$enlist each ((n-1) {raze{x,/:enlist each .Q.A} each x}/ .Q.A)
 }

{0N!((genSyms x)~genSyms2 x)}each 1 2 3 4 5 / for testing
