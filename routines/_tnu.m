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
 do testfunc(fnc,"",3,3)
 do testfunc(fnc,"",3,,3)
 do testfunc(fnc,"",3,4,3)
 do testfunc(fnc,"",3,3,4)
 do testfunc(fnc,"%tn-e-prec-neglimit",default,,-3)
 do testfunc(fnc,"%tn-e-prec-neglimit",default,4,-3)
 do testfunc(fnc,"%tn-e-prec-neglimit",default,4.1631,-3)
 do testfunc(fnc,"%tn-e-prec-neglimit",default,,-3.1416)
 do testfunc(fnc,"%tn-e-prec-neglimit",default,4,-3.1416)
 do testfunc(fnc,"%tn-e-prec-neglimit",default,4.1631,-3.1416)
 do testfunc(fnc,"%tn-e-prec-negprec",default,-3)
 do testfunc(fnc,"%tn-e-prec-negprec",3,-4,3)
 do testfunc(fnc,"%tn-e-prec-negprec",default,-3.1416)
 do testfunc(fnc,"%tn-e-prec-negprec",3,-4.1631,3)
 do testfunc(fnc,"%tn-w-prec-nonintlimit",3,,3.14159)
 do testfunc(fnc,"%tn-w-prec-nonintlimit",3,4,3.14159)
 do testfunc(fnc,"%tn-w-prec-nonintlimit",3,4.1631,3.14159)
 do testfunc(fnc,"%tn-w-prec-nonintprec",3,3.14159)
 do testfunc(fnc,"",default,99)
 do testfunc(fnc,"%tn-e-prec-limittoohigh",default,,99)
 do testfunc(fnc,"%tn-e-prec-limittoohigh",default,3,99)
 do testfunc(fnc,"%tn-e-prec-limittoohigh",default,3.1416,99)
 do testfunc(fnc,"%tn-e-prec-limittoohigh",default,3,99.99)
 do testfunc(fnc,"%tn-e-prec-limittoohigh",default,3.1416,99.99)
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
 do testfunc(fnc,"","3",tt,0)
 do testfunc(fnc,"","3",tt,1)
 do testfunc(fnc,"","3.14",tt,3)
 do testfunc(fnc,"","3.142",tt,4)
 do testfunc(fnc,"","3.1416",tt,5)
 do testfunc(fnc,"","3.14159",tt,6)
 do testfunc(fnc,"%tn-w-prec-nonintprec","3.1416",tt,5.3)
 do testfunc(fnc,"%tn-e-prec-negprec",3.14159265359,tt,-5.3)
 do testfunc(fnc,"",3.14159265359,tt,20)
 do testfunc(fnc,"%tn-w-prec-nonintprec",3.14159265359,tt,20.384)
 do testfunc(fnc,"%tn-e-prec-negprec",3.14159265359,tt,-20)
 do testfunc(fnc,"%tn-e-prec-negprec",3.14159265359,tt,-20.384)
 set tt=-3.14159265358979
 do testfunc(fnc,"","-3",tt,0)
 do testfunc(fnc,"","-3",tt,1)
 do testfunc(fnc,"","-3.14",tt,3)
 do testfunc(fnc,"","-3.142",tt,4)
 do testfunc(fnc,"","-3.1416",tt,5)
 do testfunc(fnc,"","-3.14159",tt,6)
 do testfunc(fnc,"%tn-w-prec-nonintprec","-3.1416",tt,5.3)
 do testfunc(fnc,"%tn-e-prec-negprec","-3.14159265359",tt,-5.3)
 do testfunc(fnc,"","-3.14159265359",tt,20)
 do testfunc(fnc,"%tn-w-prec-nonintprec","-3.14159265359",tt,20.384)
 do testfunc(fnc,"%tn-e-prec-negprec","-3.14159265359",tt,-20)
 do testfunc(fnc,"%tn-e-prec-negprec","-3.14159265359",tt,-20.384)
 ;
 quit  ; end of setprec1
 ;
 ; Note: From here on out, the conditions that show up in the exhaustive tests
 ;  above won't be repeated; only what we need.
 ;
e1 ; @TEST $$e: The constant e
 ;ven/mcglk;test;procedure;clean;report;sac
 ;
 new %e
 new fnc set fnc="$$e^%tn"
 ;
 do testfunc(fnc,"","2.71828182846")
 do testfunc(fnc,"","2.72",3)
 ;
 quit
 ;
 ;
pi1 ; @TEST $$pi: The constant pi
 ;ven/mcglk;test;procedure;clean;report;sac
 ;
 new %e
 new fnc set fnc="$$pi^%tn"
 ;
 do testfunc(fnc,"","3.14159265359")
 do testfunc(fnc,"","3.14",3)
 ;
 quit
 ;
 ;
