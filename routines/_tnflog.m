%tnflog ;ven/toad&mcglk-types: numbers: logarithm functions ;2016-04-10 01:32
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
ln(%x,%prec) ; log base e
 ;sf-isc/rwf,hines/cfb,dw,ven/mcglk;PUBLIC;function;clean;silent;sac
 ; Uses a Taylor series to calculate the natural logarithm.
 ; The original by RWF did as well, but this improves on it somewhat.
 ;
 ; If an error condition has already been set, preserve it and pass back
 ; an empty string.
 set %e=$get(%e)
 quit:%e ""
 ; This calculates a natural logarithm using a modified Taylor series.
 ; if x = 0, ln(x) is negative infinity.
 ; if x < 0, ln(x) is discontinuous
 ; So we won't bother unless x is positive.
 ; But we'll still set an error condition.
 set %x=$get(%x,0)
 if %x'>0 do
 . set %e="%tn-e-ln-lognpos"
 . set %e=%e_",Can't take a logarithm of a non-positive real number ("_%x_")"
 . quit
 quit:%e ""
 write !,"got past arg errors",!
 ; First, this converges faster if the value is close to 1.
 ; So we'll normalize the number to scientific notation, keeping track of the
 ; multiplicand to get that number back (it'll be a value that's a power of
 ; ten).
 ; At the end of this process, x will be the normalized value, p will be the
 ; power of ten reflected in m, the multiplicand.
 ; First, set the precision and the limiting value.
 set %prec=$$prec^%tnflib($get(%prec))
 set %epsilon=$$epsilon^%tnflib(%prec)
 write "got prec and epsilon",!
 ; step tells us which direction to push the power of ten:
 new step  set step=$select(%x<1:-1,1:1)
 ; m is the multiplicand, and since this is 10^p, and p always starts with
 ; zero, . . .
 new m  set m=1
 ; If the value is already in the range [1,10), we'll just skip the loop.
 new stop  set stop=%x<10&(%x'<1)
 ; Now, as long as stop isn't true, step up (or down) by powers of ten.
 ; x shrinks (or grows), while m grows (or shrinks). Then we recalculate stop
 ; depending on whether we've gotten close enough to 1.
 write "stepping magnitude",!
 for p=0:step do  quit:stop
 . set %x=%x*$select(step<0:10,1:.1)
 . set m=m*$select(step<0:.1,1:10)
 . set stop=$select(step<0:%x>1,1:%x<10)
 . write "p=",p,", x=",%x,", m=",m,", stop=",stop,!
 . quit
 ; At this point, p is one off. Fix that.
 set p=p+step
 ; At this point, we have scientific notation: x should be in [1,10), and m
 ; should be 10^p, so x*m should match the original argument. But if x>5, we
 ; can get that closer to 1 by dropping a power.
 write "adjust for >5",!
 if %x>5 do
 . set %x=%x*.1
 . set m=m*10
 . set p=p+1
 . quit
 ; At the end, we have to add those powers of ten back to the logarithm.
 ; We'll store that in logm.
 new logm  set logm=p*$$lnten^%tnfcon
 ; Now, we're doing the Taylor series. We're using a variation that depends
 ; on the following identities:
 ;   y = (x-1)/(x+1)
 ;   ln(x) = ln(1+y1/(1-y))
 ;         = 2*y*s
 ; where
 ;   s = sum n=1,3,5... of 1/n*yp, where yp = y^(n-1)
 ; (And this is an excellent example of why I want to finish up a literate
 ; programming method.)
 new y       set y=%x-1/(%x+1)
 new result  set result=2*y
 new power
 ; The first term of the sum is (1/1 * y^0) = 1
 new sum  set sum=1
 new yp   set yp=1
 new term
 ; Do terms two and up until we get to enough decimal places.
 write "taylor series start (epsilon=",epsilon,")",!
 for p=2:2 do  quit:term<%epsilon
 . set yp=yp*y*y ; yp=y^p
 . set term=yp/(p+1)
 . set sum=term+sum
 . write "p=",p,", yp=",yp,", term=",term,", sum=",sum,", e=",epsilon,!
 . quit
 ; Add back those powers of ten and return the value.
 set result=result*sum+logm
 quit $$fmtprec^%tnflib(result,%prec)
 ;
 ;
log(%x,%prec) ; log base 10
 ;sf-isc/rwf,hines/cfb,dw,ven/mcglk;PUBLIC;function;clean;silent;sac
 set %prec=$$prec^%tnflib($get(%prec))
 new %result  set %result=$$ln(%x,%prec)*$$rlnten^%tnfcon(%prec)
 quit $$fmtprec^%tnflib(%result,%prec)
 ;
 ;
eor
