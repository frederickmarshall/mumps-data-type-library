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
prec1 ; @TEST $$prec: Setting precision
 ;ven/mcglk;test;procedure;clean;report;sac
 ;
 new %e
 new fnc      set fnc="$$prec^%tn"
 new default  set default=12
 ;
 do testfunc(fnc,"",default)
 do testfunc(fnc,"",default,)
 do testfunc(fnc,"",default,,)
 do testfunc(fnc,"",default,"")
 do testfunc(fnc,"",default,,"")
 do testfunc(fnc,"",default,"",)
 do testfunc(fnc,"",default,"","")
 do testfunc(fnc,"",8,,8)
 do testfunc(fnc,"",8,8,10)
 ; do testfunc(fnc,20,,default,"")
 ; do testfunc(fnc,20,10,10,"")
 ; do testfunc(fnc,8.1416,,8,"%tn-w-setprec-nonintprec")
 ; do testfunc(fnc,8.1416,10,8,"%tn-w-setprec-nonintprec")
 ; do testfunc(fnc,20.1416,,default,"%tn-w-setprec-nonintprec")
 ; do testfunc(fnc,8,20,default,"%tn-e-setprec-limittoohigh")
 ; do testfunc(fnc,8.1416,20.1416,default,"%tn-e-setprec-limittoohigh")
 ; do testfunc(fnc,8,-20,default,"%tn-e-setprec-neglimit")
 ; do testfunc(fnc,8.1416,-20.1416,default,"%tn-e-setprec-neglimit")
 ; do testfunc(fnc,-8,,default,"%tn-e-setprec-negprec")
 ; do testfunc(fnc,-8,20,default,"%tn-e-setprec-limittoohigh")
 ; do testfunc(fnc,-8.1416,,default,"%tn-e-setprec-negprec")
 ; do testfunc(fnc,-8.1416,20.1416,default,"%tn-e-setprec-limittoohigh")
 ; do testfunc(fnc,20,-8,default,"%tn-e-setprec-neglimit")
 ; do testfunc(fnc,20.1416,-8.1416,default,"%tn-e-setprec-neglimit")
 ; do testfunc(fnc,-20.1416,,default,"%tn-e-setprec-negprec")
 ; do testfunc(fnc,-20.1416,8.1416,8,"%tn-e-setprec-negprec")
;
 quit  ; end of setprec1
 ;
 ;
fmtprec1 ; @TEST $$fmtprec: Formatting numbers to a precision.
 ;ven/mcglk;test;procedure;clean;report;sac
 ;
 new %e
 new fnc set fnc="$$fmtprec^%tn"
 new tt  set tt=3.14159265358979
 ;
 do testfunc(fnc,"","0")
 do testfunc(fnc,"","0",)
 do testfunc(fnc,"","0",,)
 do testfunc(fnc,"","0","")
 do testfunc(fnc,"","0",,"")
 do testfunc(fnc,"","0","",)
 do testfunc(fnc,"","0","","")
 do testfunc(fnc,"","3.14",tt,3)
 do testfunc(fnc,"","3.14",tt,3)
 do testfunc(fnc,"","3.1416",tt,4)
 do testfunc(fnc,"","3.14159",tt,5)
 ; do fmtprect(20,,default,"")
 ; do fmtprect(20,10,10,"")
 ; do fmtprect(8.1416,,8,"%tn-w-setprec-nonintprec")
 ; do fmtprect(8.1416,10,8,"%tn-w-setprec-nonintprec")
 ; do fmtprect(20.1416,,default,"%tn-w-setprec-nonintprec")
 ; do fmtprect(8,20,default,"%tn-e-setprec-limittoohigh")
 ; do fmtprect(8.1416,20.1416,default,"%tn-e-setprec-limittoohigh")
 ; do fmtprect(8,-20,default,"%tn-e-setprec-neglimit")
 ; do fmtprect(8.1416,-20.1416,default,"%tn-e-setprec-neglimit")
 ; do fmtprect(-8,,default,"%tn-e-setprec-negprec")
 ; do fmtprect(-8,20,default,"%tn-e-setprec-limittoohigh")
 ; do fmtprect(-8.1416,,default,"%tn-e-setprec-negprec")
 ; do fmtprect(-8.1416,20.1416,default,"%tn-e-setprec-limittoohigh")
 ; do fmtprect(20,-8,default,"%tn-e-setprec-neglimit")
 ; do fmtprect(20.1416,-8.1416,default,"%tn-e-setprec-neglimit")
 ; do fmtprect(-20.1416,,default,"%tn-e-setprec-negprec")
 ; do fmtprect(-20.1416,8.1416,8,"%tn-e-setprec-negprec")
 ;
 quit  ; end of setprec1
 ;
 ;
testfunc(%fnc,%err,%expect,%a1,%a2,%a3,%a4,%a5,%a6) ; test n-argument function
 ;ven/mcglk;private;procedure;clean;report;sac
 ;
 if $get(%fnc)="" quit
 ;
 new args     set args=""
 new callstr
 new ii,jj
 new maxargs  set maxargs=6
 new msg
 new nargs    set nargs=0
 new noarg    set noarg="*!eek!*"
 new result
 new tt
 ; compile function call string
 set callstr=%fnc
 write !
 for ii=1:1:maxargs do
 . new argstr  set argstr="%a"_ii
 . new tt      set tt=argstr_"=$get("_argstr_",noarg)"
 . set @tt
 . write argstr," = ",@argstr,!
 . if (@argstr)'=noarg  set args=args_","""_(@argstr)_""""
 . else                 set args=args_","
 . write "args = ",args,!
 ; . new arg  set tt="arg=%a"_ii  set @tt
 ; . set tt="%a"_ii
 ; . write tt," -> """
 ; . write @tt
 ; . write """",!
 ; . if @("%a"_ii_"=""*!eek!*""") do
 ; . . set args=args_","
 ; . else  do
 ; . . set @("args=args_"_","
 ; . if eargs=0
 . quit
 ; Trim trailing commas, and add parens if there's anything left.
 for jj=$length(args):-1:1 write "jj=",jj,",c=",$extract(args,jj),! quit:$extract(args,jj)'=","
 if $extract(args,1,jj)'="," set jj=jj+1 set args=$extract(args,1,jj)
 if args'=""  set args="("_args_")"
 write "args = ",args,!
 ; set callstr=%fnc
 ; if args=1 do
 ; . for ii=1:1:6 do
 ; . . 
 ; if %a="*noarg*"&(%b="*noarg*") do
 ; . quit
 ; else  if %b="*noarg*" do
 ; . set callstr=%fnc_"("""_%a_""")"
 ; . quit
 ; else  if %a="*noarg*" do
 ; . set callstr=%fnc_"(,"""_%b_""")"
 ; . quit
 ; else  do
 ; . set callstr=%fnc_"("""_%a_""","""_%b_""")"
 ; . quit
 ; set @("result="_callstr)
 ; set msg=callstr_" -> "_result_" (expected "_%expect_")"
 ; do CHKTF^HMPT(result=%expect,msg)
 ; set msg=callstr_" returned an unexpected error"
 ; set msg=msg_" ("""_%e_""", expected """_%err_""")"
 ; if %err="" do
 ; . do CHKTF^HMPT(%e=%err)
 ; . quit
 ; else  do
 ; . do CHKTF^HMPT(%e[%err,msg)
 ; . quit
 ; ;
 quit  ; end of testfunc
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
