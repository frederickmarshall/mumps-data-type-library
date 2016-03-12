%tslice ;ven/toad-types: string slices ;2016-03-11 19:48
 ;;1.5-development;MASH;;
 ;(c) 2016, Frederick D. S. Marshall, all rights reserved
 ;($) funded by Frederick D. S. Marshall
 ;(l) Licensed under Apache License 2.0. See LICENSE file.
 ;
 ;
 ; %tslice is an extension of %ts. It implements the public
 ; string-slice entry points of routine %ts.
 ;
 ;
 ; primary development: see routine %tslog
 ;
 ;
 ; contents
 ;
 ; string-slice functions (%tslice)
 ;
 ; $$gs = get slice(s) of string
 ; ss = set slice(s) of string
 ; ms = mat-out slice(s) in string
 ; cs = cut slice(s) from string
 ; ps: insert new slices into string
 ;
 ;
 ; to do
 ;
 ;   net: remove slices from string and assign to variable
 ; $$cnt: count slices (string length in slices)
 ;
 ; create unit tests for these subroutines
 ;
 ; make cut slice et al either modify %s or return modified %s
 ;   set %s1=$$cut(%s2) sets %s1 to cut-down form of %s2
 ;   do cut(.%s2) cuts down %s2
 ; make negative work from end backward
 ; ***** put slice, net slice *****
 ; should slice-library preserve an incomplete final slice?
 ; ***** string walkers *****
 ;
 ; tie max string length in $$repeat to standard and/or implementation
 ; apply standard string-length protection consistently in all subroutines
 ;
 ;
 ; string-slice tools
 ;
 ; %sl = string length
 ; %sls = string length in slices
 ; %ss = string slice
 ; %ssl = string slice length
 ; %ssn = string slice number
 ; %ssf = string slice from position
 ; %sst = string slice to position
 ;
 ; $$get: copy values of slices from string
 ;   set: change values of slices in string (or create new ones)
 ;   mat: change values of slices to spaces
 ;   cut: remove slices from string
 ;   put: insert new slices into string
 ;
 ;
gs(%s,%ssl,%ssf,%sst) ; get slice(s) of string
 ;ven/toad;private;procedure;clean;silent;sac
 ; called by:
 ;   $$getslice^%ts
 ;   $$gs^%ts
 ; calls: none
 ; input:
 ;   %s = source string
 ;   %ssl = slice length, defaults to 80
 ;   %ssf = string slice from-position, defaults to 1
 ;   %sst = string slice to-position, defaults to %ssf
 ; output = string composed of those slices
 ; examples:
 ;      if long = a very long string
 ;   $$gs(long) = first 80 characters of long
 ;   $$gs("Old-world Principles",3) = "Old"
 ;   $$gs("Old-world Principles",3,2) = "-wo"
 ;   $$gs(long,,2) = second 80 characters of long
 ;   $$gs("Old-world Principles",3,3,4) = "rld Pr"
 ;
 new %empty set %empty=1 ; default to boundary condition
 do  ; init parameters and check boundaries
 . quit:$g(%s)=""  ; can't get slices from empty string
 . ;
 . set %ssl=$get(%ssl,80)\1 ; init slice length
 . quit:%ssl<1  ; slice length is a counting #
 . ;
 . set %ssf=$get(%ssf,1)\1 ; init from-slice
 . quit:%ssf<1   ; from-slice is a counting #
 . ;
 . set %sst=$get(%sst,%ssf)\1 ; init to-slice
 . quit:%sst<1  ; to-slice is a counting #
 . ;
 . set %empty=0 ; passed boundary conditions
 . quit
 if %empty quit "" ; return the empty string for boundary conditions
 ;
 new %ss set %ss=$extract(%s,%ssf-1*%ssl+1,%sst*%ssl) ; slice(s)
 ;
 quit %ss ; end of $$gs, return slices
 ;
 ;
