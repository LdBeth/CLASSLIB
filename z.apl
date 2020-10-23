∇P←ZFACTOR N;Q;R;⎕IO
  ⍝ FACTORS A POSITIVE INTEGER INTO A PRODUCT OF PRIMES.
  ⍝ THE RESULT IS CORRECT IF  N  IS LESS THAN 2.5E9.
  DERR∧/(N=⌊N),(1≤N),1=⍴N←,N
  P←⍳⎕IO←0
  Q←2 3 5,R←,(30×⍳77⌊⌈(N*0.5)÷30)∘.+7 11 13 17 19 23 29 31
LOOP:→(0=⍴Q←(0=Q|N)/Q)/NEXT
  P←P,1↑Q
  →LOOP,N←⌊N÷Q[0]
NEXT:→(N=1)/0
  →((¯1↑R)≥50000⌊N*0.5)/END
  →(R[0]≠7)/GEN
  R←(∧⌿0≠7 11∘.|R)/R
GEN:Q←R←R+2310
  →LOOP
END:P←P,N
∇

∇C←A ZGCD B;⎕IO;RHO;M;U;V;I;Q;T
  ⍝ C  IS RETURNED AS THE ENTRY-BY-ENTRY GCD OF THE INTEGER
  ⍝ ARRAYS  A  AND  B.
  ⍝ THE VARIABLES r AND s EXPRESS C AS(r×A)+s×B.
  ⎕IO←1
  →NOTEST/BEGIN
  DERR∧/(,A=⌊A),,B=⌊B
  ⍝ TEST FOR CONFORMABILITY.
  EXPAND
  ⍝ REPLACE  A  AND  B  BY THEIR RAVELS AND
  ⍝ APPLY THE EUCLIDEAN ALGORITHM.
BEGIN:M←×/RHO←⍴A
  U←(3,M)⍴(×A),(M⍴0),|A←,A
  V←(⍴U)⍴(M⍴0),(×B),|B←,B
  I←⍳M
LOOP:→(0=⍴I←(V[3;I]≠0)/I)/END
  T←U[;I]-V[;I]×(3,⍴I)⍴⌊U[3;I]÷V[3;I]
  U[;I]←V[;I]
  V[;I]←T
  →LOOP
END:C←RHO⍴U[3;]
  r←RHO⍴U[1;]
  s←RHO⍴U[2;]
  ∇

∇C←A ZGCD0 B;RHO;T;I
  ⍝ COMPUTES INTEGER GCD''S WITH A MINIMUM AMOUNT OF
  ⍝ CHECKING AND WITHOUT EXPRESSING THE RESULT AS A
  ⍝ LINEAR COMBINATION OF THE ARGUMENTS.
  →NOTEST/BEGIN
  DERR∧/(,A=⌊A),,B=⌊B
  EXPAND
BEGIN:RHO←⍴A
  I←⌈⍴A←|,A
  B←|,B
LOOP:→(0=⍴I←(B[I]≠0)/I)/END
  T←B[I]|A[I]
  A[I]←B[I]
  B[I]←T
  →LOOP
END:C←RHO⍴A
∇

∇C←A ZQUOT B
  ⍝ COMPUTES THE INTEGER QUOTIENT OF TWO INTEGER ARRAYS.
  →NOTEST/BEGIN
  DERR∧/(,A=⌊A),,B=⌊B
BEGIN:C←(⌊A÷|B)××B
∇

∇C←A ZREM B
  ⍝ COMPUTES THE REMAINDER WHEN  B  IS DIVIDED BY  A.
  ⍝ BOTH ARRAYS MUST BE INTEGER.
  →NOTEST/BEGIN
  DERR∧/(,A=⌊A),,B=⌊B
BEGIN:C←(|A)|B
∇

∇C←A ZCHREM B;⎕IO;r;s;RHO;D;L;M;N;B1;B2;A1;F;E;X
  ⍝ SOLVES THE SIMULTANEOUS CONGRUENCE  C  CONGRUENT
  ⍝ TO THE I-TH CROSS SECTION OF  A  ALONG THE LAST AXIS
  ⍝ MODULO B[I]. THE VARIABLE B MUST BE A VECTOR AND
  ⍝ THE LCM OF THE COMPONENTS OF  B  IN COMPUTED AS  m.
  ⎕IO←1
  X←∧/(1=⍴⍴B),(1≤⍴⍴A),((¯1↑⍴A)=⍴B),(0<⍴B),,0≠B←|B
  DERR∧/X,(,B=⌊B),,A=⌊A
  A←((N←×/RHO←¯1↓⍴A),¯1↑⍴A)⍴A
