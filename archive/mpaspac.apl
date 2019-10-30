#!/usr/local/bin/apl --script
 ⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝
⍝
⍝ mp 2019-10-30  13:25:12 (GMT-7)
 ⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝

∇ANCESTR X;A;H
 ⍝ For a function with name X , ANCESTR produces the names of functions
 ⍝ called by X and listed in the line beginning with '⍝ 888'
 ⎕←(⍕⍉(1,(⍴A))⍴A←H/⍳1↑⍴A),(H←∧/A[;⍳5]=((1↑⍴A),5)⍴'⍝ 888')⌿A←1 0↓⎕CR X
∇

∇Z←X BIGRED Y;I
 ⍝  Z is the inverse mod X of the product ×/Y of the members of Y
 ⍝ 888 TINVERTP
 Z←X|Y[I←1]
 REK:→((⍴Y)<I←I+1)/END
 Z←X|Z×Y[I]
 →REK
 END:Z←X TINVERTP Z
∇

∇Z←CAU X;A
 Z←(1↓X)+0.5×A×(1+A←+/X)
 ⍝ Cauchy's pairing function.
 ⍝DT 1.6.88
∇

∇DERR T
 →T/0
 'input: domain error'
 →
∇

∇DESCRIBE;A;I;⎕IO;R
 I←∼⎕IO←1
 ABSTRACT
 ⎕TC[2],'Press RETURN to move to the next function',⎕TC[2]
 L1:→('ABSTRACT'∧.=8↑A←(⎕NL 3)[I←I+1;])/LA
 →('DESCRIBE'∧.=8↑A)/LA
 →('COMPOSE'∧.=7↑A)/LA
 →('EDLIN'∧.=5↑A)/LA
 →('TITLEC'∧.=6↑A)/LA
 →('EDWORD'∧.=6↑A)/LA
 →('TIME'∧.=4↑A)/LA
 →('APL_ON'∧.=6↑A)/LA
 →('APL_OFF'∧.=7↑A)/LA
 R←⎕CR A
 (¯1+R[1;]⍳';')↑,R[1;]
 79⍴'∼'
 0 1↓(A[;1]='⍝')⌿A←1 0↓R
 ⍞
 LA:→(I<1↑⍴⎕NL 3)/L1
 ⍝ Function printing the commentary lines (lines starting with ⍝ ) of all
 ⍝ functions in the WS with exception of those named in [4-12] .
 ⍝DT 1.12.86
∇

∇Z←ENT R;B
 ⍝  Z entsteht aus der numerischen Grösse R durch Auf- resp.
 ⍝  Abrunden der Glieder zu ganzen Zahlen; ⍴Z = ⍴R !
 Z←((∼B)×⌈R)+(B←0.5≤(⌈R)-R)×⌊R
∇

∇Y←FAC21 X;J;S;V
 ⍝ ⍞-algorithm 44a by R.Holmes for factorization
 ⍝ 888  VMUL7
 Y←0⍴0
 TRY2:Y←Y,(J←0=2|X)⍴2
 →((1=X←X÷1+J),J)/(PRT,TRY2)
 TRY3:Y←Y,(J←0=3|X)⍴3
 →((1=X←X÷1+J×2),J)/(PRT,TRY3)
 TRY5:Y←Y,(J←0=5|X)⍴5
 →((1=X←X÷1+J×4),J)/(PRT,TRY5)
 TRY7:Y←Y,(J←0=7|X)⍴7
 →((1=X←X÷1+J×6),J)/(PRT,TRY7)
 V←VMUL7
 SET:S←(|X)⋆0.5
 TES:→(V[1]>S)/TE1
 →(49=J←(V|X)⍳0)/REK
 →SET,(Y←Y,V[J]),X←X÷V[J]
 REK:→TES,V←V+210
 TE1:→(1=X)/PRT
 Y←Y,X
 PRT:→0
∇

