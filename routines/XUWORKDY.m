XUWORKDY ;SF/GJL - WORKDAYS ;02/25/98  11:34
 ;;8.0;KERNEL;**65,71**;Jul 10, 1995
 ;X,X1 are any two dates (YYYMMDD). X=Working Days Between
A N %A,%B,%D,%H,%I,%J,%K,%M,%Y,%Z
 S %A=X,%B=X1,%Z=1 I %A>%B S X=%B,%B=%A,%A=X,%Z=-1
 S %J=$$HDTC(%A) I %Y<0 S X="" G EXIT ;Imprecise date
 S %K=$$HDTC(%B) I %Y<0 S X="" G EXIT
 S %H=0,X=(%J+3#7>4)&(%K+3#7>4) ;I $O(^HOLIDAY(2000000))'>0 S X="" G EXIT
 S %Y=%A-1 F %I=1:1 S %Y=$O(^HOLIDAY(%Y)) Q:(%Y'>0)!(%Y>%B)  S %H=%H+1
 F %J=%J:1 S %Y=%J#7 Q:((%Y=3)!(%J=%K))  S:%Y-2 X=X+1
 F %K=%K:-1 S %Y=%K#7 Q:((%Y=3)!(%K=%J))  S:%Y-2 X=X+1
 S %I=%K-%J I '%I S %Y=%J#7 S:(%Y'=2)&(%Y'=3) X=X+1
 S X=(X+%I-%H-(%I\7*2))*%Z S:X X=X-%Z
EXIT K X1
 Q
HDTC(X) ;Taken from H^%DTC
 S %M=$E(X,4,5),%D=$E(X,6,7) I '%M!'%D S %Y=-1 Q
 N %H S %H=$$FMTH^XLFDT(X)
 S %Y=%H+4#7
 Q %H
EN(X,X1) ;Function entry point
 D A Q X
