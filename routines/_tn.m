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
 set %plimit=%get(%plimit)
 quit $$prec^%tnutil(%prec,%plimit)
 ;
fmtprec(%x,%prec) ; format %x to precsion %prec
 ;sf-isc/rwf,hines/cfb,dw,ven/mcglk;PUBLIC;function;clean;silent;sac
 set %x=$get(%x)
 set %prec=$get(%prec)
 quit $$prec^%tnutil(%x,%prec)
 ;
 ;-----------------------------------------------------------------------------
 ; Constants
 ;-----------------------------------------------------------------------------
 ;
e(%prec) ; Constant: e
 ;sf-isc/rwf,hines/cfb,dw,ven/mcglk;PUBLIC;function;clean;silent;sac
 ; Constant from the Mathematica equation: N[E,36]
 ; https://www.wolframalpha.com/input/?i=N%5BE,36%5D
 ;
 set %prec=$$prec($get(%prec))
 new %result set %result=2.71828182845904523536028747135266250
 quit $$fmtprec(%result,%prec)
 ;
 ;
pi(%prec) ; Constant: pi
 ;sf-isc/rwf,hines/cfb,dw,ven/mcglk;PUBLIC;function;clean;silent;sac
 ; Constant from the Mathematica equation: N[pi,36]
 ; https://www.wolframalpha.com/input/?i=N%5Bpi,36%5D
 ; 
 set %prec=$$prec($get(%prec))
 new %result set %result=3.14159265358979323846264338327950288
 quit $$fmtprec(%result,%prec)
 ;
 ;
 ;-----------------------------------------------------------------------------
 ; Mostly internal-use constants, but still public.
 ;-----------------------------------------------------------------------------
 ;
lnten(%prec) ; Constant: ln 10
 ;ven/mcglk;PUBLIC;function;clean;silent;sac
 ; Constant from the Mathematica equation: N[ln(10),36]
 ; https://www.wolframalpha.com/input/?i=N%5Bln(10),36%5D
 ; 
 new %result set %result=2.30258509299404568401799145468436421
 set %prec=$$prec($get(%prec),12)
 quit $$fmtprec(%result,%prec)
 ;
 ;
rlnten(%prec) ; Constant: 1/(ln 10)
 ;ven/mcglk;PUBLIC;function;clean;silent;sac
 ; Constant from the Mathematica equation: N[1/ln(10),36]
 ; https://www.wolframalpha.com/input/?i=N%5B1%2Fln(10),36%5D
 ; 
 new %result set %result=.434294481903251827651128918916605082
 set %prec=$$prec($get(%prec),12)
 quit $$fmtprec(%result,%prec)
 ;
 ;
 ;-----------------------------------------------------------------------------
 ; Library functions
 ;-----------------------------------------------------------------------------
 ;