∇V←M MAKEBIG N;I;X
 ⍝  V ist the vector of the N last primes P such that P≤M .
 ⍝  In a fixed situation V is called BIGPRIMES .
 ⍝ 888 FAC21
 V←⍳I←0
 REK:→(N≤⍴V)/0
 NEX:I←I+2
 →(1<⍴FAC21 X←(M+1)-I)/NEX
 V←X,V
 →REK
∇

∇MAKEBIGINV;V;W;I
 ⍝  Starting from BIGPRIMES, for i>1 the number BIGV[i] is the inverse
 ⍝  mod BIGPRIMES[i] of the product of the first i-1 members of BIG-
 ⍝  PRIMES . In a fixed situtation, BIGV is called BIGINV .
 ⍝ 888 BIGPRIMES BIGRED
 BIGV←1↑W←BIGPRIMES
 I←1
 REK:→((⍴W)<I←I+1)/0
 BIGV←BIGV,(W[I]BIGRED(I-1)↑W)
 →REK
∇

∇Z←X MCAU Y;G;Y1;A;Z1;QQ
 ⍝ Cauchy's pairing function for integers as C-10 vectors
 ⍝CA MZCNCO MGNCCO MGSUMM MGPRODZ MGREM
 G←1000000
 A←(MZCNCO X)MGSUMM Y1←MZCNCO Y
 Z1←(,2)MGREM A MGPRODZ A MGSUMM(,1)
 Z←MGNCCO QQ MGSUMM Y1
 ⍝DT 5.7.89
∇

∇B←MGAVA A
 ⍝ A is a vector of integers. B is the N-1E6-vector of its absolute value
 ⍝ 888 REEM
 B←|REEM A
∇

∇C←A MGGCD B;QQ
 ⍝ A,B,C are N-1E6-vectors. C is the natural GCD of A,B .
 ⍝ 888 MGREMN MGSUMM MGPRODN REE REEM ⋆ G GLOBAL
 A←|A
 C←|B
 LOOP:→(0=1↑A)/0
 B←A MGREMN C
 C←A
 A←B
 →LOOP
∇

∇Z←MGITPROD B;R;I;⎕IO
 ⍝ B is a N-1E6-vector, Z is a C-10-vector. Z is the product of the
 ⍝ members of B .
 ⍝ 888  MZPROD
 R←⍴B
 Z←⍕B[I←⎕IO←1]
 REK:→(R<I←I+1)/0
 Z←Z MZPROD⍕,B[I]
 →REK
∇

∇X←MGNCCO A
 ⍝ A is a N-1E6-vector, X is the corresponding C-10-vector
 X←,((⍴A),¯6)↑0⍕((⍴A),1)⍴⌊|A←,A
 X[(X=' ')/⍳⍴X]←'0'
 X←((¯1=×1↑A)⍴'¯'),((('0'≠¯1↓X)⍳1)-⎕IO)↓X
∇

∇B←A MGPOWER N;T;N0;G
 ⍝ N is an ordinary integer, A,B are integers as N-1E6-vectors .
 ⍝ B is the N-th power of A .
 ⍝ 888  MGPRODN REE
 N0←N
 G←1000000
 →(0=T←×1↑((A≠0)/A←,A))/0,B←0
 A←|A
 B←,1
 →(N=0)/END
 REK:→(0=2|N)/EVEN
 B←B MGPRODN A
 EVEN:→(0=N←⌊N÷2)/END
 A←A MGPRODN A
 →REK
 END:B←(T⋆N0)×B
∇

∇Z←P MGPRODN Q;I;V;⎕IO
 ⍝ P,Q,Z ARE N-G-VECTORS, P,Q POSITIVE. Z IST THE PRODUCT OF P,Q .
 ⍝ 888 REE  ⋆   G GLOBAL
 I←⎕IO←0
 Q←,Q
 V←(⍴P)⍴0
 REK:Z←(((I←I+1)⍴0),P×Q[I])+V,0
 →(I=⍴Q)/END
 →REK,V←Z
 END:Z←REE Z