ss(%s,%ss,%ssl,%ssf,%sst) ; set slice(s) of string
 ;ven/toad;private;procedure;clean;silent;sac
 ; called by:
 ;   setslice^%ts
 ;   ss^%ts
 ; calls: none
 ; input:
 ;  .%s = source string
 ;   %ss = new slice(s) to set into string
 ;   %ssl = slice length, defaults to 80
 ;   %ssf = string slice from-position, defaults to 1
 ;   %sst = string slice to-position, defaults to %ssf
 ; output: .%s with replaced slices
 ; examples:
 ;      if long = a very long string
 ;      & if short="Old-world Principles"
 ;   do ss(.long,$$repeat("-"))
 ;      replaces 1st 80 chars of long with hyphens
 ;   do ss(.long,$$repeat("-"),,2)
 ;      replaces 2nd 80 chars of long with hyphens
 ;   do ss(.short,"New",3)
 ;      short = "New-world Principles"
 ;   do ss(.short,"ess",3,6)
 ;      short = "Old-world Princesses"
 ;   do ss(.short,"school",3,2,3)
 ;      short = "Old-school Principles"
 ;   do ss(.short,"",3,2,3)
 ;      short = "Old Principles"
 ;
 new %empty set %empty=1 ; default to boundary condition
 do  ; init parameters and check boundaries
 . set %ss=$get(%ss) ; init slices
 . ;
 . set %ssl=$get(%ssl,80)\1 ; init slice length
 . quit:%ssl<1  ; slice length is a counting #
 . ;
 . set %ssf=$get(%ssf,1)\1 ; init from-slice
 . quit:%ssf<1   ; from-slice is a counting #
 . ;
 . set %sst=$get(%sst,%ssf)\1 ; init to-slice
 . quit:%sst<1  ; to-slice is a counting #
 . ;
 . set %empty=0 ; passed boundary conditions
 . quit
 if %empty quit "" ; return the empty string for boundary conditions
 ;
 set $extract(%s,%ssf-1*%ssl+1,%sst*%ssl)=%ss ; set slice(s)
 ;
 quit  ; end of ss
 ;
 ;
ms(%s,%ssl,%ssf,%sst) ; mat out slice(s) in string
 ;ven/toad;private;procedure;clean;silent;sac
 ; called by:
 ;   matslice^%ts
 ;   ms^%ts
 ; calls: none
 ; input:
 ;  .%s = source string
 ;   %ssl = slice length, defaults to 80
 ;   %ssf = string slice from-position, defaults to 1
 ;   %sst = string slice to-position, defaults to %ssf
 ; output = string with matted-out slices
 ; examples:
 ;      if long = a very long string
 ;      & if short="Old-world Principles"
 ;   do ms(.long)
 ;      replaces 1st 80 chars of long with spaces
 ;   do ms(.long,,2)
 ;      replaces 2nd 80 chars of long with spaces
 ;   do ms(.short,3)
 ;      short = "   -world Principles"
 ;   do ms(.short,3,6)
 ;      short = "Old-world Princ   es"
 ;   do ms(.short,3,2,3)
 ;      short = "Old       Principles"
 ;
 new %empty set %empty=1 ; default to boundary condition
 do  ; init parameters and check boundaries
 . set %ssl=$get(%ssl,80)\1 ; init slice length
 . quit:%ssl<1  ; slice length is a counting #
 . ;
 . set %ssf=$get(%ssf,1)\1 ; init from-slice
 . quit:%ssf<1   ; from-slice is a counting #
 . ;
 . set %sst=$get(%sst,%ssf)\1 ; init to-slice
 . quit:%sst<1  ; to-slice is a counting #
 . ;
 . set %empty=0 ; passed boundary conditions
 . quit
 if %empty quit "" ; return the empty string for boundary conditions
 ;
 new %msl set %msl=%sst-%ssf+1*%ssl ; multi-slice length
 new %ss set %ss=$$repeat(" ",%msl) ; create mat-slices
 set $extract(%s,%ssf-1*%ssl+1,%sst*%ssl)=%ss ; mat-out slices
 ;
 quit  ; end of ms
 ;
 ;