abs(%x,%prec) ; absolute value
 ;sf-isc/rwf,hines/cfb,dw,ven/mcglk;PUBLIC;function;clean;silent;sac
 set %prec=$$prec($get(%prec),12)
 set %x=$get(%x)
 if %x="" do
 . set %e="%tn-e-abs-noarg;No argument was supplied"
 . quit
 else  if %x'=+%x do
 . set %e="%tn-e-abs-badarg;Non-numeric argument ("""_%x_""") was supplied"
 . quit
 if %e'="" set %e=%e_", 0 returned"
 quit:%e'="" 0
 set %x=$select(%x<0:-%x,1:%x)
 quit $$fmtprec(%x,%prec)
 ;
 ;
minmaxar(%fnc,%a,%b) ; Set %e if something weird happened.
 ;sf-isc/rwf,hines/cfb,dw,ven/mcglk;PUBLIC;function;clean;silent;sac
 set %prec=$$prec($get(%prec),12)
 set %fnc=$get(%fnc)
 set %a=$get(%a)
 set %b=$get(%b)
 if %a=""&(%b="") do
 . set %e="%tn-e-"_%fnc_"-noargs;No arguments were supplied"
 . quit
 else  if %a="" do
 . set %e="%tn-e-"_%fnc_"-noarg1;First argument was not supplied"
 . quit
 else  if %b="" do
 . set %e="%tn-e-"_%fnc_"-noarg2;Second argument was not supplied"
 . quit
 else  if %a'=+%a do
 . set %e="%tn-e-"_%fnc_"-badarg1;First argument """_%a_""") non-numeric"
 . quit
 else  if %b'=+%b do
 . set %e="%tn-e-"_%fnc_"-badarg2;Second argument """_%b_""") non-numeric"
 . quit
 if %e'="" set %e=%e_", 0 returned"
 quit
 ;
 ;
min(%a,%b,%prec) ; Minimum of two values
 ;sf-isc/rwf,hines/cfb,dw,ven/mcglk;PUBLIC;function;clean;silent;sac
 set %prec=$$prec($get(%prec),12)
 set %a=$get(%a)
 set %b=$get(%b)
 do minmaxar("min",%a,%b)
 if %e'="" set %e=%e_", 0 returned"
 quit:%e'="" 0
 set %a=$select(%a<%b:%a,1:%b)
 quit $$fmtprec(%a,%prec)
 ;
 ;
max(%a,%b,%prec) ; Maximum of two values
 ;sf-isc/rwf,hines/cfb,dw,ven/mcglk;PUBLIC;function;clean;silent;sac
 set %prec=$$prec($get(%prec),12)
 set %a=$get(%a)
 set %b=$get(%b)
 do minmaxar("max",%a,%b)
 if %e'="" set %e=%e_", 0 returned"
 quit:%e'="" 0
 set %a=$select(%a<%b:%b,1:%a)
 quit $$fmtprec(%a,%prec)
 ;
 ;
 ;-----------------------------------------------------------------------------
 ; More complex functions.
 ;-----------------------------------------------------------------------------
 ; ln(%x,%prec) ; log base e
 ;  ;sf-isc/rwf,hines/cfb,dw,ven/mcglk;PUBLIC;function;clean;silent;sac
 ;  ; Uses a Taylor series to calculate the natural logarithm.
 ;  ; The original by RWF did as well, but this improves on it somewhat.
 ;  ; First, set up some possible error messages.
 ;  ; Rick and I are exploring new error paradigms.
 ;  new error
 ;  set error("logneg")="%tn-lnv2-logneg"
 ;  set error("logneg")=error("logneg")_",Can't take a logarithm of a negative"
 ;  set error("logneg")=error("logneg")_" real number"
 ;  new %e set %e="" ; Temporary until I ask Rick a question.
 ;  ; Also, if an error condition has already been set, preserve it and pass back
 ;  ; an empty string.
 ;  quit:%e ""
 ;  ; This calculates a natural logarithm using a modified Taylor series.
 ;  ; if x = 0, ln(x) is negative infinity.
 ;  ; if x < 0, ln(x) is discontinuous
 ;  ; So we won't bother unless x is positive.
 ;  ; But we'll still set an error condition.
 ;  set:x'>0 %e=error("logneg")
 ;  quit:%e ""
 ;  ; First, this converges faster if the value is close to 1.
 ;  ; So we'll normalize the number to scientific notation, keeping track of the
 ;  ; multiplicand to get that number back (it'll be a value that's a power of
 ;  ; ten).
 ;  ; At the end of this process, x will be the normalized value, p will be the
 ;  ; power of ten reflected in m, the multiplicand.
 ;  ; First, set the precision and the limiting value.
 ;  set %prec=$$prec($get(%prec),12)
 ;  new lim do lim
 ;  ; step tells us which direction to push the power of ten:
 ;  new step set step=$select(x<1:-1,1:1)
 ;  ; m is the multiplicand, and since this is 10^p, and p always starts with
 ;  ; zero, . . .
 ;  new m set m=1
 ;  ; If the value is already in the range [1,10), we'll just skip the loop.
 ;  new stop set stop=x<10&(x'<1)
 ;  ; Now, as long as stop isn't true, step up (or down) by powers of ten.
 ;  ; x shrinks (or grows), while m grows (or shrinks). Then we recalculate stop
 ;  ; depending on whether we've gotten close enough to 1.
 ;  for p=0:step do  quit:stop
 ;  . set x=x*$select(step<0:10,1:.1)
 ;  . set m=m*$select(step<0:.1,1:10)
 ;  . set stop=$select(step<0:x>1,1:x<10)
 ;  . quit
 ;  ; At this point, p is one off. Fix that.
 ;  set p=p+step
 ;  ; At this point, we have scientific notation: x should be in [1,10), and m
 ;  ; should be 10^p, so x*m should match the original argument. But if x>5, we
 ;  ; can get that closer to 1 by dropping a power.
 ;  if x>5 do
 ;  . set p=p+1
 ;  . set x=x*.1
 ;  . set m=m*10
 ;  . quit
 ;  ; At the end, we have to add those powers of ten back to the logarithm.
 ;  ; We'll store that in logm.
 ;  new logm set logm=p*2.3025850929940457
 ;  ; Now, we're doing the Taylor series. We're using a variation that depends
 ;  ; on the following identities:
 ;  ;   y = (x-1)/(x+1)
 ;  ;   ln(x) = ln(1+y1/(1-y))
 ;  ;         = 2*y*s
 ;  ; where
 ;  ;   s = sum n=1,3,5... of 1/n*yp, where yp = y^(n-1)
 ;  ; (And this is an excellent example of why I want to finish up a literate
 ;  ; programming method.)
 ;  new y set y=x-1/(x+1)
 ;  new result set result=2*y
 ;  new power
 ;  ; The first term of the sum is (1/1 * y^0) = 1
 ;  new sum set sum=1
 ;  new yp set yp=1
 ;  new term
 ;  ; Do terms two and up until we get to enough decimal places.
 ;  for p=2:2 do  quit:term<lim
 ;  . set yp=yp*y*y ; yp=y^p
 ;  . set term=yp/(p+1)
 ;  . set sum=term+sum
 ;  . quit
 ;  set result=result*sum+logm
 ;  quit $$fmtprec(result,%prec)
 ;  ;
 ;  ;
 ; log(%x,%prec) ; log base 10
 ;  ;sf-isc/rwf,hines/cfb,dw,ven/mcglk;PUBLIC;function;clean;silent;sac
 ;  set %prec=$$minprec($get(PR),11)
 ;  new %result set %result=$$ln(%x,%prec)*$$rlnten(%prec)
 ;  quit $$fmtprec(%result,%prec)
 ;  ;
 ;  ;
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
 ;  do A
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
