%tsu ;ven/mcglk&toad-types: strings ;2016-03-11 16:47
 ;;1.5-development;MASH;;
 ;(c) 2016, Ken McGlothlen & Frederick D. S. Marshall, all rights reserved
 ;($) funded by Frederick D. S. Marshall
 ;(l) Licensed under Apache License 2.0. See LICENSE file.
 ; under primary development
 ;
 ; primary development
 ;
 ; 2016-03-11 ven/mcglk&toad: Ken McGlothlen & Frederick D.S. Marshall
 ; of the VISTA Expertise Network created routine %tsu to hold unit
 ; tests for MASH's string-type library, starting with $$trim &
 ; $$strip.
 ;
 ;
 ;
 ; contents
 ;
 ; [write some]
 ;
 ;
 ;
 ; to do
 ;
 ; write unit tests for $$strip
 ; write unit tests for $$trim
 ;
 ;
 do EN^%ut($text(+0),2) ; invoke M-Unit
 ;
 quit  ; end of call from top
 ;
 ;
 ;-----------------------------------------------------------------------------
 ; strip*: Unit tests for $$strip^%ts
 ;
strip01 ; @TEST $$strip^%ts(%s): Strip Single Character
 ;ven/mcglk&toad;test;procedure;clean?;silent?;sac
 ;
 new %s set %s="In a hole in the ground, there lived a hobbit."
 new result set result="Inaholeintheground,therelivedahobbit."
 do CHKEQ^%ut($$strip^%ts(%s),result)
 ;
 quit  ; end of strip01
 ;
 ;
strip02 ; @TEST $$strip^%ts(%s,%c): Strip Single Character
 ;ven/mcglk&toad;test;procedure;clean?;silent?;sac
 ;
 new %s set %s="In a hole in the ground, there lived a hobbit."
 new %c set %c="h"
 new result set result="In a ole in te ground, tere lived a obbit."
 do CHKEQ^%ut($$strip^%ts(%s,%c),result)
 ;
 quit  ; end of strip02
 ;
 ;
strip03 ; @TEST $$strip^%ts(%s,%c): Strip Multiple Characters
 ;ven/mcglk&toad;test;procedure;clean?;silent?;sac
 ;
 new %s set %s="In a hole in the ground, there lived a hobbit."
 new %c set %c="hd"
 new result set result="In a ole in te groun, tere live a obbit."
 do CHKEQ^%ut($$strip^%ts(%s,%c),result)
 ;
 quit  ; end of strip03
 ;
 ;
strip04 ; @TEST $$strip^%ts(%s): Strip non-existent characters
 ;ven/mcglk&toad;test;procedure;clean?;silent?;sac
 ;
 new %s set %s="Inaholeintheground,therelivedahobbit."
 new result set result=%s
 do CHKEQ^%ut($$strip^%ts(%s),result)
 ;
 quit  ; end of strip04
 ;
 ;
strip05 ; @TEST $$strip^%ts(%s,%c): Strip non-existent characters
 ;ven/mcglk&toad;test;procedure;clean?;silent?;sac
 ;
 new %s set %s="In a hole in the ground, there lived a hobbit."
 new %c set %c="qx"
 new result set result=%s
 do CHKEQ^%ut($$strip^%ts(%s,%c),result)
 ;
 quit  ; end of strip05
 ;
 ;
strip06 ; @TEST $$strip^%ts(%s): Strip from empty string
 ;ven/mcglk&toad;test;procedure;clean?;silent?;sac
 ;
 new %s set %s=""
 new result set result=%s
 do CHKEQ^%ut($$strip^%ts(%s),result)
 ;
 quit  ; end of strip06
 ;
 ;
strip07 ; @TEST $$strip^%ts(%s,%c): Strip from empty string
 ;ven/mcglk&toad;test;procedure;clean?;silent?;sac
 ;
 new %s set %s=""
 new %c set %c="qx"
 new result set result=%s
 do CHKEQ^%ut($$strip^%ts(%s,%c),result)
 ;
 quit  ; end of strip07
 ;
 ;
 ;-----------------------------------------------------------------------------
 ; trim*: Unit tests for $$trim^%ts
 ;
trim01 ; @TEST $$trim^%ts(%s): Trim spaces from both ends
 ;ven/mcglk&toad;test;procedure;clean?;silent?;sac
 ;
 new %s set %s="     May the hair on your toes never fall out!     "
 new result set result="May the hair on your toes never fall out!"
 do CHKEQ^%ut($$trim^%ts(%s),result)
 ;
 quit  ; end of trim01
 ;
 ;