∇

∇Z←P MGPRODZ Q;SP;SQ
 ⍝ P,Q,Z are N-G-vectors. Z is the product of P,Q .
 ⍝ 888 MGPRODN MGSUMM REEM REE ⋆  G GLOBAL
 →(0=SP←×1↑((P≠0)/P←,P))/END0
 →(0=SQ←×1↑((Q≠0)/Q←,Q))/END0
 Z←SP×SQ×(|P)MGPRODN|Q
 →0
 END0:Z←0
∇

∇C←A MGREM B;⎕IO;I;L;M;N;Q;R;SA;SC;T
 ⍝ A,B C are N-1E6-vectors; A positive. C is the remainder of A
 ⍝ divided in B. The quotient is saved in QQ .
 ⍝ 888  MGSUMM MGPRODZ MGPRODN REEM REE  ⋆  G GLOBAL
 QQ←,⎕IO←0
 C←B
 →(0=SA←×1↑A)/0
 A←|A
 REK:→(((⍴C)<⍴A)∧0>SC←×1↑C)/NEG
 →((⍴C)>⍴A)/DIV
 →(0>SC)/DIV
 →((⍴C)<⍴A)/0
 →((⍴A)=I←(A≠C)⍳1)/DIV
 →(A[I]>C[I])/0
 DIV:N←⌊10⍟Q←(G⊥|(M←3⌊⍴C)↑C)÷G⊥(L←3⌊⍴A)↑A
 →(12>T←N+6×((⍴C)-M)-(⍴A)-L)/LIL
 Q←⌊Q×10⋆T-N+6×R←¯2+⌊T÷6
 Q←(SA×SC×,(3⍴G)⊤Q),R⍴0
 →FIT
 LIL:Q←⌊SA×SC×Q×10⋆T-N
 Q←(×Q)×((1+⌊10⍟|Q)⍴G)⊤|Q
 FIT:QQ←QQ MGSUMM Q
 C←C MGSUMM(-SA)×Q MGPRODZ A
 →REK
 NEG:C←C MGSUMM A
 QQ←QQ MGSUMM-SA
∇

∇C←A MGREMN B;⎕IO;I;L;M;N;Q;R;T;SC
 ⍝ A,B C are N-1E6-vectors; A,B positive. C is the remainder of A
 ⍝ divided in B. The quotient is saved in QQ .
 ⍝ 888  MGSUMM MGPRODN REEM REE  ⋆  G GLOBAL
 QQ←,⎕IO←0
 C←B
 REK:→(((⍴C)<⍴A)∧0>SC←×C[0])/NEG
 →((⍴C)>⍴A)/DIV
 →(0>SC)/DIV
 →((⍴C)<⍴A)/0
 →((⍴A)=I←(A≠C)⍳1)/DIV
 →(A[I]>C[I])/0
 DIV:N←⌊10⍟Q←(G⊥|(M←3⌊⍴C)↑C)÷G⊥(L←3⌊⍴A)↑A
 →(12>T←+/N+6×((⍴C)-M)-(⍴A)-L)/LIL
 Q←⌊Q×10⋆T-N+6×R←¯2+⌊T÷6
 Q←(SC×,(3⍴G)⊤Q),R⍴0
 →FIT
 LIL:Q←⌊SC×Q×10⋆T-N
 Q←(×Q)×((1+⌊10⍟|Q)⍴G)⊤|Q
 FIT:QQ←QQ MGSUMM Q
 C←C MGSUMM ¯1×Q MGPRODN A
 →REK
 NEG:C←C MGSUMM A
 QQ←QQ MGSUMM ¯1
∇

