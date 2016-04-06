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
setprec1 ; @TEST $$setprec: Setting precision.
 ;ven/mcglk;test;procedure;clean;report;sac
 ;
 new default set default=12
 ;
 ; The following tests should always result in the default value.
 ;
 new expect set expect=default
 new result set result=$$setprec^%tn
 new msg set msg="Default result should be "_expect_", not "_result
 do CHKTF^HMPT(result=expect,msg)
 ;
 set result=$$setprec^%tn(20)
 set msg="$$setprec(20) -> "_result_" (expected "_expect_")"
 do CHKTF^HMPT(result=expect,msg)
 ;
 set result=$$setprec^%tn(-8)
 set msg="$$setprec(-8) -> "_result_" (expected "_expect_")"
 do CHKTF^HMPT(result=expect,msg)
 ;
 set result=$$setprec^%tn(-8,20)
 set msg="$$setprec(-8,20) -> "_result_" (expected "_expect_")"
 do CHKTF^HMPT(result=expect,msg)
 ;
 set result=$$setprec^%tn(-20,8)
 set msg="$$setprec(-20,8) -> "_result_" (expected "_expect_")"
 do CHKTF^HMPT(result=expect,msg)
 ;
 set result=$$setprec^%tn(8,-20)
 set msg="$$setprec(8,-20) -> "_result_" (expected "_expect_")"
 do CHKTF^HMPT(result=expect,msg)
 ;
 set result=$$setprec^%tn(20,-8)
 set msg="$$setprec(20,-8) -> "_result_" (expected "_expect_")"
 do CHKTF^HMPT(result=expect,msg)
 ;
 set result=$$setprec^%tn(20.1416)
 set msg="$$setprec(20.1416) -> "_result_" (expected "_expect_")"
 do CHKTF^HMPT(result=expect,msg)
 ;
 set result=$$setprec^%tn(-8.1416)
 set msg="$$setprec(-8.1416) -> "_result_" (expected "_expect_")"
 do CHKTF^HMPT(result=expect,msg)
 ;
 set result=$$setprec^%tn(-8.1416,20.1416)
 set msg="$$setprec(-8.1416,20.1416) -> "_result_" (expected "_expect_")"
 do CHKTF^HMPT(result=expect,msg)
 ;
 set result=$$setprec^%tn(-20.1416,8.1416)
 set msg="$$setprec(-20.1416,8.1416) -> "_result_" (expected "_expect_")"
 do CHKTF^HMPT(result=expect,msg)
 ;
 set result=$$setprec^%tn(8.1416,-20.1416)
 set msg="$$setprec(8.1416,-20.1416) -> "_result_" (expected "_expect_")"
 do CHKTF^HMPT(result=expect,msg)
 ;
 set result=$$setprec^%tn(20.1416,-8.1416)
 set msg="$$setprec(20.1416,-8.1416) -> "_result_" (expected "_expect_")"
 do CHKTF^HMPT(result=expect,msg)
 ;
 ; Now on to more useful tests.
 ;
 set expect=8
 set result=$$setprec^%tn(8)
 set msg="$$setprec(8) -> "_result_" (expected "_expect_")"
 do CHKTF^HMPT(result=expect,msg)
 ;
 set expect=8
 set result=$$setprec^%tn(8.1416)
 set msg="$$setprec(8.1416) -> "_result_" (expected "_expect_")"
 do CHKTF^HMPT(result=expect,msg)
 ;
 set expect=8
 set result=$$setprec^%tn(8,10)
 set msg="$$setprec(8,10) -> "_result_" (expected "_expect_")"
 do CHKTF^HMPT(result=expect,msg)
 ;
 set expect=9
 set result=$$setprec^%tn(9.1416,11)
 set msg="$$setprec(9.1416,11) -> "_result_" (expected "_expect_")"
 do CHKTF^HMPT(result=expect,msg)
 ;
 set expect=9
 set result=$$setprec^%tn(9,11.1416)
 set msg="$$setprec(9,11.1416) -> "_result_" (expected "_expect_")"
 do CHKTF^HMPT(result=expect,msg)
 ;
 set expect=9
 set result=$$setprec^%tn(9.1416,11.1416)
 set msg="$$setprec(9.1416,11.1416) -> "_result_" (expected "_expect_")"
 do CHKTF^HMPT(result=expect,msg)
 ;
 quit  ; end of setprec1
 ;
 ;
e1 ; @TEST $$e: The natural logarithm
 ;ven/mcglk;test;procedure;clean;report;sac
 ;
 new expect set expect=2.718
 new result set result=$$e^%tn
 new msg set msg="Default result should be "_expect_", not "_result
 do CHKTF^HMPT(result=expect,msg)
 ;
 new expect set expect=2.718
 new result set result=$$e^%tn(6)
 new msg set msg="Default result should be "_expect_", not "_result
 do CHKTF^HMPT(result=expect,msg)
 ;
 new expect set expect=2.718
 new result set result=$$e^%tn(0)
 new msg set msg="Default result should be "_expect_", not "_result
 do CHKTF^HMPT(result=expect,msg)
 ;
 new expect set expect=2.718
 new result set result=$$e^%tn(-1)
 new msg set msg="Default result should be "_expect_", not "_result
 do CHKTF^HMPT(result=expect,msg)
 ;
 new expect set expect=2.718
 new result set result=$$e^%tn(20)
 new msg set msg="Default result should be "_expect_", not "_result
 do CHKTF^HMPT(result=expect,msg)
 ;
 quit
 ;
 ;
eor
