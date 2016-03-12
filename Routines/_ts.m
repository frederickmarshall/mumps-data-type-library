%ts ;ven/toad-Types: Strings ;2016-03-01 16:47
 ;;1.5-development;MASH;;
 ;(c) 2016, Frederick D. S. Marshall, all rights reserved
 ;($) funded by Frederick D. S. Marshall
 ;(l) Licensed under Apache License 2.0. See LICENSE file.
 ; based on U.S. Department of Veterans Affairs's Kernel 8.
 ; under primary development
 ;
 ; primary developer: Frederick D. S. Marshall (toad) <toad@mumps.org>
 ; original author: R. Wally Fort (rwf)
 ; additional authors: Zach Gonzales (zag), Ed de Moel (edm)
 ;
 ; primary development
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
 ; $$ms, $$matslice, cs, cutslice, ps, putslice;
 ; in $$s, $$l, $$i, $$s, $$c, padtrunc, $$rj, $$lj, $$cj, $$repeat,
 ; $$strip, $$trim, $$replace, $$TRANSL81, $$TRANSL8, $$TRNSL8S,
 ; $$produce, $$stu, $$uts, $$sth, $$hts, $$stl, $$lts, $$valid, $$gs,
 ; $$getslice, ss, setslice, ms, matslice, ps, putslice, aep, $$pea,
 ; $$mergepea, vep, $$pev, ves.
 ; 
 ;
 ;
 ; contents
 ;
 ; case-conversion functions
 ;
 ; $$alphabet = lowercase alphabet
 ; $$ALPHABET = uppercase alphabet
 ; $$u = convert string to uppercase
 ; $$upcase = $$u
 ; $$l = convert string to lowercase
 ; $$lowcase = $$l
 ; $$i = invert case (uppers to lowers & lowers to uppers)
 ; $$invcase = $$i [see JJOHCASE]
 ; $$s = convert string to sentence-case
 ; $$sencase = $$s
 ; $$c = convert string to capitalized case
 ; $$capcase = $$c
 ;
 ; string-justification functions
 ;
 ; padtrunc = calculate padding & truncation
 ; $$rj = right justify string
 ; $$rjustify = $$rj
 ; $$lj = left justify string
 ; $$ljustify = $$lj
 ; $$cj = center justify string
 ; $$cjustify = $$cj
 ; $$repeat = create string of repeating characters
 ;
 ; string-extraction functions
 ;
 ; $$strip = strip characters from string
 ; $$trim = trim character from end(s) of string
 ;
 ; string-translation functions
 ;
 ; $$replace = find & replace substrings
 ; $$produce = repeatedly find & replace substrings
 ;
 ; string-conversion functions
 ;
 ; $$stu = encode string as unix string
 ; $$uts = decode unix string to normal string
 ; $$sth = encode string as html string
 ; $$hts = decode html string to normal string
 ; $$stl = convert string to string literal
 ; $$lts = convert string literal to normal string
 ;
 ; string-validation functions
 ;
 ; $$valid = string only contains printable, standard characters?
 ;
 ; string-parse functions
 ;
 ; $$gs = get slice(s) of string
 ; $$getslice = $$gs
 ; ss = set slice(s) of string
 ; setslice: ss
 ; ms = mat-out slice(s) in string
 ; matslice: ms
 ; cs = cut slice(s) from string
 ; cutslice: cs
 ; ps: insert new slices into string
 ; putslice: ps
 ;
 ; string-merge tools
 ;
 ; aep: merge array = pieces
 ; mergeaep: aep
 ; $$pea: merge pieces = array
 ; $$mergepea: $$pea
 ;
 ; vep: merge variables = pieces
 ; mergevep: ptv
 ; $$pev: pieces = variables
 ; $$mergepev: $$pev
 ;
 ; ves: merge variables = slices
 ; mergeves: ves
 ;
 ;
 ; to do
 ;
 ; stw & wts = convert control strings to & from write arguments
 ; create unit tests for all of these subroutines
 ; revise $$replace to accept multiple strings
 ; revise $$produce to accept multiple strings
 ; multi-string case conversions & $$replace [JJOHCASE & DILF]
 ; pattern-match extensions
 ; regular expressions
 ; masking functions
 ; $$left, $$right, & $$pull
 ; Javascript methods: http://www.w3schools.com/js/js_string_methods.asp
 ;
 ; aev: array = variables
 ; vea: variables = array
 ;
 ; $$sev: slices = variables
 ; aes: array = slices
 ; $$sea: slices = array
 ; $$pes: pieces = slices
 ; $$sep: slices = pieces
 ;
 ; $$pee: pieces = extracts
 ; $$eep: extracts = pieces
 ; $$see: slices = extracts
 ; $$ees: extracts = slices
 ; aee: array = extracts
 ; $$eea: extracts = array
 ; vee: variables = extracts
 ; $$eev: extracts = variables
 ;
 ; make cut slice et al either modify %s or return modified %s
 ;   set %s1=$$cut(%s2) sets %s1 to cut-down form of %s2
 ;   do cut(.%s2) cuts down %s2
 ; make negative work from end backward
 ; ***** put slice, net slice *****
 ; should slice-library preserve an incomplete final slice?
 ; ***** get piece, set piece, cut piece, put piece *****
 ; ***** get extract, set extract, cut extract, put extract *****
 ; ***** get column, set column, cut column, put column *****
 ; ***** string walkers *****
 ;
 ; add merge??? wrappers
 ; create column subroutines for all of above
 ; add merge to do all of the above
 ; tie max string length in $$repeat to standard and/or implementation
 ; add max length protection to $$produce
 ; apply standard string-length protection consistently in all subroutines
 ;
 ;
 ;
 ; case-conversion functions
 ;
 ;
 ;
alphabet() quit "abcdefghijklmnopqrstuvwxyz"
 ;ven/toad;PUBLIC;variable;clean;silent;sac
 ;
ALPHABET() quit "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
 ;ven/toad;PUBLIC;variable;clean;silent;sac
 ;
 ;
upcase(%s) quit $$u(%s)
 ;
