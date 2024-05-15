"~ syntax match customConceals "&lt;" conceal cchar=<
"~ syntax match customConceals "- \[ \]" conceal cchar=󰄱
"~ syntax match customConceals "\[ \]" conceal cchar=󰄱
"~ syntax match customConceals "\[\.\]" conceal cchar=󱋭
"~ syntax match customConceals "\[x\]" conceal cchar=󰄵
"~ highlight! default link Conceal Normal

syn region mkdID matchgroup=mkdDelimiter    start="\["    end="\]" contained oneline conceal
syn region mkdURL matchgroup=mkdDelimiter   start="("     end=")"  contained oneline conceal
syn region mkdLink matchgroup=mkdDelimiter  start="\\\@<!!\?\[\ze[^]\n]*\n\?[^]\n]*\][[(]" end="\]" contains=@mkdNonListItem,@Spell nextgroup=mkdURL,mkdID skipwhite concealends
hi def link mkdLink htmlLink
