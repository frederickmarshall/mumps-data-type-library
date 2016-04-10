%tn ;ven/toad&mcglk-types: numbers ;2016-04-02 23:37
 ;;1.5-development;MASH;;
 ;(c) 2016, Frederick D. S. Marshall, all rights reserved
 ;($) funded by Frederick D. S. Marshall
 ;(l) Licensed under Apache License 2.0. See LICENSE file.
 ;
 ; CURRENTLY UNTESTED AND IN PROGRESS
 ; %tn is the Mumps Numeric Library, an element of the Mumps Advanced Shell's
 ; Data Types Library. It collects all public application programmer interfaces
 ; in the Mumps Numeric Library.  Its APIs are implemented in other %tn*
 ; routines, none of which contains any public entry points.
 ;
 ; Primary development and discussion: see routine %tnlog
 ;
 ; Our thanks to SF-ISC/RWF,HINES/CFB,DW for the use of XLFMTH, the math
 ; functions library (1993-07-16 and 1995-03-03)
 ;
 ; Contents (all PUBLIC application programmer interfaces)
 ;
 ;-----------------------------------------------------------------------------
 ; Utility routines; not generally called from outside.
 ;-----------------------------------------------------------------------------
 ;
prec(%prec,%plimit) ; get precision to %prec, which must be at most %plimit
 ;sf-isc/rwf,hines/cfb,dw,ven/mcglk;PUBLIC;function;clean;silent;sac
 set %prec=$get(%prec)
 set %plimit=$get(%plimit)
 quit $$prec^%tnflib(%prec,%plimit)
 ;
fmtprec(%x,%prec) ; format %x to precsion %prec
 ;sf-isc/rwf,hines/cfb,dw,ven/mcglk;PUBLIC;function;clean;silent;sac
 set %x=$get(%x)
 set %prec=$get(%prec)
 quit $$fmtprec^%tnflib(%x,%prec)
 ;
 ;-----------------------------------------------------------------------------
 ; Constants (%tnfcon)
 ;-----------------------------------------------------------------------------
 ;
e(%prec) ; Constant: e
 ;sf-isc/rwf,hines/cfb,dw,ven/mcglk;PUBLIC;function;clean;silent;sac
 ; Constant from the Mathematica equation: N[E,36]
 ; https://www.wolframalpha.com/input/?i=N%5BE,36%5D
 ;
 set %prec=$get(%prec)
 quit $$e^%tnfcon(%prec)
 ;
pi(%prec) ; Constant: pi
 ;sf-isc/rwf,hines/cfb,dw,ven/mcglk;PUBLIC;function;clean;silent;sac
 ; Constant from the Mathematica equation: N[pi,36]
 ; https://www.wolframalpha.com/input/?i=N%5Bpi,36%5D
 ; 
 set %prec=$get(%prec)
 quit $$pi^%tnfcon(%prec)
 ;
 ; ***Mostly internal-use constants, but still public:***
 ;
lnten(%prec) ; Constant: ln 10
 ;ven/mcglk;PUBLIC;function;clean;silent;sac
 ; Constant from the Mathematica equation: N[ln(10),36]
 ; https://www.wolframalpha.com/input/?i=N%5Bln(10),36%5D
 ; 
 set %prec=$get(%prec)
 quit $$lnten^%tnfcon(%prec)
 ;
rlnten(%prec) ; Constant: 1/(ln 10)
 ;ven/mcglk;PUBLIC;function;clean;silent;sac
 ; Constant from the Mathematica equation: N[1/ln(10),36]
 ; https://www.wolframalpha.com/input/?i=N%5B1%2Fln(10),36%5D
 ; 
 set %prec=$get(%prec)
 quit $$rlnten^%tnfcon(%prec)
 ;
 ;-----------------------------------------------------------------------------
 ; Magnitude functions (%tnfmag)
 ;-----------------------------------------------------------------------------
 ;
abs(%x,%prec) ; absolute value
 ;sf-isc/rwf,hines/cfb,dw,ven/mcglk;PUBLIC;function;clean;silent;sac
 set %x=$get(%x)
 set %prec=$get(%prec)
 quit $$abs^%tnfmag(%x,%prec)
 ;
min(%a,%b,%prec) ; Minimum of two values
 ;sf-isc/rwf,hines/cfb,dw,ven/mcglk;PUBLIC;function;clean;silent;sac
 set %a=$get(%a)
 set %b=$get(%b)
 set %prec=$get(%prec)
 quit $$min^%tnfmag(%a,%b,%prec)
 ;
