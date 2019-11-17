∇R←DECODE N
  R←2⊥N
∇

∇R←X ENCODE N
  R←(X⍴2)⊤N
∇

∇R←ENCODE32 N
  R←(32⍴2)⊤N
∇

∇R←ENCODE64 N
  R←(64⍴2)⊤N
∇

∇R←L EOR R
  R←1=L+R
∇

∇R←A ADD B;T;C
  ⍝ BINARY ADDITION
  DERR∧/(A=A=1)∧B=B=1
LOOP:R←A+B
  C←1<R
  →(0=+/C)/0
  A←R[⍸C]←0
  B←1↓(1+⍴C)↑C
  →LOOP
∇
