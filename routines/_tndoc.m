%tndoc ;ven/toad&mcglk-types documentation: numbers ;2016-04-08 10:00
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
 ; prec(%prec,%plimit)
 ;
 ;   "get precision to %prec, which must be at most %plimit"
 ;   sf-isc/rwf,hines/cfb,dw,ven/mcglk;PUBLIC;function;clean;silent;sac
 ;
 ;   This is generally used only internally within %tn, but is still available
 ;   for public use. It ideally returns a precision value which is optionally
 ;   limited by %plimit.
 ;
 ;   If no %prec has been supplied, or it's the empty string, or it exceeds
 ;   %plimit, return %plimit; otherwise, return %prec.
 ;
 ;   %plimit can be no more than %deflimit, which is currently set to 12 for
 ;   the 1995 Mumps standard.
 ;
 ;   %plimit is an optional parameter; if unspecified, or it's an empty string,
 ;   it defaults to %deflimit. Otherwise, if it's negative or non-numeric, an
 ;   error is indicated in %e and %deflimit is returned. If it's a non-integer
 ;   value, a warning is indicated in %e and the value is truncated.
 ;
 ;   %prec isn't supposed to be optional, but it defaults to %plimit if
 ;   unsupplied or if an empty string is supplied. Otherwise, if it's negative
 ;   or non-numeric, an error is indicated in %e and %plimit is returned. If
 ;   it's a non-integer value, a warning is indicated in %e and the value is
 ;   truncated before it's compared with %plimit and the minimum of the two is
 ;   returned.
 ;
 ;   Originally, this set a value PR which was used in XLFMTH to retain the
 ;   precision value. Any routine could set PR, which would affect other
 ;   routines. The strategy in %tn is to "localize" it a little more and make
 ;   it settable via arguments (which XLFMTH also allowed).
 ;
 ;
eor