cs(%s,%ssl,%ssf,%sst) ; cut slice(s) from string
 ;ven/toad;private;procedure;clean;silent;sac
 ; called by:
 ;   cutslice^%ts
 ;   cs^%ts
 ; calls: none
 ; input:
 ;  .%s = source string
 ;   %ssl = slice length, defaults to 80
 ;   %ssf = string slice from-position, defaults to 1
 ;   %sst = string slice to-position, defaults to %ssf
 ; output = string without those slices
 ; examples:
 ;      if long = a very long string
 ;      & if short="Old-world Principles"
 ;   do cs(.long)
 ;      removes 1st 80 chars of long
 ;   do cs(.long,,2)
 ;      removes 2nd 80 chars of long
 ;   do cs(.short,3)
 ;      short = "-world Principles"
 ;   do cs(.short,3,6)
 ;      short = "Old-world Princes"
 ;   do cs(.short,3,2,3)
 ;      short = "Old Principles"
 ;
 new %empty set %empty=1 ; default to boundary condition
 do  ; init parameters and check boundaries
 . set %ssl=$get(%ssl,80)\1 ; init slice length
 . quit:%ssl<1  ; slice length is a counting #
 . ;
 . set %ssf=$get(%ssf,1)\1 ; init from-slice
 . quit:%ssf<1   ; from-slice is a counting #
 . ;
 . set %sst=$get(%sst,%ssf)\1 ; init to-slice
 . quit:%sst<1  ; to-slice is a counting #
 . ;
 . set %empty=0 ; passed boundary conditions
 . quit
 if %empty quit "" ; return the empty string for boundary conditions
 ;
 new %msl set %msl=%sst-%ssf+1*%ssl ; multi-slice length
 set $extract(%s,%ssf-1*%ssl+1,%sst*%ssl)="" ; cut slices
 ;
 quit  ; end of cs
 ;
 ;
ps(%s,%ss,%ssl,%ssf,%sst) ; put new slice(s) into string
 ;ven/toad;private;procedure;clean;silent;sac
 ; called by:
 ;   putslice^%ts
 ;   ps^%ts
 ; calls: none
 ; input:
 ;  .%s = source string
 ;   %ss = new slice(s) to set into string
 ;   %ssl = slice length, defaults to 80
 ;   %ssf = string slice from-position, defaults to 1
 ;   %sst = string slice to-position, defaults to %ssf
 ; output = string with additional slices
 ; examples:
 ;      if long = a very long string
 ;      & if short="Old-world Principles"
 ;   do ps(.long,$$repeat("-"))
 ;      inserts 80 dashes 1st 80 chars of long
 ;   do ps(.long,,2)
 ;      removes 2nd 80 chars of long
 ;   do ps(.short,3)
 ;      short = "Old-world Principles"
 ;   do ps(.short,3,6)
 ;      short = "Old-world Principles"
 ;   do ps(.short,3,2,3)
 ;      short = "Old-world Principles"
 ;
 new %empty set %empty=1 ; default to boundary condition
 do  ; init parameters and check boundaries
 . set %ss=$get(%ss) ; init slices
 . ;
 . set %ssl=$get(%ssl,80)\1 ; init slice length
 . quit:%ssl<1  ; slice length is a counting #
 . ;
 . set %ssf=$get(%ssf,1)\1 ; init from-slice
 . quit:%ssf<1   ; from-slice is a counting #
 . ;
 . set %sst=$get(%sst,%ssf)\1 ; init to-slice
 . quit:%sst<1  ; to-slice is a counting #
 . ;
 . set %empty=0 ; passed boundary conditions
 . quit
 if %empty quit "" ; return the empty string for boundary conditions
 ;
 ; add line to fetch piece to be inserted before or after
 do ss(%s,%ss,%ssl,%ssf,%sst) ; change this to include that piece
 ;
 quit  ; end of ps
 ;
 ;
 ;   net: remove slices from string and assign to variable
 ;
 ;
 ; $$cnt: count slices (string length in slices)
 ;
 ;
eor ; end of routine %tslice
