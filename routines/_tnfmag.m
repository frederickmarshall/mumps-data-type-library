%tnfmag ;ven/toad&mcglk-types: numbers: magnitude functions ;2016-04-10 01:27
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
 ; Magnitude functions (%tnfmag)
 ;-----------------------------------------------------------------------------
 ;
abs(%x,%prec) ; absolute value
 ;sf-isc/rwf,hines/cfb,dw,ven/mcglk;PUBLIC;function;clean;silent;sac
 set %prec=$$prec^%tnflib($get(%prec),12)
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
 quit $$fmtprec^%tnflib(%x,%prec)
 ;
 ;
minmaxar(%fnc,%a,%b) ; Set %e if something weird happened.
 ;sf-isc/rwf,hines/cfb,dw,ven/mcglk;PUBLIC;function;clean;silent;sac
 set %prec=$$prec^%tnflib($get(%prec),12)
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
 set %prec=$$prec^%tnflib($get(%prec),12)
 set %a=$get(%a)
 set %b=$get(%b)
 do minmaxar("min",%a,%b)
 if %e'="" set %e=%e_", 0 returned"
 quit:%e'="" 0
 set %a=$select(%a<%b:%a,1:%b)
 quit $$fmtprec^%tnflib(%a,%prec)
 ;
 ;
max(%a,%b,%prec) ; Maximum of two values
 ;sf-isc/rwf,hines/cfb,dw,ven/mcglk;PUBLIC;function;clean;silent;sac
 set %prec=$$prec^%tnflib($get(%prec),12)
 set %a=$get(%a)
 set %b=$get(%b)
 do minmaxar("max",%a,%b)
 if %e'="" set %e=%e_", 0 returned"
 quit:%e'="" 0
 set %a=$select(%a<%b:%b,1:%a)
 quit $$fmtprec^%tnflib(%a,%prec)
 ;
 ;
eor
