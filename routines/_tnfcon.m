%tnfcon ;ven/toad&mcglk-types: numbers: constant functions ;2016-04-10 01:20
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
eor
