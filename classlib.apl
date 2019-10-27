
∇DERR T
  ⍝ IF  T  IS FALSE, A MESSAGE IS PRINTED AND ALL ACTIVE
  ⍝ PROCEDURES ARE TERMINATED.
  →T/0
  'PROCEDURE DOMAIN ERROR'
  →
∇

∇W←SSORT V
  ⍝ SORTS A VECTOR INTO INCREASING ORDER AND REMOVES
  ⍝ DUPLICATES.
  DERR 1=⍴⍴V
  W←(1,(1↓W)>¯1↓W)/W←V[⍋V]
∇

∇T←K SSUB N;X
  ⍝ LISTS ALL K-ELEMENT SUBSETS OF  ⍳N. ORIGIN DEPENDENT.
  DERR∧/(K{⎕}0),(K≤N),(1=⍴K),(1=⍴N),(N={≤}N←,N),K={≤}K←,K
  →(∧/K≠0 1)/GENERAL
  T←((K!N),K)⍴⍳N
  →0
GENERAL:T←1+(K-1)SSUB N-1
  X←,T[;⎕IO]∘.>⍳N-1
  T←(X/(⍴X)⍴⍳N-1),T[X/,{í}((N-1),1×⍴T)⍴⍳1×⍴T;]
∇

NOTEST←0

∇A←N SCHV S;RS
  ⍝ COMPUTES THE CHARACTERISTIC VECTORS OF AN ARRAY OF INTEGER
  ⍝ VECTORS LISTING SUBSETS OF  ⍳N.  ORIGIN DEPENDENT.
  →NOTEST/BEGIN
  DERR∧/(N>0),(N=≤N),1=⍴N←,N
  DERR∧/(,S={≤}S),(,S{⎕}⎕IO),],S<⎕IO+N
  →(0<⍴⍴S)/BEGIN
  S←,S
BEGIN:A←(Nõõ/RS←∊1Ç∆S)∆0
  S←((õ/RS),∊1×∆S)∆S
  A[⎕IO+N{}((õ/⍴S)⍴(⍳1×⍴S)-⎕IO),[⎕IO-0.5],{í}S-⎕IO]←1
  A←(RS,N)⍴A
∇

∇T←SEQREL E;X;NT
  ⍝ TESTS IF E IS THE CHARACTERISTIC MATRIX OF AN
  ⍝ EQUIVALENCE RELATION ON  ⍳1×⍴E.  E  MUST BE A
  ⍝ SQUARE LOGICAL MATRIX.
  →NOTEST/BEGIN
  DERR∧/(2=⍴⍴E),(=/⍴E),,E∊0 1
BEGIN:→(~T←∧/(2⍴⎕IO)⍉E)/0
  NT←NOTEST
  NOTEST←1
  T←∧/,E=X∘.=X←SFEL E
  NOTEST←NT
∇

∇R←SFEL A
  ⍝ COMPUTES THE FIRST ELEMENTS IN THE SETS WHOSE
  ⍝ CHARACTERISTIC VECTORS ARE IN  A.
  ⍝ THE SETS MUST BE NONEMPTY.
  →NOTEST/BEGIN
  DERR(1≤⍴⍴A)∧∧/,∧/A
BEGIN:R←⎕IO++/∧\~A
∇

∇C←A ZXDIFF B
  ⍝ COMPUTES THE DIFFERENCE OF TWO ARRAYS OF INTEGER
  ⍝ POLYNOMIALS.
  C←A ZXSUM-B
∇

∇C←A ZXSUM B;M;D
  ⍝ COMPUTES THE SUM OF TWO ARRAYS OF INTEGER POLYNOMIALS.
  →NOTEST/BEGIN
  DERR∧/(,A={≤}A),,B={≤}B
  EXPANDV
BEGIN:M←(⍴A){©}⍴B
  C←(M×A)+M×B
  D←1{©©}/,+/∧\∨C≠0
  C←((¯1↓⍴C),D)×C
∇