LOOP:→(1=M←⍴B)/END
  L←B1×⌊B2÷D←(B1←E↑B)ZGCD B2←(-E←⌊M÷2)↑B
  DERR∧/,0=((⍴F)⍴D)|F←((N,-E)↑A)-A1←(N,E)↑A
  B←B[X←(E+1)×⍳M≠2×E],L
  A←(A[;X]),((⍴F)⍴L)|A1+(⌊F÷(⍴F)⍴D)×(⍴F)⍴r×B1
  →LOOP
END:m←B[1]
  C←RHO⍴A
∇

∇P←ZPRIMES N;⎕IO;Q;R
  ⍝ LISTS THE PRIMES UP TO N.
  ⎕IO←0
  DERR 1=⍴N←,N
  P←(N≥P)/P←2 3 5 7 11 13 17 19
  →(N≤22)/0
  Q←,(30×⍳⌈N÷30)∘.+7 11 13 17 19 23 29 31
  Q←(∧⌿0≠7 11 13 17 19∘.|Q)/Q
LOOP:→((0=⍴Q)∨N<(1↑Q)*2)/END
  P←P,R←(5⌊⍴Q)↑Q
  Q←(∧⌿0≠R∘.|Q)/Q
  →LOOP
END:P←(N≥P)/P←P,Q
∇

∇D←ZDET A;⎕IO;V;J;W;Q
  ⍝ COMPUTES THE DETERMINANT OF AN INTEGER MATRIX
  ⍝ USING INTEGER ROW OPERATIONS.
  DERR∧/(,A=⌊A),(2=⍴⍴A),=/⍴A
  D←⎕IO←1
  →(0=1↑⍴A)/0
LOOP:→(1=1↑⍴A)/END
BACK:→(∧/0=V←|A[;1])/ZERO
  J←V⍳⌊/(V≠0)/V
  →(J=1)/OK
  A[1,J;]←A[J,1;]
  D←-D
OK:→(∧/0=W←1↓A[;1])/ENDLP
  Q←0,(⌊W÷|A[1;1])××A[1;1]
  A←A-Q∘.×A[1;]
  →BACK
ENDLP:D←D×A[1;1]
  A←1 1↓A
  →LOOP
ZERO:→D←0
END:D←D×A[1;1]
∇

∇C←A ZLCM B
  ⍝ COMPUTES THE ENTRY-BY-ENTRY LCM OF THE
  ⍝ INTEGER ARRAYS  A  AND  B.
  C←(C≠0)×⌊(C←|A×B)÷A ZGCD0 B
∇

∇C←A ZLSYS B;⎕IO;M;D;Q;r;s
  ⍝ SOLVES LINEAR SYSTEMS OVER THE INTEGERS.
  ⍝ A  IS THE MATRIX OF COEFFICIENTS AND THE VECTORS
  ⍝ OF CONSTANT TERMS ARE THE VECTORS ALONG THE FIRST
  ⍝ AXIS OF  B.  THE ROWS OF THE GLOBAL ARRAY  w
  ⍝ ARE A BASIS FOR THE SOLUTIONS OF THE CORRESPONDING
  ⍝ HOMOGENEOUS SYSTEM.
  ⎕IO←1
  DERR∧/(2=⍴⍴A),(,A=⌊A),(,B=⌊B),(1≤⍴⍴B),(1↑⍴A)=1↑⍴B
  D←(M←+/D≠0)↑D←1 1⍉A←ZREDUCE A
  DERR∧/,0=(M,(¯1+⍴⍴B)⍴0)↓B←r+.×B
  w←⍉(0,M)↓s
  DERR∧/0=(Q←⍉(⌽⍴B)⍴D)|B←(M,1↓⍴B)↑B
  C←(((1↑⍴s),M)↑s)+.×⌊B÷Q
∇

