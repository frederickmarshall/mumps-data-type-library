%tnflib ;ven/toad&mcglk-types: numbers: function library ;2016-04-02 23:37
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
 ; Primary development and discussion: see routine %tnlog.
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
 ;
 ; See %tndoc for usage documentation.
 ;
 new %deflimit set %deflimit=12
 set %e=$get(%e)
 quit:%e'="" %deflimit
 ; Handling %plimit
 set %plimit=$get(%plimit,%deflimit)
 if %plimit="" set %plimit=%deflimit
 if %plimit<0 do
 . set %e="%tn-e-prec-neglimit"
 . set %e=%e_";Can't set a negative precision limit ("_%plimit_")"
 . quit
 else  if %plimit'=+%plimit do
 . set %e="%tn-e-prec-nonsenselimit"
 . set %e=%e_";Non-numeric precision limit ("""_%plimit_""")"
 . quit
 else  if %plimit>%deflimit do
 . set %e="%tn-e-prec-limittoohigh"
 . set %e=%e_";Precision limit ("_%plimit_") cannot exceed "_%deflimit
 . quit
 set:%e'="" %e=%e_", returned default ("_%deflimit_")"
 quit:%e'="" %deflimit
 if %plimit'=(%plimit\1) do
 . set %e="%tn-w-prec-nonintlimit"
 . set %e=%e_";Non-integer precision limit ("""_%plimit_"""), truncated"
 . set %plimit=%plimit\1
 . quit
 ; Handling %prec
 set %prec=$get(%prec,%plimit)
 if %prec="" set %prec=%plimit
 if %prec<0 do
 . set %e="%tn-e-prec-negprec"
 . set %e=%e_";Can't set a negative precision ("_%prec_")"
 . quit
 else  if %prec'=+%prec do
 . set %e="%tn-e-prec-nonsenseprec"
 . set %e=%e_";Non-numeric precision ("""_%prec_""")"
 . quit
 set:%e'="" %e=%e_", returned default precision ("_%plimit_")"
 quit:%e'="" %plimit
 if %prec'=(%prec\1) do
 . set %e="%tn-w-prec-nonintprec"
 . set %e=%e_";Non-integer precision ("""_%prec_"""), truncated"
 . set %prec=%prec\1
 . quit
 ;
 quit $select(%prec>%plimit:%plimit,1:%prec)
 ;
 ;
fmtprec(%x,%prec) ; format %x to precsion %prec
 ;sf-isc/rwf,hines/cfb,dw,ven/mcglk;PUBLIC;function;clean;silent;sac
 ;
 ; See %tndoc for usage documentation.
 ;
 set %x=$get(%x)
 if %x="" set %x=0
 set %prec=$$prec($get(%prec))
 new %decimals
 set %decimals=%prec-$length(%x\1)
 if $extract(%x,1,1)="-" set %decimals=%decimals+1
 if $extract(%x,1,1)="." set %decimals=%decimals+1
 quit +$justify(%x,0,$select(%decimals'<0:%decimals,1:0))
 ;
 ;
epsilon(%prec) ; create a suitable epsilon based on precision value
 ;sf-isc/rwf,hines/cfb,dw,ven/mcglk;PUBLIC;function;clean;silent;sac
 ; Originally called LIM. Sets epsilon to 1000x less than the precision.
 ;
 set %prec=$$prec($get(%prec))
 set %deflimit=$$prec
 new %epsilon
 set %epsilon=%prec+3
 set %epsilon=$select(%epsilon<%deflimit:%epsilon,1:%deflimit-1)
 set @("%epsilon=1E-"_%epsilon)
 quit %epsilon
 ;
 ;
eor