∇C←A MGREMN1 B;⎕IO;I;L;M;N;Q;R;T;SC
 ⍝ A,B C are N-1E6-vectors; A,B positive. C is the remainder of A
 ⍝ divided in B. The quotient is saved in QQ .
 ⍝ 888  MGSUMM MGPRODN  ⋆  G GLOBAL
 QQ←,⎕IO←0
 C←B
 REK:→((((⍴C)<⍴A)∧0>SC),((⍴C)>⍴A),0>SC←×C[0])/NEG,DIV,DIV
 →(((⍴C)<⍴A),((⍴A)=I),A[I]>C[I←(A≠C)⍳1])/0,DIV,0
 DIV:N←⌊10⍟Q←(G⊥|(M←3⌊⍴C)↑C)÷G⊥(L←3⌊⍴A)↑A
 →(12>T←+/N+6×((⍴C)-M)-(⍴A)-L)/LIL
 Q←⌊Q×10⋆T-N+6×R←¯2+⌊T÷6
 Q←(SC×,(3⍴G)⊤Q),R⍴0
 →FIT
 LIL:Q←⌊SC×Q×10⋆T-N
 Q←(×Q)×((1+⌊10⍟|Q)⍴G)⊤|Q
 FIT:QQ←QQ MGSUMM Q
 C←C MGSUMM ¯1×Q MGPRODN A
 →REK
 NEG:C←C MGSUMM A
 QQ←QQ MGSUMM ¯1
∇

∇C←A MGSUM B;M
 ⍝ A,B,C are nonnegative N-1E6-vectors. C is the sum A plus B .
 ⍝ 888 REE
 M←-(⍴A←,A)⌈⍴B←,B
 C←REE(M↑A)+M↑B
∇

∇C←A MGSUMM B;M
 ⍝ A,B,C are N-1E6-vectors. C is the sum A plus B .
 ⍝ 888 REEM
 M←-(⍴A←,A)⌈⍴B←,B
 C←REEM(M↑A)+M↑B
∇

∇X←MPZFORM A
 ⍝ numeric to character for vectors of digits to base 1E6
 X←,((⍴A),¯6)↑0⍕((⍴A),1)⍴⌊|A←,A
 X[(X=' ')/⍳⍴X]←'0'
 X←((¯1=×1↑A)⍴'¯'),((('0'≠¯1↓X)⍳1)-⎕IO)↓X
∇

∇B←MPZNRMLZ A;SIGN;S
 ⍝ normalized vector of digits to base 1E6
 DERR∧/(1≥⍴⍴A),B=⌊B←,A
 SIGN←1
 LOOP:→(0=⍴B←(((B≠0)⍳1)-⎕IO)↓B)/ZERO
 B←⌊B×S←×1↑B
 SIGN←S×SIGN
 →(∧/(B<1000000),B≥0)/END
 B←(S,0)+0,B-1000000×S←⌊B÷1000000
 →LOOP
 ZERO:→B←,0
 END:B←SIGN×B
∇

∇Z←X MPZPROD Y
 ⍝ product of integers given as character vectors to base 10
 ⍝ 888 MPZFORM MPZUNF MPZPROD0
 Z←MPZFORM(MPZUNF X)MPZPROD0 MPZUNF Y
∇

∇C←A MPZPROD0 B;⎕IO;U
 ⍝ product of vectors of digits to base 1E6
 ⍝ 888 MPZNRMLZ
 ⎕IO←0
 U←(A←,A)∘.×,B
 C←MPZNRMLZ+⌿(-⍳⍴A)⌽U,(0 ¯1+2⍴⍴A)⍴0
∇

∇A←MPZUNF X;⎕IO;M;SIGN
 ⍝ converts character vector X into vector of digits to base 1E6
 ⎕IO←0
 M←'¯'=1↑X←,X
 SIGN←1↑M↑X
 DERR∧/(X←M↓X)∈'0123456789'
 A←,⍎((7×M)⍴0 1 1 1 1 1 1)\(¯6×M←⌈(⍴X)÷6)↑X
 A←(¯1⋆SIGN='¯')×A
∇

