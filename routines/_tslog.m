%tslog ;ven/toad-types: strings, development log ;2016-04-05 15:58
 ;;1.5-development;MASH;;
 ;(c) 2016, Frederick D. S. Marshall, all rights reserved
 ;($) funded by Frederick D. S. Marshall
 ;(l) Licensed under Apache License 2.0. See LICENSE file.
 ;
 ;
 ; %tslog is the Mumps String Library's primary-development log.
 ; It contains no executable software.
 ;
 ;
 ; primary development
 ;
 ; primary developer: Frederick D. S. Marshall (toad) <toad@mumps.org>
 ; original author: R. Wally Fort (rwf)
 ; additional authors: Zach Gonzales (zag), Ed de Moel (edm),
 ; Ken McGlothlen (mcglk)
 ;
 ; 1987-11/1995-10 mdc/edm: create MDC's $%PRODUCE and $%REPLACE
 ; proposals based on separate initial proposals by Richard Walters
 ; (MDC) and Alfons Puig (MDCC-E); include sample code for implementing
 ; these functions.
 ;
 ; 1994-11-04 isf/rwf Kernel 8.0: create routine XLFSTR. $$UP, $$LOW,
 ; $$STRIP, $$REPEAT, $$INVERT, $$REPLACE, $$RJ, $$LJ, $$CJ, $$QUOTE.
 ;
 ; ca. 1995 isf/toad: create $$HTML^DILF to convert ^ and & in
 ; strings for use in HTML; create $$TRANSL8^DILF to implement
 ; $%REPLACE to support $$HTML.
 ;
 ; 1999-02-23 isf/rwf XU*8*112: add $$TRIM^XLFSTR(x[,"[L][R]"]) to trim
 ; spaces from left, right, or both of string.
 ;
 ; 1999-06-17 isf/rwf XU*8*120: add third param to $$TRIM to trim
 ; character other than space.
 ;
 ; 2002-03-13/14 sea/toad ARJT*8*2: create routine XLFSTR2. $$SEN,
 ; $$CAP, FIELDX.
 ;
 ; 2005-12-28 isf/rwf XU*8*400: XLFSTR: add $$SENTENCE & $$TITLE.
 ; based on design by sea/toad.
 ;
 ; 2006-12-19 isf/rwf XU*8*437: XLFSTR: add $$SPLIT. Fix bug in
 ; $$TRIM to trim spaces from " " properly.
 ;
 ; 2009-08-01/31 kbaz/zag: create routine JJOHCASE as part of Paideia
 ; training, including multiple string case-conversion and translation
 ; subroutines.
 ;
 ; 2012-04-24 kbaz/zag & ven/toad: create routine XVDSTR with FIELDX.
 ; add $$ESCAPE to convert strings for use with the unix enviroment to
 ; escape special characters.
 ;
 ; 2012-06-07 kbaz/zag & ven/toad: XVDSTR: add ";" to the list of
 ; characters to escape.
 ;
 ; 2012-06-08 kbaz/zag & ven/toad: XVDSTR: add "|" to the list of
 ; characters to escape.
 ;
 ; 2013-08-23 ven/toad: XLFSTR2: add $$VALID, change history, header,
 ; EOR.
 ;
 ; 2015-06-05 ven/toad: create routine %sm. pta.
 ;
 ; 2015-11-12/13 ven/toad: create routine %s with all functions from
 ; XLFSTR, XLFSTR2, XVDSTR, and %sm. lowercase labels. delete fieldx;
 ; keep pta. upgrade & refactor $$title; remove $$cap. refactor
 ; $$sentence; remove $$sen. refactor $$up, $$low, $$strip, $$repeat.
 ; rename $$up -> $$uc, $$low -> $$lc, wrap with $$upcase, $$lowcase,
 ; rename $$sentence -> $$sc, $$title -> $$cc, wrap with $$sencase,
 ; $$capcase. wrap pta with mergepta. convert $$split to procedure.
 ; rename split -> ptv, wrap with mergeptv.
 ;
 ; 2015-12-18/22 ven/toad: add missing string-merge tools to to-do list;
 ; finish building contents section; add to-do items from routine
 ; JJOHCASE; add it and produce & replace to history; delete $$quote
 ; and add it to the to-do list; rename $$escape -> $$unix; add $$HTML
 ; from routine DILF to to-do list; create $$alphabet & $$ALPHABET &
 ; use them; create $$ic & $$invcase from INVERT^JJOHCASE. Fix calls to
 ; $$lc & $$uc in $$sc & $$cc; comment %%uc, %%lc, $$ic, $$sc, $$cc;
 ; refactor $$rj, $$rjustify, $$lj, $$ljustify, $$cj, $$cjustify; create
 ; padtrunc, ctv, mergectv.
 ;
 ; 2016-01-31/02-09 ven/toad: copy routine %ts from %s. renamespace from
 ; %a* to %g*; add column-merge subroutines to to-do list; loosen
 ; namespaces of local variables, keep within %, focus on readability &
 ; brevity; refine comments; refactor & add defaults & max lengths to
 ; padtrunc, $$rj, $$lj, $$cj, $$repeat, $$strip; refactor $$trim;
 ; rewrite $$replace based on mdc/edm's $%replace^string proposal
 ; x11/1995-112, add isf/rwf's first few lines, split %spec into %find &
 ; %replace to support top-level parameters, define $$replace using
 ; examples in comments; temporarily fold in TRANSL8* subroutines for
 ; reference; create $$produce based on mdc/edm's $%produce^string
 ; proposal x11/1995-111, add rwf's first few lines from $$replace,
 ; split spec into %find & %replace, add support for top-level
 ; parameters; refactor $$unix -> $$stu; bring back & refactor rwf's
 ; $$QUOTE as $$stl; create $$sth from $$HTML^DILF, refactor, change
 ; encoded characters to the five standard ones - "&<>' - of modern
 ; html and xml; also create $$hts from $$HTML^DILF; create $$lts to
 ; convert a string literal back to a normal string (we've written this
 ; before in Fileman, though examples currently escape me); make $$stu
 ; only allow a single character (not a substring) to be used to escape;
 ; create $$uts to undo $$stu; refactor $$valid; add new to $$pta, more
 ; comments in pta, ptv, ctv; overhaul ptv and ctv; write $$atp;
 ; invert order of target and source in merge parameters to match marge
 ; command, rename from sourceTtarget to targetEsource, e.g., vec, edit
 ; call to $$ctv in $$cj to $$vec; overhaul aep; write $$pev; rename
 ; chunks to slices; write $$sev, $$mergesev, $$getslice, $$gs, add
 ; primitive operations (get, set, cut, put for extracts, pieces,
 ; slices, columns) to to-do list, add to to-do list negative positional
 ; params, distinguish slice length from string length in slices;
 ; $$uc -> $$u, $$lc -> $$l, $$ic -> $$i, $$sc -> $$s, $$cc -> $$c;
 ; write setslice, ss; add matslice & netslice to to-do list; write
 ; $$ms, $$matslice, cs, cutslice, ps, putslice.
 ; in $$s, $$l, $$i, $$s, $$c, padtrunc, $$rj, $$lj, $$cj, $$repeat,
 ; $$strip, $$trim, $$replace, $$TRANSL81, $$TRANSL8, $$TRNSL8S,
 ; $$produce, $$stu, $$uts, $$sth, $$hts, $$stl, $$lts, $$valid, $$gs,
 ; $$getslice, ss, setslice, ms, matslice, ps, putslice, aep, $$pea,
 ; $$mergepea, vep, $$pev, ves.
 ;
 ; 2016-03-11 ven/toad: in contents, map out names of routines to
 ; break %ts content into. Add header introduction. Move bodies of
 ; string-slice subroutines to new routine %tslice. Move primary-
 ; development history to routine %tslog.
 ;
 ; 2016-03-11 ven/mcglk&toad: created routine %tsu to hold unit tests
 ; for MASH's string-type library, starting with $$trim & $$strip.
 ;
 ; 2016-04-04/05 ven/toad: created routine %tscol to hold string-
 ; column subroutines; fix bug with set $extract in $$stl; fix bug
 ; with call to $$repeat^%ts in ms^%tslice; fix examples in $$stl^%ts.
 ;
 ;
 ; contents
 ;
 ; %ts: mumps string library apis
 ; %tscol: mumps string-column tools
 ; %tslice: string-slice tools
 ; %tsu: unit tests
 ; %tslog: primary-development log
 ;
 ;
eor ; end of routine %tslog
