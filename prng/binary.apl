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

∇R←A ADD B;C;O
  ⍝ BINARY ADDITION
  →NOTEST/BEGIN
  DERR∧/(A=A=1)∧B=B=1
BEGIN:
  ⍝ RESET OVERFLOW
  OVERFLOW←0
LOOP:A←A+B
  ⍝ FIND CARRY
  C←1<A
  →(0=+/C)/END
  A[⍸C]←0
  ⍝ CHECK OVERFLOW
  OVERFLOW←OVERFLOW∨1=''⍴O
  B←(⍴C)↑1↓C
  →LOOP
END:
  R←A
∇