∇B←MZAVA A;N
 ⍝ A,B are C-10-vectors. B is the absolute value of A .
 DERR(1≥⍴⍴A)∧∧/,A∈'0123456789+¯'
 →(∼(1↑A←,A)∈'+¯')/NOSIGN
 A←1↓A
 NOSIGN:N←+/∧\A='0'
 →(0<⍴B←N↓A)/0
 B←,'0'
∇

∇A←MZCNCO X;⎕IO;M;N
 ⍝ X is a C-10-vector, A is the corresponding N-1E6-vector
 ⎕IO←0
 M←'¯'=1↑X←,X
 DERR∧/(X←M↓X)∈'0123456789'
 A←(¯1⋆M)×,⍎((7×N)⍴0 1 1 1 1 1 1)\(¯6×N←⌈(⍴X)÷6)↑X
∇

∇D←MZDET A;⎕IO;E;N;NN;F;H;P;I;QQ;N2;G
 ⍝ D is a C-10 number which is the determinant (after Cabay and Lam)
 ⍝ of the matrix X consisting of usual (APL single precision) numbers
 ⍝ 888 BIGPRIMES ZNDET BIGINV MGREM MGPROD MGPRODN MGPRODZ MGSUMM MGNCCO
 ⍝ 888 REEM REE
 DERR∧/(2=⍴⍴A),(=/⍴A),,A=⌊A
 ⎕IO←1
 G←1000000
 E←(⍟2)++/⍟(+/A×A)⋆0.5
 DERR(⍴BIGPRIMES)≥N←⌈E÷⍟BIGPRIMES[1]
 N2←⌊0.5×NN←BIGPRIMES[1]
 D←REEM,(NN|N2+ZNDET A)-N2
 P←,I←1
 REK:→(N<I←I+1)/END
 N2←⌊0.5×NN←BIGPRIMES[I]
 F←ZNDET A
 H←(NN|N2+BIGINV[I]×F-1000000⊥(REE,NN)MGREM D)-N2
 P←P MGPRODZ,BIGPRIMES[I-1]
 D←D MGSUMM P MGPRODZ,H
 →REK
 END:D←MGNCCO D
∇

∇Z←X MZDIFF Y
 ⍝ X,Y,Z are (signed) C-10-vectors. Z is the difference X minus Y .
 ⍝ 888 MZCNCO MGNCCO MGSUMM REEM
 Z←MGNCCO(MZCNCO X)MGSUMM-MZCNCO Y
∇

∇Z←MZFACC N;M;R;I;A
 ⍝  N is an ordinary positive integer. Z is a C-vector. If N≤9670 then
 ⍝  Z is the factorial N! .
 ⍝ 888 MZPROD MZCNCO MGNCCO MGPRODZ MGPRODN MGSUMM REEM REE
 →(N>9670)/END4
 Z←⍕,!N⌊10
 →(N≤10)/0
 →(0=R←⌊(M←¯10+N⌊100)÷7)/END0
 I←1
 A←10+⍳M
 REK0:Z←Z MZPROD⍕,×/7↑A
 A←7↓A
 →(R≥I←I+1)/REK0
 Z←Z MZPROD⍕,×/A
 →(N≤100)/0
 →(0=R←⌊(M←¯100+N⌊159)÷5)/END1
 I←1
 A←100+⍳M
 REK1:Z←Z MZPROD⍕,×/5↑A
 A←5↓A
 →(R≥I←I+1)/REK1
 Z←Z MZPROD⍕,×/A
 →(N≤159)/0
 →(0=R←⌊(M←¯159+N⌊959)÷4)/END2
 I←1
 A←159+⍳M
 REK2:Z←Z MZPROD⍕,×/4↑A
 A←4↓A
 →(R≥I←I+1)/REK2
 Z←Z MZPROD⍕,×/A
 →(N≤959)/0
 →(0=R←⌊(M←¯959+N⌊9670)÷3)/END3
 I←1
 A←959+⍳M
 REK3:Z←Z MZPROD⍕,×/3↑A
 A←3↓A
 →(R≥I←I+1)/REK3
 Z←Z MZPROD⍕,×/A
 →0
 END0:Z←Z MZPROD⍕,×/10+⍳M
 →0
 END1:Z←Z MZPROD⍕,×/100+⍳M
 →0
 END2:Z←Z MZPROD⍕,×/159+⍳M
 →0
 END3:Z←Z MZPROD⍕,×/959+⍳M
 →0
 END4:'THIS FUNCTION WORKS ONLY FOR N≤9670 '