u(%s) ; convert string to uppercase
 ;isf/rwf,ven/toad;PUBLIC;function;clean;silent;sac
 ; calls:
 ;   $$ALPHABET
 ;   $$alphabet
 ; input:
 ;   %s = string to convert
 ; output = uppercase string
 ;
 set %s=$translate(%s,$$alphabet,$$ALPHABET)
 ;
 quit %s ; end of $$u, return uppercase string
 ;
 ;
lowcase(%s) quit $$l(%s)
 ;
l(%s) ; convert string to lowercase
 ;isf/rwf,ven/toad;PUBLIC;function;clean;silent;sac
 ; calls:
 ;   $$ALPHABET
 ;   $$alphabet
 ; input:
 ;   %s = string to convert
 ; output = lowercase string
 ;
 set %s=$translate(%s,$$ALPHABET,$$alphabet)
 ;
 quit %s ; end of $$l, return lowercase string
 ;
 ;
invcase(%s) quit $$i(%s)
 ;
i(%s) ; invert case (uppers to lowers & lowers to uppers)
 ;kbaz/zag,ven/toad;PUBLIC;function;clean;silent;sac
 ; calls:
 ;   $$ALPHABET
 ;   $$alphabet
 ; input:
 ;   %s = string to convert
 ; output = inverse-cased string
 ;
 set %s=$translate(%s,$$ALPHABET_$$alphabet,$$alphabet_$$ALPHABET)
 ;
 quit %s ; end of $$i, return inverse-case string
 ;
 ;
sencase(%s) quit $$s(%s)
 ;
