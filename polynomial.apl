⍝ FIXME: This function seems broke on recent APL's.
∇X←P DARV A;NA;RA;M;K
  ⍝ PRODUCES THE CHARACTER ARRAY DISPLAYING AN ARRAY
  ⍝ OF REAL VECTORS WITH P DECIMAL PLACES.
  X←''
  →(0=NA←×/RA←⍴A)/0
  M←1⌈¯1↓¯2×RA
  K←¯1↑⍴X←P⍕(NA,1)⍴A
  X←((×/¯1↓RA),K×¯1↑RA)⍴X
  X←(0 2+⍴X)↑X
  X←((¯2↓RA),M×¯1↑⍴X)⍴X
∇

∇X←DAZV A
  ⍝ PRODUCES THE CHARACTER ARRAY DISPLAYING AN ARRAY
  ⍝ OF INTEGER VECTORS OR REAL VECTORS ROUNDED TO THE
  ⍝ NEAREST INTEGER.
  X←''
  →(0=×/⍴A)/0
  X←0 DARV A
∇

∇C←A RXSUM B;M;D
  ⍝ COMPUTES THE SUM OF TWO ARRAYS OF REAL POLYNOMIALS.
  →NOTEST/BEGIN
  EXPANDV
BEGIN:M←(⍴A)⌈⍴B
  C←(M↑A)+M↑B
  C←C×(|C)≥EPSILON×⌈/,|C
  D←1⌈⌈/,+/∧\∨0≠C
  C←((¯1↓⍴C),D)↑C
∇