trim02 ; @TEST $$trim^%ts(%s,"LR"): Trim spaces from both ends
 ;ven/mcglk&toad;test;procedure;clean?;silent?;sac
 ;
 new %s set %s="     May the hair on your toes never fall out!     "
 new %e set %e="LR"
 new result set result="May the hair on your toes never fall out!"
 do CHKEQ^%ut($$trim^%ts(%s,%e),result)
 ;
 quit  ; end of trim02
 ;
 ;
trim03 ; @TEST $$trim^%ts(%s,"LR"," "): Trim spaces from both ends
 ;ven/mcglk&toad;test;procedure;clean?;silent?;sac
 ;
 new %s set %s="     May the hair on your toes never fall out!     "
 new %e set %e="LR"
 new %c set %c=" "
 new result set result="May the hair on your toes never fall out!"
 do CHKEQ^%ut($$trim^%ts(%s,%e,%c),result)
 ;
 quit  ; end of trim03
 ;
 ;
trim04 ; @TEST $$trim^%ts(%s,"L"): Trim spaces from beginning
 ;ven/mcglk&toad;test;procedure;clean?;silent?;sac
 ;
 new %s set %s="     May the hair on your toes never fall out!     "
 new %e set %e="L"
 new result set result="May the hair on your toes never fall out!     "
 do CHKEQ^%ut($$trim^%ts(%s,%e),result)
 ;
 quit  ; end of trim04
 ;
 ;
trim05 ; @TEST $$trim^%ts(%s,"L"," "): Trim spaces from beginning
 ;ven/mcglk&toad;test;procedure;clean?;silent?;sac
 ;
 new %s set %s="     May the hair on your toes never fall out!     "
 new %e set %e="L"
 new %c set %c=" "
 new result set result="May the hair on your toes never fall out!     "
 do CHKEQ^%ut($$trim^%ts(%s,%e,%c),result)
 ;
 quit  ; end of trim05
 ;
 ;
trim06 ; @TEST $$trim^%ts(%s,"R"): Trim spaces from end
 ;ven/mcglk&toad;test;procedure;clean?;silent?;sac
 ;
 new %s set %s="     May the hair on your toes never fall out!     "
 new %e set %e="R"
 new result set result="     May the hair on your toes never fall out!"
 do CHKEQ^%ut($$trim^%ts(%s,%e),result)
 ;
 quit  ; end of trim06
 ;
 ;
trim07 ; @TEST $$trim^%ts(%s,"R"," "): Trim spaces from end
 ;ven/mcglk&toad;test;procedure;clean?;silent?;sac
 ;
 new %s set %s="     May the hair on your toes never fall out!     "
 new %e set %e="R"
 new %c set %c=" "
 new result set result="     May the hair on your toes never fall out!"
 do CHKEQ^%ut($$trim^%ts(%s,%e,%c),result)
 ;
 quit  ; end of trim07
 ;
 ;
trim08 ; @TEST $$trim^%ts(%s,"ZQ"," "): No-op
 ;ven/mcglk&toad;test;procedure;clean?;silent?;sac
 ;
 new %s set %s="     May the hair on your toes never fall out!     "
 new %e set %e="ZQ"
 new %c set %c=" "
 new result set result=%s
 do CHKEQ^%ut($$trim^%ts(%s,%e,%c),result)
 ;
 quit  ; end of trim08
 ;
 ;
trim09 ; @TEST $$trim^%ts(%s,"LR","*"): Something other than a space
 ;ven/mcglk&toad;test;procedure;clean?;silent?;sac
 ;
 new %s set %s="*****May the hair on your toes never fall out!*****"
 new %e set %e="LR"
 new %c set %c="*"
 new result set result="May the hair on your toes never fall out!"
 do CHKEQ^%ut($$trim^%ts(%s,%e,%c),result)
 ;
 quit  ; end of trim09
 ;
 ;
trim10 ; @TEST $$trim^%ts(%s,," "): Missing second argument
 ;ven/mcglk&toad;test;procedure;clean?;silent?;sac
 ;
 new %s set %s="     May the hair on your toes never fall out!     "
 new %c set %c=" "
 new result set result="May the hair on your toes never fall out!"
 do CHKEQ^%ut($$trim^%ts(%s,,%c),result)
 ;
 quit  ; end of trim10
 ;
 ;
eor ; end of routine %tsu
