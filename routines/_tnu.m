%tnu ;ven/mcglk-unit tests for numeric types ;2016-04-02 23:37
 ;;1.5-development;MASH;;
 ;(c) 2016, Frederick D. S. Marshall, all rights reserved
 ;($) funded by Frederick D. S. Marshall
 ;(l) Licensed under Apache License 2.0. See LICENSE file.
 ;
 ; CURRENTLY UNTESTED AND IN PROGRESS
 ; %tnu contains the unit tests for the Mumps Numeric Library, an
 ; element of the Mumps Advanced Shell's Data Types Library.
 ;
 ; Primary development: see routine %tnlog
 ;
 do EN^HMPT($text(+0),2)
 quit
 ;
setprec1 ; @TEST $$setprec: Setting precision
 ;ven/mcglk;test;procedure;clean;report;sac
 ;
 new default set default=12
 ;
 do setprect(,,default,"")
 do setprect("","",default,"")
 do setprect(8,,8,"")
 do setprect(8,10,8,"")
 do setprect(20,,default,"")
 do setprect(20,10,10,"")
 do setprect(8.1416,,8,"%tn-w-setprec-nonintprec")
 do setprect(8.1416,10,8,"%tn-w-setprec-nonintprec")
 do setprect(20.1416,,default,"%tn-w-setprec-nonintprec")
 do setprect(8,20,default,"%tn-e-setprec-limittoohigh")
 do setprect(8.1416,20.1416,default,"%tn-e-setprec-limittoohigh")
 do setprect(8,-20,default,"%tn-e-setprec-neglimit")
 do setprect(8.1416,-20.1416,default,"%tn-e-setprec-neglimit")
 do setprect(-8,,default,"%tn-e-setprec-negprec")
 do setprect(-8,20,default,"%tn-e-setprec-limittoohigh")
 do setprect(-8.1416,,default,"%tn-e-setprec-negprec")
 do setprect(-8.1416,20.1416,default,"%tn-e-setprec-limittoohigh")
 do setprect(20,-8,default,"%tn-e-setprec-neglimit")
 do setprect(20.1416,-8.1416,default,"%tn-e-setprec-neglimit")
 do setprect(-20.1416,,default,"%tn-e-setprec-negprec")
 do setprect(-20.1416,8.1416,8,"%tn-e-setprec-negprec")
 ;
 quit  ; end of setprec1
 ;
 ;
setprect(%a,%b,%expect,%err) ; test a particular $$setprec^%tn call
 ;ven/mcglk;private;procedure;clean;silent;sac
 new msg
 new result
 new callstr
 new %e
 set %a=$get(%a,"*noarg*") ; special flag
 set %b=$get(%b,"*noarg*")
 if %a="*noarg*"&(%b="*noarg*") do
 . set result=$$setprec^%tn
 . set callstr="$$setprec"
 . quit
 else  if %b="*noarg*" do
 . set result=$$setprec^%tn(%a)
 . set callstr="$$setprec("_%a_")"
 . quit
 else  if %a="*noarg*" do
 . set result=$$setprec^%tn(,%b)
 . set callstr="$$setprec(,"_%b_")"
 . quit
 else  do
 . set result=$$setprec^%tn(%a,%b)
 . set callstr="$$setprec("_%a_","_%b_")"
 . quit
 set msg=callstr_" -> "_result_" (expected "_%expect_")"
 do CHKTF^HMPT(result=%expect,msg)
 set msg=callstr_" returned an unexpected error"
 set msg=msg_" ("""_%e_""", expected """_%err_""")"
 if %err="" do
 . do CHKTF^HMPT(%e=%err)
 . quit
 else  do
 . do CHKTF^HMPT(%e[%err,msg)
 . quit
 quit
 ;
 ;
 ;
 ;
 ; e1 ; @TEST $$e: The natural logarithm
 ;  ;ven/mcglk;test;procedure;clean;report;sac
 ;  ;
 ;  new expect set expect=2.718
 ;  new result set result=$$e^%tn
 ;  new msg set msg="Default result should be "_expect_", not "_result
 ;  do CHKTF^HMPT(result=expect,msg)
 ;  ;
 ;  new expect set expect=2.718
 ;  new result set result=$$e^%tn(6)
 ;  new msg set msg="Default result should be "_expect_", not "_result
 ;  do CHKTF^HMPT(result=expect,msg)
 ;  ;
 ;  new expect set expect=2.718
 ;  new result set result=$$e^%tn(0)
 ;  new msg set msg="Default result should be "_expect_", not "_result
 ;  do CHKTF^HMPT(result=expect,msg)
 ;  ;
 ;  new expect set expect=2.718
 ;  new result set result=$$e^%tn(-1)
 ;  new msg set msg="Default result should be "_expect_", not "_result
 ;  do CHKTF^HMPT(result=expect,msg)
 ;  ;
 ;  new expect set expect=2.718
 ;  new result set result=$$e^%tn(20)
 ;  new msg set msg="Default result should be "_expect_", not "_result
 ;  do CHKTF^HMPT(result=expect,msg)
 ;  ;
 quit
 ;
 ;
eor
