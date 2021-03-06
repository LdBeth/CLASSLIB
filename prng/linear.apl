∇R←LCG0 X
  ⍝ THE LINEAR CONGRUENTIAL RANDOM NUMBER
  ⍝ GENERATOR
  R←M|C+A×X
∇

∇R←K LCGG X;B;AK
  ⍝ GENERALIZED LCG0
  B←A-1
  AK←A*K
  R←M|((AK-1)×C÷B)+AK×X
∇

∇R←NAG X;C;A;M
  C←0
  A←13*13
  M←2*59
  R←LCG0 X
  R÷M
∇
