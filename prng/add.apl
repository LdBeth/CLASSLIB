⍝ THIS FUNCTION REQUIRES DYALOG APL

∇R←A ADD B;C;N;I
  C←⌽A+B
  N←C>0
  R←((C=2)∨1,1↓|(¯1⌽N)-N)⊂C
  I←2=⊃¨R
  R[⍸I]←{(⍴⍵)⍴0}¨I/R
  OVERFLOW←''⍴⌽I
  I←(-⍴I)↑¯1↓I
  R[⍸I]←{1,((⍴⍵)-1)⍴0}¨I/R
  R←⌽∊R
∇