lnten1 ; @TEST $$lnten: The constant ln 10
 ;ven/mcglk;test;procedure;clean;report;sac
 ;
 new %e
 new fnc set fnc="$$lnten^%tn"
 ;
 do testfunc(fnc,"","2.30258509299")
 do testfunc(fnc,"","2.3",3)
 ;
 quit
 ;
 ;
rlnten1 ; @TEST $$rlnten: The constant 1/(ln 10)
 ;ven/mcglk;test;procedure;clean;report;sac
 ;
 new %e
 new fnc set fnc="$$rlnten^%tn"
 ;
 do testfunc(fnc,"",".434294481903")
 do testfunc(fnc,"",".43429",5)
 ;
 quit
 ;
 ;
abs ; @TEST $$abs: Absolute value function
 ;ven/mcglk;test;procedure;clean;report;sac
 ;
 new %e
 new fnc set fnc="$$abs^%tn"
 ;
 do testfunc(fnc,"%tn-e-abs-noarg","0")
 do testfunc(fnc,"%tn-e-abs-badarg","0","q")
 do testfunc(fnc,"%tn-e-abs-badarg","0","1q")
 do testfunc(fnc,"","0",0)
 do testfunc(fnc,"","1",1)
 do testfunc(fnc,"","1",-1)
 do testfunc(fnc,"","3.1416",3.1416)
 do testfunc(fnc,"","3.1416",-3.1416)
 ;
 quit
 ;
 ;
min ; @TEST $$min: Minimum of two values
 ;ven/mcglk;test;procedure;clean;report;sac
 ;
 new %e
 new fnc set fnc="$$min^%tn"
 ;
 do testfunc(fnc,"%tn-e-min-noargs","0")
 do testfunc(fnc,"%tn-e-min-noargs","0",)
 do testfunc(fnc,"%tn-e-min-noargs","0",,)
 do testfunc(fnc,"%tn-e-min-noarg1","0",,-1)
 do testfunc(fnc,"%tn-e-min-noarg2","0",-1,)
 do testfunc(fnc,"%tn-e-min-badarg1","0","qq",-1)
 do testfunc(fnc,"%tn-e-min-badarg2","0",-1,"qq")
 do testfunc(fnc,"","-1",-1,1)
 do testfunc(fnc,"","-3.14159",-3.14159,3.14159)
 do testfunc(fnc,"","-3.142",-3.14159,3.14159,4)
 ;
 quit
 ;
 ;
max ; @TEST $$max: Maximum of two values
 ;ven/mcglk;test;procedure;clean;report;sac
 ;
 new %e
 new fnc set fnc="$$max^%tn"
 ;
 do testfunc(fnc,"%tn-e-max-noargs","0")
 do testfunc(fnc,"%tn-e-max-noargs","0",)
 do testfunc(fnc,"%tn-e-max-noargs","0",,)
 do testfunc(fnc,"%tn-e-max-noarg1","0",,-1)
 do testfunc(fnc,"%tn-e-max-noarg2","0",-1,)
 do testfunc(fnc,"%tn-e-max-badarg1","0","qq",-1)
 do testfunc(fnc,"%tn-e-max-badarg2","0",-1,"qq")
 do testfunc(fnc,"","1",-1,1)
 do testfunc(fnc,"","3.14159",-3.14159,3.14159)
 do testfunc(fnc,"","3.142",-3.14159,3.14159,4)
 ;
 quit
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
 ; process %a1 through %an (where n = maxargs), adding onto args
 for ii=1:1:maxargs do
 . new argstr  set argstr="%a"_ii
 . new tt      set tt=argstr_"=$get("_argstr_",noarg)"
 . set @tt
 . if ii'=1 set args=args_","
 . if (@argstr)'=noarg  set args=args_""""_(@argstr)_""""
 . quit
 ; Trim trailing commas from args, and add parens if there's anything left.
 for jj=$length(args):-1:1 quit:$extract(args,jj)'=","
 set args=$extract(args,1,jj)
 if args=","  set args=""
 if args'=""  set args="("_args_")"
 ; set up the call
 set callstr=%fnc_args
 set @("result="_callstr)
 set msg=callstr_" -> "_result_" (expected "_%expect_")"
 do CHKTF^HMPT(result=%expect,msg)
 set msg=callstr_" returned an unexpected error"
 set msg=msg_" ("""_%e_""", expected """_%err_""")"
 if %err="" do
 . do CHKTF^HMPT(%e=%err,msg)
 . quit
 else  do
 . do CHKTF^HMPT(%e[%err,msg)
 . quit
 set %e=""
 ;
 quit  ; end of testfunc
 ;
 ;
 ;
 quit
 ;
 ;
eor