∇

∇Z←X MZGCD Y;G
 ⍝ X,Y,Z are C-10-vectors. C is the natural GCD of A,B .
 ⍝ 888 MZCNCO MGNCCO MGGCD MGREMN MGSUMM MGPRODN REE REEM
 G←1000000
 Z←MGNCCO(MZCNCO X)MGGCD MZCNCO Y
∇

∇B←MZNEG A;⎕IO;I;C
 ⍝ A,B are C-10-vectors. B is minus A .
 ⎕IO←0
 DERR(1≥⍴⍴A)∧' '=1↑0↑,A
 I←(C←1↑B←,A)∈'+¯'
 B←I↓B
 DERR∧/B∈'0123456789'
 B←(+/∧\'0'=¯1↓B)↓B
 →((C='¯')∨'0'=1↑B)/0
 B←'¯',B
∇

∇Z←X MZPOWER N
 ⍝ N is an ordinary integer, X,Z are integers as C-10-vectors.
 ⍝ Z is the N-th power of X .
 ⍝ 888 MZCNCO MGNCCO MGPOWER MGPRODN REE
 Z←MGNCCO(MZCNCO X)MGPOWER N
∇

∇Z←X MZPROD Y;G
 ⍝ X,Y,Z are C-10-vectors. Z is the product of X,Y .
 ⍝ 888 MZCNCO MGNCCO MGPRODZ MGPRODN MGSUMM REEM REE
 G←1000000
 Z←MGNCCO(MZCNCO X)MGPRODZ MZCNCO Y
∇

∇Z←X MZREM Y;A;B;C;SA;SB;SC;G
 ⍝ X,Y,Z are C-10-vectors. Z is the remainder of X divided in Y :
 ⍝ Y = QQ×X + Z  with (1) Z=Y if X=0 or Y=0 , (11) QQ=1 if X=0 ,
 ⍝ (12) QQ=0 if X≠0 , Y=0 , (2) 0≤Z<X if 0<X , (3) X<Z≤0 if X<0 .
 ⍝ QQ is saved.
 ⍝ speed slightly below MZREMP .
 ⍝ 888  MZCNCO MGNCCO MGREMN MGSUMM MGSUM MGPRODN REEM REE
 G←1000000
 SA←×1↑A←(A≠0)/A←MZCNCO X
 SB←×1↑B←(B≠0)/B←MZCNCO Y
 →(0≠SA×SB)/NEX
 Z←Y
 QQ←⍕,SA=0
 →0
 NEX:SC←∨/0≠C←(|A)MGREMN|B
 →((0<SA)∧0<SB)/END
 →((0>SA)∧0<SB)/END1
 →((0<SA)∧0>SB)/END2
 C←-C
 →END
 END1:→(SC=0)/END3
 C←A MGSUMM C
 QQ←¯1×QQ MGSUM 1
 →END
 END2:→(SC=0)/END3
 C←A MGSUMM-C
 QQ←¯1×QQ MGSUM 1
 →END
 END3:QQ←¯1×QQ
 END:Z←MGNCCO C
 QQ←MGNCCO QQ
∇