∇B←ZREDUCE A;⎕IO;I;J;K;L;M;Q;D;Y;Z;X;V
  ⍝ REDUCES AN INTEGER MATRIX.  PRODUCES INVERTIBLE
  ⍝ INTEGER MATRICES  r  AND  s  SUCH THAT  B  IS
  ⍝ THE MATRIX PRODUCT OF  r,  A  AND  s.
  ⎕IO←0
  DERR∧/(2=⍴⍴A),,B=⌊B←A
  r←(K,K)⍴1,(K←1↑⍴B)⍴0
  s←(L,L)⍴1,(L←1↓⍴B)⍴0
  I←¯1
LOOPI:→(∧/0=D←|,(I,I←I+1)↓B)/0
  V←I+((⍴B)-I)⊤D⍳⌊/(D≠0)/D
  X←B[J←V[0];K←V[1]]
COL:→(∧/0=D←|X|B[;K])/ROW
  L←D⍳⌊/(D≠0)/D
  B[L;]←B[L;]-(Q←⌊(B[L;K]-X|B[L;K])÷X)×B[J;]
  r[L;]←r[L;]-Q×r[J;]
  X←B[J←L;K]
  →COL
ROW:→(∧/0=D←|X|B[J;])/GENERAL
  M←D⍳⌊/(D≠0)/D
  B[;M]←B[;M]-(Q←⌊(B[J;M]-X|B[J;M])÷X)×B[;K]
  s[;M]←s[;M]-Q×s[;K]
  X←B[J;K←M]
  →COL
GENERAL:→(∧/0=D←|X|,(I,I)↓B)/END
  V←I+((⍴B)-I)⊤D⍳⌊/(D≠0)/D
  B[L;]←B[L;]-(Q←¯1+⌊B[L←V[0];K]÷X)×B[J;]
  r[L;]←r[L;]-Q×r[J;]
  B[;M]←B[;M]-(Q←⌊(B[L;M]-X|B[L;M←V[1]])÷X)×B[;K]
  s[;M]←s[;M]-Q×s[;K]
  X←B[J←L;K←M]
  →COL
END:B[I,J;]←B[J,I;]
  r[I,J;]←r[J,I;]
  B[;I,K]←B[;K,I]
  s[;I,K]←s[;K,I]
  B[I;]←B[I;]××X
  r[I;]←r[I;]××X
  B[Y;]←B[Y;]-(Q←⌊B[Y←(I+1)↓⍳1↑⍴B;I]÷B[I;I])∘.×B[I;]
  r[Y;]←r[Y;]-Q∘.×r[I;]
  B[;Z]←B[;Z]-B[;I]∘.×Q←⌊B[I;Z←(I+1)↓⍳1↓⍴B]÷B[I;I]
  s[;Z]←s[;Z]-s[;I]∘.×Q
  →LOOPI
∇

∇B←ZROWREDUCE A;IO;I;J;K;L;D;E;F;X;Y;N;M
  ⍝ ROW REDUCES THE INTEGER MATRIX  A.  PRODUCES  r, AN
  ⍝ INVERTIBLE INTEGER MATRIX SUCH THAT  B  IS  r+.×A.
  ⍝ ALSO PRODUCES A VECTOR v LISTING THE COLUMNS CONTAINING
  ⍝ THE CORNER ENTRIES OF B.
  DERR∧/(2=⍴⍴A),,A=⌊A
  IO←⎕IO
  ⎕IO←1
  L←¯1↑⍴B←A
  r←(K,K)⍴1,(K←1↑⍴B)⍴0
  v←⍳I←J←0
LOOP:→((J≥K)∨L<I←I+1)/END
BACK:→(0=⍴D←(E≠0)/E←|J↓B[;I])/LOOP
  X←J+E⍳N←⌊/D
  F←((X≠Y←J↓⍳K)×J↓B[;I])ZQUOT B[X;I]
  B[Y;]←((J,0)↓B)-F∘.×B[X;]
  r[Y;]←((J,0)↓r)-F∘.×r[X;]
  →(1<+/0≠J↓B[;I])/BACK
  v←v,I
  B[J,X;]←B[X,J←J+1;]
  r[J,X;]←r[X,J;]
  B[J;]←B[J;]×M←×B[J;I]
  r[J;]←r[J;]×M
  F←B[Y←⍳J-1;I]ZQUOT B[J;I]
  B[Y;]←B[Y;]-F∘.×B[J;]
  r[Y;]←r[Y;]-F∘.×r[J;]
  →LOOP
END:v←v-1-⎕IO←IO
∇
