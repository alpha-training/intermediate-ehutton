/ ca.q

Trade:([]date:1995.01.01 2000.01.02 2000.02.02 2000.03.02 2000.04.02 2000.05.01;sym:`IBM;price:100f;size:100)
Trade,:update sym:`JPM from Trade

CA:([]date:2000.01.01 2000.02.01 2000.03.01 2000.04.01;sym:`IBM;typ:`split`dividend`bonus`dividend;factor:.5 .98 .8 .97)
CA,:update sym:`JPM,factor-.01 from CA
adjust:{[x;types]
  s:distinct x`sym;
  ca:select from CA where sym in s;
  if[not types~`all;ca:select from ca where typ in types];
  ca:update cf:prds factor by sym from `sym`date xasc ca;
  r:aj[`sym`date;x;ca];
  r:r lj select tf:last cf by sym from ca;
  r:update 1^cf,1^tf,1^factor from r;
  r:update rfactor:tf%cf from r;           
  r:update price:price*rfactor,size:size%rfactor from r;
  r:delete tf,cf from r;
  l:reverse exec typ from r;
  update typ:reverse({$[y=`;y:x;y]}\)l from r / fill in null typ do we need this? do we want nulls filled in? how does it help us?
 }
/\l /home/ehutton/intermediate-alf/ca.q_
/
q)adjust[Trade;`dividend]
date       sym price size     typ      factor rfactor
-----------------------------------------------------
1995.01.01 IBM 95.06 105.1967 dividend 1      0.9506 
2000.01.02 IBM 95.06 105.1967 dividend 1      0.9506 
2000.02.02 IBM 97    103.0928 dividend 0.98   0.97   
2000.03.02 IBM 97    103.0928 dividend 0.98   0.97   
2000.04.02 IBM 100   100      dividend 0.97   1      
2000.05.01 IBM 100   100      dividend 0.97   1      
1995.01.01 JPM 93.12 107.3883 dividend 1      0.9312 
2000.01.02 JPM 93.12 107.3883 dividend 1      0.9312 
2000.02.02 JPM 96    104.1667 dividend 0.97   0.96   
2000.03.02 JPM 96    104.1667 dividend 0.97   0.96   
2000.04.02 JPM 100   100      dividend 0.96   1      
2000.05.01 JPM 100   100      dividend 0.96   1     
q)
q) 
q)adjust[select from Trade where sym=`JPM;`all]
date       sym price    size     typ      factor rfactor  
----------------------------------------------------------
1995.01.01 JPM 36.04675 277.4175 split    1      0.3604675
2000.01.02 JPM 73.5648  135.9346 split    0.49   0.735648 
2000.02.02 JPM 75.84    131.8565 dividend 0.97   0.7584   
2000.03.02 JPM 96       104.1667 bonus    0.79   0.96     
2000.04.02 JPM 100      100      dividend 0.96   1        
2000.05.01 JPM 100      100      dividend 0.96   1       