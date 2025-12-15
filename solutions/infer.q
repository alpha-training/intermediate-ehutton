infer:{
    if[type[x]in 0 98 99h;:.z.s each x];
    if[":"=first x;:`$x];
    safe:(x like"`*")or all(-1_x)in"0123456789-.+ :DT";
    if[safe;
      r:@[get;x;x];
      if[not r~x;:r]
    ];
    if[" "in x;:.z.s each " " vs x];
    x
 }
/
unit:enlist`s`result`expected!(::;::;::)
ufx:{`unit insert(enlist x;enlist infer x;enlist y);}
uf:{ufx[x;get x]}

uf"10"
uf"10f"
uf"10 20"
uf"1.5 7"
uf"5 6h"
uf"50 6f"
uf"23:59"
uf"2025.12.14"
uf"2025.12.14D20"
uf"2025.12.14D10 2025.12.14D11"
uf"`JPM"
uf"`JPM`GE"
uf"23:58 23:59"
uf"23:58:00 23:59"
ufx[":data/path";`:data/path]
ufx["data/path";"data/path"]
ufx["John123";"John123"]
ufx["exit 1";("exit";1)]
ufx[`size`price`sym!("10";"4.5";"`JPM");`size`price`sym!(10;4.5;`JPM)]
ufx[enlist`size`price`sym!("10";"4.5";"`JPM");enlist`size`price`sym!(10;4.5;`JPM)]

delete from`unit where s~'(::);

\c 200 200

if[count err:select from unit where not result~'expected;show err];