∇Z←X MZREMN Y;G
 ⍝ X,Y,Z are C-10-vectors; X,Y positive. Z is the remainder of X
 ⍝ divided in Y . The integer quotient is saved in QQ .
 ⍝ speed faster than MZREM .
 ⍝ 888  MZCNCO MGNCCO MGREMN MGSUMM  MGPRODN REEM REE
 G←1000000
 Z←MGNCCO(MZCNCO X)MGREMN MZCNCO Y
 QQ←MGNCCO QQ
∇

∇Z←X MZREMP Y;G
 ⍝ X,Y,Z are C-10-vectors; X nonnegative. Z is the remainder of X
 ⍝ divided in Y . The integer quotient is saved in QQ .
 ⍝ 888  MZCNCO MGNCCO MGREM MGSUMM MGPRODZ MGPRODN REEM REE
 G←1000000
 Z←MGNCCO(MZCNCO X)MGREM MZCNCO Y
 QQ←MGNCCO QQ
∇

∇T←MZSGN A;M
 ⍝ A is a C-10-vector. T is its sign .
 M←'¯'=1↑A←,A
 DERR∧/(A←M↓A)∈'0123456789'
 →(M=0)/NONNEG
 →(M∧∧/A∈'0')/ZERO
 →0,T←¯1
 NONNEG:→(∧/A∈'0')/ZERO
 →0,T←1
 ZERO:T←0
∇

∇Z←X MZSUM Y
 ⍝ X,Y,Z are (signed) C-10-vectors. Z is the sum X plus Y .
 ⍝ 888 MZCNCO MGNCCO MGSUMM REEM
 Z←MGNCCO(MZCNCO X)MGSUMM MZCNCO Y
∇

∇Z←REE X;Y
 ⍝   X is a vector of nonnegative integers.
 ⍝   Z is a vector of G-digits with the same G-value.
 Z←X
 REK:→(∧/Z<G)/REKO
 →REK,Z←(0,Y)+((Z-Y←G|Z)÷G),0
 REKO:Z←(((0≠¯1↓Z)⍳1)-⎕IO)↓Z
∇

∇Z←REEM X;S;T;Y;L
 ⍝  X is a vector of integers. Z is a vector of signed G-digits with
 ⍝  the same G-value.
 S←1
 REK:→(∧/(X<G),X≥0)/REKO
 S←S×T←1↑(L≠0)/L←×X
 →REK,X←(0,Y)+((X-Y←G|X←T×X)÷G),0
 REKO:Z←S×(((0≠¯1↓X)⍳1)-⎕IO)↓X
∇

∇Z←REEN V;Y;S
 ⍝   V is a vector of integers, all either nonnegative or nonpositive.
 ⍝   Z is a vector of signed G-digits with the same G-value.
 S←(¯1)⋆1∈V≠Z←|V
 REK:→(∧/Z<G)/REKO
 →REK,Z←(0,Y)+((Z-Y←G|Z)÷G),0
 REKO:Z←S×(((0≠¯1↓Z)⍳1)-⎕IO)↓Z
∇

∇Z←tr TIME F;T0;T1;I
 ⍝  Timer for function runs. Input F is a char.vector, consisting of the
 ⍝  function name and arguments, separated by blanks as usual. Output is
 ⍝  the time in milliseconds for a run, averaged over tr runs. If no tr
 ⍝  is given, the default is assumed. The function value from the last
 ⍝  run is saved in the global variable XF .
 ⍎(0=⎕NC 'tr')/'tr←1' ⍝ Default the TIME repetition
 I←1
 Z←⍳0
 REK:T0←(100 60 60 1000)⊥¯4↑⎕TS
 '' ⎕EA 'XF←⍎F'
 T1←(100 60 60 1000)⊥¯4↑⎕TS
 Z←Z,T1-T0
 →(tr>I←I+1)/REK
 Z←(÷⍴Z)×+/Z
 ⍝DT 12.2.87
∇

