%tnlog ;ven/mcglk-types: numbers, development log ;2016-04-02 23:37
 ;;1.5-development;MASH;;
 ;(c) 2016, Frederick D. S. Marshall, all rights reserved
 ;($) funded by Frederick D. S. Marshall
 ;(l) Licensed under Apache License 2.0. See LICENSE file.
 ;
 ;
 ; %tnlog is the Mumps Numeric Library's primary-development log.
 ; It contains no executable software.
 ;
 ;
 ; primary development
 ;
 ; primary developer: Ken McGlothlen (mcglk) <mcglk@vistaexpertise.net>
 ; original author: R. Wally Fort (rwf)
 ;
 ; General:
 ;
 ; I have no idea what the history prior to my getting a hold of this
 ; is. <toad@mumps.org> will know a lot more about it than I. All I know is
 ; that the original attribution line is "SF-ISC/RWF,HINES/CFB,DW", and that it
 ; has two dates associated with it: 1993-07-16 and 1995-03-03.
 ;
 ; From March of 2016, I was busy analyzing the original very compact Mumps
 ; code that made up XLFMTH. It's elegant, but needed some modernization---like
 ; label names and variable names that were longer than one character. It also
 ; had some (rare) problems; one constant was wrong, for example.
 ;
 ; 2016-04-09/mcglk: Starting to move everything into seperate modules, and use
 ; %tn for stub routines.
 ;
 ; 2016-04-08/mcglk: Unit tests for $$prec are in, and a couple of bugs
 ; fixed. Unit tests for $$fmtprec are also in. Since these two have been
 ; unit-tested pretty exhaustively, I'm not going to bother testing the others
 ; on conditions that would trigger the stuff that the unit tests on $$prec and
 ; fmtprec have already brought up.
 ;
 ; 2016-04-04/mcglk: I have the Taylor series in $$ln working, and it's doing
 ; anywhere from 100x to 10000x better in precision. Performance is about on
 ; par.
 ;
 ; 2016-04-02/mcglk: Started writing unit tests in conjunction with refactoring
 ; Wally's initial code.
 ;
 ; Contents:
 ;
 ; %tn:    Mumps numeric library apis
 ; %tnu:   Unit tests
 ; %tnlog: Primary development log
 ;
 ;-----------------------------------------------------------------------------
 ; Discussion:
 ;
 ; The Mumps 1995 standard specified numeric limits:
 ;     RANGE    -> [-1E25, 1E25]
 ;     EPSILON  -> (+/-)1E-25
 ;     SIGDIGIT -> 15
 ; and further specified, "The error introduced by any single instance of the
 ; arithmetic operations of addition, subtraction, multiplication, division,
 ; integer division, or modulo shall not exceed one part in 10 to the 15th. The
 ; error introduced by exponentiation shall not exceed one part in 10 to the
 ; 7th."
 ; 
 ; While I don't know the history of the standard, I suspect that these
 ; original figures predate IEEE 754 (Standard for Binary Floating-Point
 ; Arthmetic), which was officially released in 1984.
 ;
 ; The original XTMMTH module explicitly used in constants with fifteen digits
 ; of precision, thus mostly conforming to IEEE 754 for double-precision
 ; numbers represented in string form for number of digits (though the range
 ; was much smaller). For reference, here are IEEE 754's ranges for
 ; single-precision numeric values as well as double-precision values. Also
 ; included are the approximate "extended-precision" specification, and the
 ; non-standard "quadruple-precision" specification.
 ;
 ; Single precision:
 ;     RANGE    -> [-3.4E38, 3.4E38]
 ;     EPSILON  -> (+/-)1.2E-38
 ;     SIGDIGIT -> 6 (string->binary), 9 (binary->string->binary)
 ; Double precision:
 ;     RANGE    -> [-1.8E308, 1.8E308]
 ;     EPSILON  -> (+/-)2.2E-308
 ;     SIGDIGIT -> 15 (string->binary), 17 (binary->string->binary)
 ; Extended precision:
 ;     RANGE    -> [-1.2E4932, 1.2E4932]
 ;     EPSILON  -> (+/-)3.4E-4932
 ;     SIGDIGIT -> 18 (string->binary), 21 (binary->string->binary)
 ; "Quadruple precision":
 ;     RANGE    -> [-1.2E4932, 1.2E4932]
 ;     EPSILON  -> (+/-)3.4E-4932
 ;     SIGDIGIT -> 33 (string->binary), 36 (binary->string->binary)
 ;
 ; At this writing, because of the possibility of a new standard that conforms
 ; more closely to IEEE 754, constants will be spelled out to 36 places, but
 ; the default precision for formatting these numbers will still be set to 12
 ; places for most purposes. If you need to change that, see $$setprec^%tn; it
 ; has an internal variable called %default which can be changed as necessary.
 ;
 ; Note:
 ; %prec (formerly PR) sets the precision for returned values.
 ;
 ;-----------------------------------------------------------------------------
 ;
 ;
eor ; end of routine %tnlog