s(%s) ; convert string to sentence-case
 ;isf/rwf,ven/toad;PUBLIC;function;clean;silent;sac
 ; calls:
 ;   $$l
 ;   $$u
 ; input:
 ;   %s = string to convert
 ; output = sentence-case string
 ;
 ; Sentence case = first letter of each sentence uppercase, rest lower
 ; example usage:
 ;   write $$s^%ts("HELLO!!! THIS IS A SENTENCE. (this isn't.)")
 ;  produces
 ;   Hello!!! This is a sentence. (This isn't.)
 ;
 ; internal:
 ;   %up = state flag (1 = next letter should be caps)
 ;   %p = string-extract position
 ;   %c = current character
 ;
 set %s=$$l(%s) ; start with lowercase
 new %up set %up=1 ; flag to convert next letter to uppercase
 new %p ; position of each character
 for %p=1:1:$length(%s) do  ; traverse string's characters
 . new %c set %c=$extract(%s,%p) ; get each character
 . if %up,%c?1L do  ; if cap flag set & char is lc
 . . set $extract(%s,%p)=$$u(%c) ; convert lc character to uc
 . . set %up=0 ; and clear cap flag
 . . quit
 . if ".!?"[%c do  ; if end-of-sentence, punctuation
 . . set %up=1 ; set cap flag
 . . quit
 . quit
 ;
 quit %s ; end of $$s, return sentence-case string
 ;
 ;
capcase(%s) quit $$c(%s)
 ;
c(%s) ; convert string to capitalized case
 ;isf/rwf,ven/toad;PUBLIC;function;clean;silent;sac
 ; calls:
 ;   $$l
 ;   $$u
 ; input:
 ;   %s = string to convert
 ; output = capitalized string
 ;
 ; Capitalized Case = first letter of each word uppercase, rest lower
 ; example usage:
 ;   write $$c^%ts("THIS IS CAPITALIZED. (this isn't.)")
 ;  produces
 ;   This Is Capitalized. (This Isn't.)
 ;
 ; internal:
 ;   %up = convert next letter to uppercase?
 ;   %p = string-extract position
 ;   %c = current character
 ;
 set %s=$$l(%s) ; start with lowercase
 new %up set %up=1 ; flag to convert next letter to uppercase
 new %p ; position of each character
 for %p=1:1:$length(%s) do  ; traverse string's characters
 . new %c set %c=$extract(%s,%p) ; get each character
 . if %up,%c?1L do  ; if cap flag set & char is lc
 . . set $extract(%s,%p)=$$u(%c) ; convert lc to uc
 . . set %up=0 ; and clear cap flag
 . . quit
 . if %c?1P,%c'="'" do  ; if punctuation but not apostrophe
 . . set %up=1 ; set cap flag
 . . quit
 . quit
 ;
 quit %s ; end of $$c, return capitalized string
 ;
 ;
 ;
 ; string-justification functions
 ;
 ;
 ;
padtrunc(%s,%pad,%l,%c) ; calculate padding & truncation
 ;ven/toad;private;procedure;clean;silent;sac
 ; called by: $$rj, $$lj, $$cj
 ; calls: none
 ; throughput:
 ;  .%s = string to convert; truncate if necessary & allowed
 ; input:
 ;   %l = length of frame to right justify string within
 ;        max 255, default to 80
 ;        if %l ends in a T, the string is truncated to fit
 ;   %c = character to pad with, default to space
 ; output:
 ;  .%pad = padding required to justify string within frame length
 ;
 set %l=$get(%l) ; avoid undef
 if '%l set %l=80 ; default to 80
 new %trunc8 set %trunc8=%l["T" ; are we truncating to fit?
 set %l=+%l ; discard the T, if any
 if %l>255 do  ; if frame length too long
 . set %l=255 ; restrict to max
 . quit
 set %c=$get(%c," ") ; default to space
 ;
 if %trunc8 do  ; if we're truncating to fit
 . set %s=$extract(%s,1,%l) ; & truncate
 . quit
 ;
 set %pad=$justify("",%l-$length(%s)) ; create padding spaces
 if %c'=" " do  ; if we're not padding with spaces
 . set %pad=$translate(%pad," ",%c) ; convert spaces to pad character
 . quit
 ;
 quit  ; end of padtrunc
 ;
 ;
rjustify(%s,%l,%c) quit $$rj(%s,%l,%c)
 ;
rj(%s,%l,%c) ; right justify string
 ;isf/rwf,ven/toad;PUBLIC;function;clean;silent;sac
 ; calls:
 ;   padtrunc: calculate padding & truncation
 ; input:
 ;   %s = string to convert
 ;   %l = length of frame to right justify string within
 ;        max 255, default to 80
 ;        if %l ends in a T, the string is truncated to fit
 ;   %c = character to pad with, default to space
 ; output = right-justified string
 ;
 new %pad ; padding required to justify string within frame length
 do padtrunc(.%s,.%pad,.%l,.%c) ; calculate padding & truncation
 ;
 quit %pad_%s ; end of $$rj, return right justified string
 ;
 ;
ljustify(%s,%l,%c) quit $$lj(%s,%l,%c)
 ;
lj(%s,%l,%c) ; left justify string
 ;isf/rwf,ven/toad;PUBLIC;function;clean;silent;sac
 ; calls:
 ;   padtrunc: calculate padding & truncation
 ; input:
 ;   [same as $$rj]
 ; output = right-justified string
 ;
 new %pad ; padding required to justify string within frame length
 do padtrunc(.%s,.%pad,.%l,.%c) ; calculate padding & truncation
 ;
 quit %s_%pad ; end of $$lj, return left justified string
 ;
 ;
cjustify(%s,%l,%c) quit $$cj(%s,%l,%c)
 ;
cj(%s,%l,%c) ; center justify string
 ;isf/rwf,ven/toad;PUBLIC;function;clean;silent;sac
 ; calls:
 ;   padtrunc: calculate padding & truncation
 ;   ves: break string into slices & merge into listed variables
 ; input:
 ;   [same as $$rj]
 ; output = right-justified string
 ;
 new %pad ; padding required to justify string within frame length
 do padtrunc(.%s,.%pad,.%l,.%c) ; calculate padding & truncation
 ;
 new %padl,%padr ; left & right padding
 do ves("%padl,%padr",%s,$length(%pad)\2_"R") ; split padding
 ;
 quit %padl_%s_%padr ; end of $$cj, return centered string
 ;
 ;
repeat(%c,%n) ; create string of repeating characters
 ;isf/rwf,ven/toad;PUBLIC;function;clean;silent;sac
 ; calls: none
 ; input:
 ;   %c = character(s) to repeat, defaults to space
 ;   %n = number of times to repeat, defaults to 80
 ; output = repeat string, max length 255
 ;
 if $get(%c)="" set %c=" " ; default to repeating spaces
 if +$get(%n)=0 set %n=80 ; default to 80 repetitions (for 80x24)
 if $length(%c)*%n>255 quit "" ; restrict to max string length
 new %s set %s="" ; repeat string
 set $piece(%s,%c,%n+1)="" ; repeat character(s)
 ;
 quit %s ; end of $$repeat, return repeat string
 ;
 ;
 ;
 ; string-extraction functions:
 ;
 ;
 ;
strip(%s,%c) ; strip characters from string
 ;isf/rwf,ven/toad;PUBLIC;function;clean;silent;sac
 ; calls: none
 ; input:
 ;   %s = string to edit
 ;   %c = characters to strip, defaults to space
 ; output = edited string
 ;
 set %s=$get(%s) ; avoid undefined error
 set %c=$get(%c," ") ; default to stripping spaces
 quit $translate(%s,%c,"") ; end of $$strip, return stripped string
 ;
 ;
trim(%s,%end,%c) ; trim character from end(s) of string
 ;isf/rwf,ven/toad;PUBLIC;function;clean;silent;sac
 ; calls: none
 ; input:
 ;   %s = string to edit
 ;   %end = L for left, R for right, LR for both
 ;   %c = character to strip
 ; output = edited string
 ;
 ; $$trim^%ts(x[,["[L][R]"][,char]]).
 ; trim space (or other char) from left, right, or both of string
 ;   write "[",$$trim^%ts("  A B C  "),"]" => [A B C]
 ;   write "[",$$trim^%ts("//A B C//",,"/"),"]" => [A B C]
 ;
 set %c=$get(%c," ") ; default to trimming spaces
 if $translate(%s,%c)="" quit "" ; nothing but trim?
 set %end=$$u($get(%end,"LR")) ; default to both ends
 ;
 new %nr set %nr=$length(%s) ; start at right end
 if %end["R" do  ; if trimming right end
 . for %nr=$length(%s):-1:1 quit:$extract(%s,%nr)'=%c
 . quit
 ;
 new %nl set %nl=1 ; start at left end
 if %end["L" do  ; if trimming left end
 . for %nl=1:1:$length(%s) quit:$extract(%s,%nl)'=%c
 . quit
 ;
 quit $extract(%s,%nl,%nr) ; end of $$trim, return trimmed string
 ;
 ;
 ;
 ; string-translation functions
 ;
 ;
 ;
replace(%s,%find,%replace) ; find & replace substrings
 ;mdc/edm,ven/toad;PUBLIC;function;clean;silent;sac
 ; calls: none
 ; input:
 ;   %s = string to edit
 ;      for a single find-and-replace pair of substrings:
 ;   %find = substring to find, and
 ;   %replace = replacement substring
 ;      to find-and-replace multiple substrings:
 ;  .%find(#) = #th substring to find
 ;  .%replace(#) = #th replacement substring
 ; output = edited string
 ;
 ; $$replace is $translate for substrings instead of characters.
 ;
 ; Removal:
 ; $translate("ihelloi","i") = "hello".
 ; $$replace("billhellobill","bill") = "hello".
 ;
 ; Multiple Removals:
 ; $translate("hellion","in") = "hello".
 ; %find(1)="bill",%find(2)="steve",
 ; $$replace("billhellosteve",.%find) = "hello".
 ;
 ; Replacement:
 ; $translate("hi","h","H") = "Hi".
 ; $$replace("Hello, Bill","Bill","Ada") = "Hello, Ada".
 ;
 ; Multiple Replacements:
 ; $translate("Jello world","Jw","HW") = "Hello World".
 ; %find(1)="billh",%replace(1)="H",
 ; %find(2)="steve",%replace(2)=", Alan",
 ; $$replace("billhellosteve",.%find,.%replace) = "Hello, Alan".
 ;
 ; No-op:
 ; $translate("Hello World","") = "Hello World".
 ; $$replace("Hello World") = "Hello World".
 ;
 ; The next two rules are why $$replace internally uses a mask, to keep
 ; track of which characters have already been replaced:
 ;
 ; Redundant Definitions Ignored:
 ; $translate("obrocodobro","oo","az") = "abracadabra".
 ; $translate("obrocodobro","oo","a") = "abracadabra".
 ; $translate("ogrocodogro","oog","azb") = "abracadabra".
 ; %find(1)=" World",%replace(1)=", Grace",
 ; %find(2)=" World",%replace(2)=", Dennis",
 ; $$replace("Hello World",.%find,.%replace) = "Hello, Grace".
 ;
 ; Each Character Changed Only Once:
 ; $translate("obrocodobro","oa","az") = "abracadabra".
 ; %find(1)=" World",%replace(1)=", Hedy",
 ; %find(2)="Hedy",%replace(2)="John",
 ; $$replace("Hello World",.%find,.%replace) = "Hello, Hedy".
 ;
 if $get(%s)="" quit "" ; if no string to edit, we're done
 new %l set %l=$length(%s) ; length of input string
 new %mask set %mask=$justify("",%l) ; create mask of spaces
 new %found ; array of findings
 ;
 if $data(%find)=0 quit %s ; if no replacements, return unchanged
 if $get(%find)'="" do  ; if the top-level parameter is set
 . new %id1 set %id1=$order(%find("")) ; get first id
 . new %id0 set %id0=%id1-1 ; pick out an id for the top-level param
 . set %find(%id0)=$get(%find) ; copy in the top-level find substring
 . set %find="" ; and clear it
 . set %replace(%id0)=$get(%replace) ; copy in the top-level replacement
 . set %replace="" ; and clear it
 . quit
 ;
 new %id set %id="" ; specification id (number or string subscript)
 for  do  quit:%id=""  ; traverse specifications
 . set %id=$order(%find(%id)) ; get next find-replace specification
 . quit:%id=""  ; until done
 . new %find set %find=$get(%find(%id)) ; substring to find
 . quit:%find=""  ; find must be nonempty
 . quit:$data(%replace(%id))[0  ; replace must be defined (can be empty)
 . new %replace set %replace=$get(%replace(%id)) ; replacement substring
 . ;
 . new %lf set %lf=$length(%find(%id)) ; length of find substring
 . new %fp ; $find position (next character after the found substring)
 . for  do  quit:%fp<1  ; traverse substring findings
 . . set %fp=$find(%s,%find(%id),%fp) ; find substring
 . . quit:%fp<1  ; done if can't find
 . . ;
 . . new %first set %first=%fp-%lf ; position of 1st char of found sub
 . . new %flast set %flast=%fp-1 ; position of last char of found sub
 . . quit:$extract(%mask,%first,%flast)["x"  ; skip if overlaps
 . . set %found(%first)=%replace(%id) ; add to list of substring findings
 . . ;
 . . new %fmask set %fmask=$translate($justify("",%lf)," ","x")
 . . new %fmask set $piece(%fmask,"x",%lf+1)="" ; mark for finding
 . . set $extract(%mask,%first,%flast)=%fmask ; mark finding in mask
 . . quit
 . quit
 ;
 new %result set %result="" ; build result of the replacements
 for %p=1:1:%l do  ; traverse findings
 . ;
 . if $extract(%mask,%p)=" " do  quit  ; if character is not replaced
 . . set %result=%result_$extract(%s,%p) ; copy it to result
 . . quit
 . ;
 . if $data(%found(%p)) do  ; if character is replaced
 . . set %result=%result_%found(%p) ; copy replacement to result
 . . quit
 . quit
 ;
 quit %result ; end of $$replace, return replaced string
 ;
 ;
produce(%s,%find,%replace,%max) ; repeatedly find & replace substrings
 ;mdc/edm,ven/toad;PUBLIC;function;clean;silent;sac
 ; calls: none
 ; input:
 ;   %s = string to edit
 ;   %max = max # replacements to perform production
 ;      for a single find-and-replace pair of substrings:
 ;   %find = substring to find, and
 ;   %replace = replacement substring
 ;      to find-and-replace multiple substrings:
 ;  .%find(#) = #th substring to find
 ;  .%replace(#) = #th replacement substring
 ; output = produced string
 ;
 ; $$produce is $$replace that repeats over and over. $$replace's rule
 ; that each character in the original string can only be changed once
 ; does not apply to $$produce, which keeps finding and prelacing, over
 ; and over, until none of the find substrings exist within the result.
 ; For example:
 ; %find(1)="aa",%replace(2)="a",
 ; %find(2)="pqr",%replace(2)="alabama",
 ; %find(3)="b",%replace(3)="",
 ; %s="aaaaaaapqraaaaaaa",
 ; $$replace(%s,.%find,.%replace) = "aaaaalabamaaaaa", but
 ; $$produce(%s,.%find,.%replace) = "alama".
 ;
 ; The results are explained as follows (blanks inserted for clarity):
 ; $$replace:
 ;   aa aa aa a pqr    aa aa aa a
 ;    a  a  a a alabama a  a  a a
 ; $$produce keeps going:
 ;    aa aa ala b ama aa aa 
 ;     a  a ala   ama  a  a
 ;     aa al aa m aa a
 ;      a al  a m  a a
 ;      aa lam aa
 ;       a lam  a
 ; $$produce only ends when "aa", "pqr", and "b" are all gone.
 ;
 if $get(%s)="" quit "" ; if no string to edit, we're done
 ;
 if $data(%find)=0 quit %s ; if no replacements, return unchanged
 if $get(%find)'="" do  ; if the top-level parameter is set
 . new %id1 set %id1=$order(%find("")) ; get first id
 . new %id0 set %id0=%id1-1 ; pick out an id for the top-level param
 . set %find(%id0)=$get(%find) ; copy in the top-level find substring
 . set %find="" ; and clear it
 . set %replace(%id0)=$get(%replace) ; copy in the top-level replacement
 . set %replace="" ; and clear it
 . quit
 ;
 new %result set %result=%s ; new string to produce, starting with input
 set %max=$get(%max,0) ; default to no restriction on # replacements
 new %r set %r=0 ; count replacements
 new %toomany set %toomany=0 ; default to not too many replacements
 new %done ; are we done? if no substrings found, we're done
 ;
 for  do  quit:%done!%toomany  ; replace until no more found
 . set %done=1 ; repeat until no more replacements, default to done
 . . ;
 . new %id set %id="" ; find-replace pair id
 . for  do  quit:%id=""!%toomany  ; traverse find substrings
 . . set %id=$order(%find(%id)) ; get next replacement id
 . . quit:%id=""  ; restart when out of substrings to replace
 . . ;
 . . set %find=$get(%find(%id)) ; get find substring
 . . quit:%find=""  ; skip missing find substrings
 . . new %l set %l=$length(%find) ; how long is the find substring?
 . . set %replace=$get(%replace(%id)) ; get replace substring
 . . new %fp ; $find results (position after substring within string)
 . . ;
 . . for  do  quit:%fp=0!%toomany  ; replace the find substring
 . . . new %fp set %fp=$find(%result,%find) ; position of find substring
 . . . quit:%fp=0  ; replace until find substring is not in string
 . . . ;
 . . . new %first set %first=%fp-%l ; position of 1st char of find
 . . . new %flast set %flast=%fp-1 ; position of last char of find
 . . . set $extract(%result,%first,%flast)=%replace ; replace find
 . . . ;
 . . . set %done=0 ; if we do a replacement, we're not done yet
 . . . set %r=%r+1 ; count replacements
 . . . if %max,%r>%max do  ; if too many replacements
 . . . . set %toomany=1 ; we're done
 . . . . quit
 . . . quit
 . . quit
 . quit
 ;
 quit %result ; end of $$produce, return produced string
 ;
 ;
 ;
 ; string-conversion functions
 ;
 ;
 ;
stu(%s,%esc,%e) ; encode string as unix string
 ;kbaz/zag,ven/toad;PUBLIC;function;clean;silent;SAC compliant
 ; calls: none
 ; input:
 ;   %s = string to convert
 ;   %esc = characters to needing conversion
 ;   %e = escape character
 ; output = unix string
 ;
 ; prepend unix escape character throughout a string
 ;
 ; example: if %s = "^DIC(""B"")" and %esc = ()" and %e = \
 ; then $$stu^%ts would return: \"^DIC\(\"\"B\"\"\)\"
 ;
 if $get(%esc)="" do  ; if no list of characters to escape passed
 . set %esc="!""$&'()*,:;<=>?@[\]^` {|}/" ; default to usual for shell
 . quit
 if $get(%e)="" do  ; if no escape character passed in
 . set %e="\" ; default to \
 . quit
 new %unix set %unix=%s ; start building unix string
 ;
 new %p set %p=0 ; each character's position
 new %c set %c="" ; each character
 for  do  quit:%c=""  ; traverse characters in string
 . set %p=%p+1 ; advance cursor
 . set %c=$extract(%unix,%p) ; get next character
 . quit:%c=""  ; exit at end of string
 . quit:%esc'[%c  ; skip normal characters
 . set $extract(%unix,%p)=%e_%c ; prepend escape character
 . set %p=%p+1 ; jump past escape character
 . quit
 ;
 quit %unix ; end of $$stu, return unix string
 ;
 ;
uts(%unix,%e) ; decode unix string to normal string
 ;kbaz/zag,ven/toad;PUBLIC;function;clean;silent;SAC compliant
 ; calls: none
 ; input:
 ;   %unix = unix string to decode
 ;   %e = escape character
 ; output = decoded string
 ;
 ; remove prepended unix escape character throughout encoded string
 ;
 ; example: if %unix = \"^DIC\(\"\"B\"\"\)\" and %e = \
 ; then $$uts^%ts would return: "^DIC(""B"")"
 ;
 if $get(%e)="" do  ; if no escape character passed in
 . set %e="\" ; default to \
 . quit
 new %s set %s=%unix ; start building normal string
 ;
 new %p set %p=0 ; each character's position
 new %c set %c="" ; each character
 for %p=1:1:$length(%s) do  quit:%c=""  ; traverse characters in string
 . set %c=$extract(%s,%p) ; get next character
 . quit:%c=""  ; exit at end of string
 . set $extract(%s,%p)="" ; remove escape character
 . quit
 ;
 quit %s ; end of $$stu, return string
 ;
 ;
sth(%s) ; encode string as html string
 ;ven/toad;PUBLIC;function;clean;silent;SAC compliant
 ; calls: none
 ; input:
 ;   %s = string to encode
 ; output = html string
 ;
 ; encode special html char(s) as standard html encoding
 ;
 ; example:
 ; %s = set radium="marie">1&(curie'<37)
 ; $$sth^%ts = set radium=&quot;marie&quot;&gt;1&amp;(&apos;curie&lt;37)
 ;
 new %l set %l=$length(%s,"^")+$length(%s,"&")-2
 new %toolong ; does conversion make string too long?
 set %toolong=$length(%s)+(%l*4)>255 ; conversion makes it too long?
 quit:$get(%toolong) ""
 ;
 new %html set %html=%s ; start encoding html string
 set %html=$$replace(%html,"&","&amp;")
 set %html=$$replace(%html,"<","&lt;")
 set %html=$$replace(%html,">","&gt;")
 set %html=$$replace(%html,"""","&quot;")
 set %html=$$replace(%html,"'","&apos;")
 ;
 quit %html ; end of $$sth, return html string
 ;
 ;
hts(%html) ; decode html string to normal string
 ;ven/toad;PUBLIC;function;clean;silent;SAC compliant
 ; calls: none
 ; input:
 ;   %html = html string to decode
 ; output = decoded string
 ;
 ; decode standard html encoding to normal string
 ;
 ; example:
 ; %html = set radium=&quot;marie&quot;&gt;1&amp;(&apos;curie&lt;37)
 ; $$hts^%ts = set radium="marie">1&(curie'<37)
 ;
 new %s set %s=%html ; start decoding string
 set %s=$$replace(%s,"&lt;","<")
 set %s=$$replace(%s,"&gt;",">")
 set %s=$$replace(%s,"&quot;","""")
 set %s=$$replace(%s,"&apos;","'")
 set %s=$$replace(%s,"&amp;","&")
 ;
 quit %s ; end of $$hts, return string
 ;
 ;
stl(%s) ; convert string to literal
 ;isf/rwf,ven/toad;PUBLIC;function;clean;silent;SAC compliant
 ; calls: none
 ; input:
 ;   %s = string to convert
 ; output = string converted to string-literal
 ;
 ; add quotes to value for concatenation
 ;
 ; example:
 ; %s = set array("howdy")="Surya"
 ; $$stl^%ts = "set array(""howdy"")=""Surya"""
 ;
 new %a set %a(%s)=0 ; convert string to subscript
 new %n set %n=$query(%a) ; convert subscripted name to name reference
 ;
 new %literal set %literal=%n ; start building string literal
 new %l set %l=$length(%literal) ; length of name reference
 set $extract(%literal,%l)="" ; remove final )
 set $extract(%literal,1,3) ; remove initial %a(
 ;
 quit %literal ; end of $$stl, return string literal
 ;
 ;
lts(%literal) ; convert string literal to normal string
 ;ven/toad;PUBLIC;function;clean;silent;SAC compliant
 ; calls: none
 ; input:
 ;   %literal = string to convert
 ; output = string literal converted to normal string
 ;
 ; remove extra quotes from value
 ;
 ; example:
 ; %literal = "set array(""howdy"")=""Surya"""
 ; $$lts^%ts = set array("howdy")="Surya"
 ;
 new %n set %n="%a("_%literal_")" ; put literal in a subscript
 new %s set %s=$qsubscript(%n,1) ; extract subscript as a string
 ;
 quit %s ; end of $$lts, return string
 ;
 ;
 ;
 ; string-validation functions
 ;
 ;
 ;
valid(%s) ; string only contains printable, standard characters?
 ;ven/toad;PUBLIC;function;clean;silent
 ; input:
 ;   %s = string to check.
 ; output = 1 if each character contained in %s:
 ;   a) printable (not a control character) and
 ;   b) not an upper-ascii-range character (code 128 or above)
 ;   otherwise = 0^list of invalid character codes
 ;
 new %v set %v=1 ; default to true, all characters valid
 new %p ; each character position
 for %p=1:1:$length(%s) do
 . new %c set %c=$ascii(%s,%p) ; get each character code
 . if %c>31,%c<127 quit  ; if valid, move on to next character
 . if %v do  ; if first not-valid character found
 . . set %v=0_"^" ; set flag to not valid and add delimiter
 . . quit
 . set %v=%v_%c_"," ; add code of not-valid character and comma
 . quit
 ;
 if '%v do
 . set $extract(%v,$length(%v))="" ; remove final trailing comma
 . quit
 ;
 quit %v ; end of $$valid, return string's validity
 ;
 ;
 ;
 ; string-parse tools
 ;
 ;
 ;
 ; %se = string extract
 ; %sen = string extract number
 ; %sef = string extract from position
 ; %set = string extract to position
 ;
 ; %sl = string length
 ; %sle = string length in extracts
 ; %slp = string length in pieces
 ; %sls = string length in slices
 ;
 ; %sp = string piece
 ; %spd = string delimiter
 ; %spn = string piece number
 ; %spf = string piece from position
 ; %spt = string piece to position
 ;
 ; %ss = string slice
 ; %ssl = string slice length
 ; %ssn = string slice number
 ; %ssf = string slice from position
 ; %sst = string slice to position
 ;
 ; %sv = name of string variable
 ; %sa = name of string array
 ;
 ; $$get: copy values of slices from string
 ;   set: change values of slices in string (or create new ones)
 ;   mat: change values of slices to spaces
 ;   cut: remove slices from string
 ;   put: insert new slices into string
 ;   net: remove slices from string and assign to variable
 ; $$cnt: count slices (string length in slices)
 ;
 ;
getslice(%s,%ssl,%ssf,%sst) quit $$gs(%s,%ssl,%ssf,%sst)
 ;
gs(%s,%ssl,%ssf,%sst) ; get slice(s) of string
 ;ven/toad;PUBLIC;procedure;clean;silent;sac
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
 new %ss set %ss=$extract(%s,%ssf-1*%ssl+1,%sst*%ssl)
 ;
 quit %ss ; end of $$gs, return slices
 ;
 ;
setslice(%s,%ss,%ssl,%ssf,%sst) do ss(%s,%ss,%ssl,%ssf,%sst) quit
 ;
ss(%s,%ss,%ssl,%ssf,%sst) ; set slice(s) of string
 ;ven/toad;PUBLIC;procedure;clean;silent;sac
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
 set $extract(%s,%ssf-1*%ssl+1,%sst*%ssl)=%ss ; set slices
 ;
 quit  ; end of ss
 ;
 ;
matslice(%s,%ssl,%ssf,%sst) do ms(%s,%ssl,%ssf,%sst) quit
 ;
ms(%s,%ssl,%ssf,%sst) ; mat out slice(s) in string
 ;ven/toad;PUBLIC;procedure;clean;silent;sac
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
cutslice(%s,%ssl,%ssf,%sst) do cs(%s,%ssl,%ssf,%sst) quit
 ;
cs(%s,%ssl,%ssf,%sst) ; cut slice(s) from string
 ;ven/toad;PUBLIC;procedure;clean;silent;sac
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
putslice(%s,%ss,%ssl,%ssf,%sst) do ps(%s,%ss,%ssl,%ssf,%sst) quit
 ;
ps(%s,%ss,%ssl,%ssf,%sst) ; put new slice(s) into string
 ;ven/toad;PUBLIC;procedure;clean;silent;sac
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
 ; $$cnt: count slices (string length in slices)
 ;
 ;
 ;
 ; string-merge tools
 ;
 ;
 ;
mergeaep(%sa,%s,%spd) do aep(%sa,%s,%spd) quit
 ;
aep(%sa,%s,%spd) ; merge array = pieces
 ;ven/toad;PUBLIC;procedure;clean;silent;sac
 ; calls: none
 ; input:
 ;   %sa = name of target array
 ;   %s = source string to piece and merge into target array
 ;   %spd [optional] = delimiter, defaults to ^
 ; output:
 ;  @%sa@(piece #) = piece value
 ;
 set %sa=$get(%sa) ; target array name: avoid undef
 quit:%sa=""  ; can't merge without target array
 ;
 set %s=$get(%s) ; source string: avoid undef error
 quit:%s=""  ; can't merge without a souce string
 ;
 do  ; initialize delimiter
 . set %spd=$get(%spd,"") ; try %spd
 . quit:%spd'=""  ; use it if we have it
 . set %spd="^" ; default
 . quit
 ;
 new %slp set %slp=$length(%s,%spd) ; how many pieces?
 ;
 ; merge array = pieces
 new %spn ; piece number (for counting pieces)
 for %spn=1:1:%slp do  ; traverse pieces
 . new %sp set %sp=$piece(%s,%spd,%spn) ; get piece
 . quit:%sp=""  ; skip empty pieces (keep array sparse)
 . set @%sa@(%spn)=%sp ; copy nonempty pieces
 . quit
 ;
 quit  ; end of aep
 ;
 ;
mergepea(%sa,%spd) quit $$pea(%sa,%spd)
 ;
pea(%sa,%spd) ; merge pieces = array
 ;ven/toad;PUBLIC;procedure;clean;silent;sac
 ; calls: none
 ; input:
 ;   %sa = name of source array
 ;     @%sa@(piece #) = piece value
 ;   %spd [optional] = delimiter, defaults to ^
 ; output = delimited string containing pieces
 ;
 if %sa="" quit "" ; can't merge without a source array
 new %s set %s="" ; target string to build
 do  ; initialize delimiter
 . set %spd=$get(%spd,"") ; try %spd
 . quit:%spd'=""  ; use it if we have it
 . set %spd="^" ; default
 . quit
 ;
 ; merge array to pieces
 new %spn set %spn=0 ; piece number (for counting pieces)
 for  do  quit:'%spn  ; traverse array
 . set %spn=$order(@%sa@(%spn)) ; get next piece number from subscript
 . quit:'%spn  ; done when out of numeric subscripts
 . new %sp set %sp=$get(@%sa@(%spn)) ; get piece value from array node
 . quit:%sp=""  ; skip empty pieces (keep piece-string sparse)
 . set $piece(%s,%spd,%spn)=%sp ; copy nonempty pieces
 . quit
 ;
 quit %s ; end of $$pea, return pieces
 ;
 ;
mergevep(%svlist,%s,%spd) do vep(%svlist,%s,%spd) quit
 ;
vep(%svlist,%s,%spd) ; merge variables = pieces
 ;isf/rwf,ven/toad;PUBLIC;procedure;clean;silent;sac
 ; calls: none
 ; input:
 ;   %svlist = list of target variable names
 ;            e.g., "%spleft,%spright"
 ;   %s = source string to piece & merge into listed variables
 ;   %spd = piece delimiter, defaults to ^
 ; output:
 ;   for each name Xn listed in %svlist, @Xn = the nth piece of %s;
 ;   if there are more variables listed than pieces, the remaining
 ;      variables are left unassigned;
 ;   missing variables (two commas in a row) are skipped, as are the
 ;      pieces they would have been assigned;
 ;   if there are more pieces than variable names listed, the extra
 ;      pieces are ignored by default.
 ;   any scoping of the listed variables names (by new or parameter
 ;   passing) must be done by the caller.
 ; examples:
 ;   do vep("%sfirst,%second","1234^567") will set
 ;      %sfirst=1234 and %second=567.
 ;   do vep("%sfirst,%second","1234^5678^9") will set
 ;      %sfirst=1234 and %second=5678. The "9" will not be assigned.
 ;   do vep("%sfirst,,%third","1234^5678^9") will set
 ;      %sfirst=1234 and %third=9. The "5678" will not be assigned.
 ;   do vep("%sfirst,%second,%sthird","1234^567") will set
 ;      %sfirst=1234 and %second=567 and leave %sthird unchanged.
 ;
 set %svlist=$get(%svlist) ; list of target variable names: avoid undef
 quit:%svlist=""  ; can't merge without target variables
 new %svlistl set %svlistl=$length(%svlist,",") ; variable-list length
 ;
 set %s=$get(%s) ; source string: avoid undef error
 quit:%s=""  ; can't merge without a souce string
 ;
 set %spd=$get(%spd,"^") ; string-piece delimiter
 ;
 new %spp ; string-piece position
 for %spp=1:1:%svlistl do  ; traverse list of variables
 . new %sv set %sv=$piece(%svlist,",",%spp) ; get each variable name
 . quit:%sv=""  ; skip empty spots in variable list
 . set @%sv=$piece(%s,%spd,%spp) ; variable = matching piece position
 . quit
 ;
 quit  ; end of vep
 ;
 ;
mergepev(%svlist,%spd) quit $$pev(%svlist,%spd)
 ;
pev(%svlist,%spd) ; merge pieces = variables
 ;ven/toad;PUBLIC;procedure;clean;silent;sac
 ; calls: none
 ; input:
 ;   %svlist = list of source variable names
 ;            e.g., "%spleft,%spright"
 ;   %spd = piece delimiter, defaults to ^
 ; output:
 ;   for each name Xn listed in %svlist, @Xn = the nth piece of %s;
 ;   any scoping of the listed variables names (by new or parameter
 ;   passing) must be done by the caller.
 ;
 set %svlist=$get(%svlist) ; list of source variable names: avoid undef
 if %svlist="" quit "" ; can't merge without source variables
 new %svlistl set %svlistl=$length(%svlist,",") ; variable-list length
 ;
 new %s set %s="" ; start building target string
 set %spd=$get(%spd,"^") ; string-piece delimiter
 ;
 new %spp ; string-piece position
 for %spp=1:1:%svlistl do  ; traverse list of variables
 . new %sv set %sv=$piece(%svlist,",",%spp) ; get each variable name
 . quit:%sv=""  ; skip empty spots in variable list
 . set $piece(%s,%spd,%spp)=$get(@%sv) ; piece = variable
 . quit
 ;
 quit %s ; end of $$pev
 ;
 ;
mergeves(%svlist,%s,%ssl) do ves(%svlist,%s,%ssl) quit
 ;
ves(%svlist,%s,%ssl) ; merge variables = slices
 ;ven/toad;PUBLIC;procedure;clean;silent;sac
 ; calls: none
 ; input:
 ;   %svlist = list of target variable names
 ;            e.g., "%spleft,%spright" [see $$cj above]
 ;   %s = source string to slice & merge into listed variables
 ;   %ssl = slice length, defaults to 80;
 ;          if contains trailing R, see output & examples below
 ; output:
 ;   for each name Xn listed in %svlist, @Xn = the nth slice of %s;
 ;   if there are more variables listed than slices, the remaining
 ;      variables are left unassigned;
 ;   missing variables (two commas in a row) are skipped, as are the
 ;      slices they would have been assigned;
 ;   if there are more slices than variable names listed, the extra
 ;      slices are ignored by default; if the slice length includes a
 ;      trailing R, then the rest of the string, even if longer than
 ;      the slice length, is assigned to the last listed variable.
 ;   any scoping of the listed variables names (by new or parameter
 ;   passing) must be done by the caller.
 ; examples:
 ;   do vec("%sfirst,%second","1234567",4) will set
 ;      %sfirst=1234 and %second=567.
 ;   do vec("%sfirst,%second","123456789",4) will set
 ;      %sfirst=1234 and %second=5678. The "9" will not be assigned.
 ;   do vec("%sfirst,,%third","123456789",4) will set
 ;      %sfirst=1234 and %third=9. The "5678" will not be assigned.
 ;   do vec("%sfirst,%second","123456789","4R") will set
 ;      %sfirst=1234 and %second=56789.
 ;   do vec("%sfirst,%second,%sthird","1234567",4) will set
 ;      %sfirst=1234 and %second=567 and leave %sthird unchanged.
 ;
 set %svlist=$get(%svlist) ; list of target variable names: avoid undef
 quit:%svlist=""  ; can't merge without target variables
 new %svlistl set %svlistl=$length(%svlist,",") ; variable-list length
 ;
 set %s=$get(%s) ; source string: avoid undef error
 quit:%s=""  ; can't merge without a souce string
 ;
 new %ssrest set %ssrest=$get(%sls)["R" ; save rest of string?
 set %ssl=$get(%ssl)\1 ; slice length: avoid undef, strip R, integer
 set:%ssl<80 %ssl=80 ; avoid zero or negative
 ;
 new %q set %q=0 ; quit loop early? default to no
 new %spp ; string piece position
 new %sv ; name of each variable in the list
 for %spp=1:1:%svlistl do  quit:%q  ; traverse variables
 . set %sv=$piece(%svlist,",",%spp) ; get next variable name
 . quit:sv=""  ; skip empty spots in variable list
 . new %ss set %ss=$extract(%s,1,%ssl) ; get next slice of string
 . set %q=%ss="" ; out of slices?
 . quit:%q  ; if so, we're done with block and loop
 . set $extract(%s,1,%ssl)="" ; clear that slice from string
 . set @%sv=%ss ; otherwise, set the named variable to this string slice
 . quit
 ;
 if %ssrest do  ; if special handling of rest of string
 . quit:%s=""  ; done if all of string accounted for
 . quit:%sv=""  ; done if 
 . set @%sv=@%sv_%s ; else, save rest of string in last variable
 . quit
 ;
 quit  ; end of ves
 ;
 ;
mergesev(%svlist,%ssl) quit $$sev(%svlist,%ssl)
 ;
sev(%svlist,%ssl) ; merge slice = variables
 ;ven/toad;PUBLIC;procedure;clean;silent;sac
 ; calls: none
 ; input:
 ;   %svlist = list of source variable names
 ;            e.g., "%spleft,%spright"
 ;   %ssl = slice length, defaults to 80;
 ; output:
 ;   for each name Xn listed in %svlist, @Xn = the nth slice of %s;
 ;   any scoping of the listed variables names (by new or parameter
 ;   passing) must be done by the caller.
 ;
 set %svlist=$get(%svlist) ; list of source variable names: avoid undef
 quit:%svlist=""  ; can't merge without source variables
 new %svlistl set %svlistl=$length(%svlist,",") ; variable-list length
 ;
 new %s set %s="" ; start building target string
 ;
 set %ssl=$get(%ssl,80) ; slice length: avoid undef
 set:%ssl<1 %ssl=80 ; avoid zero or negative
 ;
 new %q set %q=0 ; quit loop early? default to no
 new %spp ; string piece position
 new %sv ; name of each variable in the list
 for %spp=1:1:%svlistl do  ; traverse variables
 . set %sv=$piece(%svlist,",",%spp) ; get next variable name
 . quit:sv=""  ; skip empty spots in variable list
 . ;
 . ; ***** RESUME HERE *****
 . ;
 . set %s=%s_$get(@%sv) ; append named variable
 . new %ss set %ss=$extract(%s,1,%ssl) ; get next slice of string
 . set %q=%ss="" ; out of slices?
 . quit:%q  ; if so, we're done with block and loop
 . set $extract(%s,1,%ssl)="" ; clear that slice from string
 . set @%sv=%ss ; otherwise, set the named variable to this string slice
 . quit
 ;
 quit  ; end of $$sev, return slices
 ;
 ;
eor ; end of routine %ts