∇Z←PP TINVERTP R;X;Y;T;A;B;D;I;Q
 ⍝   Z is the the inverse mod PP of the integer R
 Y←PP
 T←PP|R
 Z←B←1+D←A←I←0
 REK:→(0=X←T|Y)/END
 Z←((A←Z)×Q←(Y-X)÷T)+A
 D←((B←D)×Q)+B
 Y←T
 T←X
 →REK,I←I+1
 END:Z←PP|PP+Z×¯1⋆I
∇

∇D←ZNDET A;⎕IO;V;J;W;Q
 ⍝  determinant of integer matrix using integer row operations mod NN
 DERR∧/(NN<10000000),(,A=⌊A),(2=⍴⍴A),=/⍴A←NN|A
 D←⎕IO←1
 →(0=1↑⍴A)/0
 LOOP:→(1=1↑⍴A)/END
 BACK:→(∧/0=V←A[;1])/ZERO
 J←V⍳⌊/(V≠0)/V
 →(J=1)/OK
 A[1,J;]←A[J,1;]
 D←NN|-D
 OK:→(∧/0=W←1↓A[;1])/ENDLP
 Q←0,⌊W÷A[1;1]
 A←NN|A-Q∘.×A[1;]
 →BACK
 ENDLP:D←NN|D×A[1;1]
 A←1 1↓A
 →LOOP
 ZERO:→D←0
 END:D←NN|D×A[1;1]
∇

ABSTRACT←' ' ⍝ proto 1
  ABSTRACT←0⍴ABSTRACT ⍝ proto 2

BIGINV←50⍴0 ⍝ prolog ≡1
  (BIGINV)[⍳8]←9999071 9165826 283452 9555586 7132394 5124772 2209919 1479669
  (BIGINV)[8+⍳8]←2132758 1530962 129491 477215 1243524 6299670 907263 796818
  (BIGINV)[16+⍳7]←9821791 5714457 7236163 7146222 5016272 3301955 3227005
  (BIGINV)[23+⍳7]←6747281 2534875 1143272 7126244 8503876 5143814 8711328
  (BIGINV)[30+⍳7]←4443269 5165260 9889622 6788847 2040129 7400470 4910934
  (BIGINV)[37+⍳7]←9702285 9257415 3970022 2784612 4765060 4998631 8059704
  (BIGINV)[44+⍳6]←5756328 8621884 7519471 348897 2528490 5009170

BIGPRIMES←50⍴0 ⍝ prolog ≡1
  (BIGPRIMES)[⍳7]←9999071 9999083 9999161 9999163 9999167 9999193 9999217
  (BIGPRIMES)[7+⍳7]←9999221 9999233 9999271 9999277 9999289 9999299 9999317
  (BIGPRIMES)[14+⍳7]←9999337 9999347 9999397 9999401 9999419 9999433 9999463
  (BIGPRIMES)[21+⍳7]←9999469 9999481 9999511 9999533 9999593 9999601 9999637
  (BIGPRIMES)[28+⍳7]←9999653 9999659 9999667 9999677 9999713 9999739 9999749
  (BIGPRIMES)[35+⍳7]←9999761 9999823 9999863 9999877 9999883 9999889 9999901
  (BIGPRIMES)[42+⍳7]←9999907 9999929 9999931 9999937 9999943 9999971 9999973
  (BIGPRIMES)[49+⍳1]←9999990.9999999907

G←1000000

VMUL7←48⍴0 ⍝ prolog ≡1
  (VMUL7)[⍳21]←11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97
  (VMUL7)[21+⍳15]←101 103 107 109 113 121 127 131 137 139 143 149 151 157 163
  (VMUL7)[36+⍳12]←167 169 173 179 181 187 191 193 197 199 209 211

⎕CT←9.9999999999999982E¯14

⎕FC←(,⎕UCS 46 44 8902 48 95 175)

⎕IO←1

⎕L←0

⎕LX←'ABSTRACT'

⎕PP←10

⎕PR←' '

⎕PS←0 0

⎕PW←80

⎕R←0

⎕RL←2063936098

⎕TZ←¯7

⎕X←0