max(%a,%b,%prec) ; Maximum of two values
 ;sf-isc/rwf,hines/cfb,dw,ven/mcglk;PUBLIC;function;clean;silent;sac
 set %a=$get(%a)
 set %b=$get(%b)
 set %prec=$get(%prec)
 quit $$max^%tnfmag(%a,%b,%prec)
 ;
 ;-----------------------------------------------------------------------------
 ; Logarithm functions (%tnflog)
 ;-----------------------------------------------------------------------------
 ;
ln(%x,%prec) ; log base e
 ;sf-isc/rwf,hines/cfb,dw,ven/mcglk;PUBLIC;function;clean;silent;sac
 set %x=$get(%x)
 set %prec=$get(%prec)
 quit $$ln^%tnflog(%x,%prec)
 ;
log(%x,%prec) ; log base 10
 ;sf-isc/rwf,hines/cfb,dw,ven/mcglk;PUBLIC;function;clean;silent;sac
 set %prec=$$minprec($get(PR),11)
 new %result set %result=$$ln(%x,%prec)*$$rlnten(%prec)
 quit $$fmtprec(%result,%prec)
 ;
 ;
 ; EXP(%x,PR) ;e to the X power
 ;  new L,M,N,O,P,%result,%tnlim
 ;  set PR=$$minprec($get(PR),11)
 ;  do EX
 ;  goto Q
 ;  ;
 ; EX
 ;  set (%result,L)=%x,%result=%result+1
 ;  do LIM
 ;  for O=2:1 set L=L*%x/O,%result=%result+L quit:($TR(L,"-")<%tnlim)
 ;  quit
 ;  ;
 ; PWR(%result,%x,PR) ;X to the %result power
 ;  new L,M,N,O,P,%tnlim
 ;  set PR=$$minprec($get(PR),11)
 ;  do P
 ;  goto Q
 ;  ;
 ; P
 ;  set:%x<0 %x=%x*-1,%result=1/%result
 ;  set P=%x,%x=%result
 ;  do A ; ln
 ;  set %x=%result*P
 ;  do EX
 ;  quit
 ;  ;
 ; LIM ; Sets %tnlim to 1e-(%tnpr+3)
 ;  ; Why %prec + 3?
 ;  set %tnlim=$select((%prec+3)'>11:%prec+3,1:11)
 ;  set @("%tnlim=1E-"_%tnlim)
 ;  quit
 ;  ;
 ; PI(PR) ;PI
 ;  N %result S %result=$$pi S PR=$$minprec($get(PR),12) G Q
 ;  ;
 ; SQRT(%x,PR) ;square root of X
 ;  N %result,T S %result=0,PR=$$minprec($get(PR),12) Q:%x'>0 %result S %result=%x+.5
 ; L F  S T=%result,%result=%x/T+T/2 Q:%result'<T
 ;  G Q
 ; SD(%S1,%S2,%N) ;%S1=SUM, %S2=SUM OF SQUARES, %N=COUNT
 ;  N %X,%SD S %SD=-1,%X=-1 Q:%N<2 %SD
 ;  S %X=%N*%S2-(%S1*%S1)/(%N*(%N-1)),%SD=$$SQRT(%X),%X=%S1/%N Q %SD
 ;  ;
 ; DMSDEC(X,PR) ;degrees:min:sec to decimal
 ;  N %result S PR=$$minprec($get(PR),12),%result=$P(X,":")+($P(X,":",2)/60)+($P(X,":",3)/3600) G Q
 ; DECDMS(X,PR) ;decimal to degrees:min:sec
 ;  N %result S PR=$$minprec($get(PR),5),%result=X\1,X=X-(X\1)*60,%result=%result_":"_(X\1),X=X-(X\1)*60,X=+$J(X,0,$S((PR-$L(X\1))'<0:PR-$L(X\1),1:0)) Q %result_":"_X
 ; DTR(X,PR) ;degrees to radians
 ;  N %result S %result=X*3.14159265358979/180 S PR=$$minprec($get(PR),12) G Q
 ; RTD(X,PR) ;radians to degrees
 ;  N %result S %result=X*180/3.14159265358979 S PR=$$minprec($get(PR),12) G Q
 ; SINDEG(X,PR) ;sine in degrees
 ;  S:X[":" X=$$DMSDEC(X,12) S PR=$$minprec($get(PR),10),X=$$DTR(X) Q $$SIN(X,PR)
 ; SIN(X,PR) ;sine in radians
 ;  N L,M,N,O,P,%result,%tnlim,SIGN S PR=$$minprec($get(PR),10) D S G Q
 ; S S X=X#(2*3.14159265358979),(%result,L)=X,SIGN=-1 D LIM F O=3:2 S L=L/(O-1)*X/O*X,%result=%result+(SIGN*L) Q:($TR(L,"-")<%tnlim)  S SIGN=SIGN*-1
 ;  Q
 ; CSCDEG(X,PR) ;cosecant in degrees
 ;  S:X[":" X=$$DMSDEC(X,12) S PR=$$minprec($get(PR),10),X=$$DTR(X) Q $$CSC(X,PR)
 ; CSC(X,PR) ;cosecant in radians
 ;  N L,M,N,O,P,%result,%tnlim,SIGN S PR=$$minprec($get(PR),10) D S S %result=1/%result G Q
 ; COSDEG(X,PR) ;cosine in degrees
 ;  S:X[":" X=$$DMSDEC(X,12) S PR=$$minprec($get(PR),10),X=$$DTR(X) Q $$COS(X,PR)
 ; COS(X,PR) ;cosine in radians
 ;  N L,M,N,O,P,%result,%tnlim,SIGN S PR=$$minprec($get(PR),10) D C G Q
 ; C S X=X#(2*3.14159265358979),(%result,L)=1,SIGN=-1 D LIM F O=2:2 S L=L*X*X/(O-1*O),%result=%result+(SIGN*L) Q:($TR(L,"-")<%tnlim)  S SIGN=SIGN*-1
 ;  Q
 ; SECDEG(X,PR) ;secant in degrees
 ;  S:X[":" X=$$DMSDEC(X,12) S PR=$$minprec($get(PR),10),X=$$DTR(X) Q $$SEC(X,PR)
 ; SEC(X,PR) ;secant in radians
 ;  N L,M,N,O,P,%result,%tnlim,SIGN S PR=$$minprec($get(PR),10) D C S %result=1/%result G Q
 ; TANDEG(X,PR) ;tangent in degrees
 ;  S:X[":" X=$$DMSDEC(X,12) S PR=$$minprec($get(PR),10),X=$$DTR(X) Q $$TAN(X,PR)
 ; TAN(X,PR) ;tangent in radians
 ;  N L,M,N,O,P,%result,%tnlim,S,SIGN S PR=$$minprec($get(PR),10) D S S S=%result D C S %result=S/%result G Q
 ; COTDEG(X,PR) ;cotangent in degrees
 ;  S:X[":" X=$$DMSDEC(X,12) S PR=$$minprec($get(PR),10),X=$$DTR(X) Q $$COT(X,PR)
 ; COT(X,PR) ;contangent in radians
 ;  N L,M,N,O,P,%result,%tnlim,C,SIGN S PR=$$minprec($get(PR),10) D C S C=%result D S S %result=C/%result G Q
 ; ASINDEG(X,PR) ;arc-sine in degrees
 ;  G ASIND^XLFMTH1
 ; ASIN(X,PR) ;arc-sine in radians
 ;  G ASIN^XLFMTH1
 ; ACOSDEG(X,PR) ;arc-cosine in degrees
 ;  G ACOSD^XLFMTH1
 ; ACOS(X,PR) ;arc-cosine in radians
 ;  G ACOS^XLFMTH1
 ; ATANDEG(X,PR) ;arc-tangent in degrees
 ;  G ATAND^XLFMTH1
 ; ATAN(X,PR) ;arc-tangent in radians
 ;  G ATAN^XLFMTH1
 ; ACOTDEG(X,PR) ;arc-cotangent in degrees
 ;  G ACOTD^XLFMTH1
 ; ACOT(X,PR) ;arc-cotangent in radians
 ;  G ACOT^XLFMTH1
 ; ASECDEG(X,PR) ;arc-secant in degrees
 ;  G ASECD^XLFMTH1
 ; ASEC(X,PR) ;arc-secant in radians
 ;  G ASEC^XLFMTH1
 ; ACSCDEG(X,PR) ;arc-cosecant in degrees
 ;  G ACSCD^XLFMTH1
 ; ACSC(X,PR) ;arc-cosecant in radians
 ;  G ACSC^XLFMTH1
 ;  ;
eor
