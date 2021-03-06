" ingo/join.vim: Functions for joining lines in the buffer.
"
" DEPENDENCIES:
"   - ingo/folds.vim autoload script
"
" Copyright: (C) 2014-2017 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS
"   1.020.002	08-Jun-2014	Do not clobber the default register when joining
"				lines with separator and not keeping spaces.
"   1.020.001	08-Jun-2014	file creation from ingocommands.vim

function! ingo#join#Lines( lnum, isKeepSpace, separator )
"******************************************************************************
"* PURPOSE:
"   Join a:lnum with the next line, putting a:separator in between (and
"   optionally deleting any separating whitespace).
"* ASSUMPTIONS / PRECONDITIONS:
"   The 'formatoptions' option may affect the join, especially M, B, j.
"* EFFECTS / POSTCONDITIONS:
"   Joins lines.
"* INPUTS:
"   a:lnum  Line number of the first line to be joined.
"   a:isKeepSpace   Flag whether to keep whitespace (i.e. trailing in a:lnum,
"		    indent in a:lnum + 1) or remove it altogether. The joining
"		    itself does not add whitespace.
"   a:separator     String to be put in between the lines (also when one of them
"		    is completely empty).
"* RETURN VALUES:
"   None.
"******************************************************************************
    if a:isKeepSpace
	let l:lineLen = len(getline(a:lnum))
	execute a:lnum . 'join!'
	if ! empty(a:separator)
	    if len(getline(a:lnum)) == l:lineLen
		" The next line was completely empty.
		execute 'normal! A' . a:separator . "\<Esc>"
	    else
		call cursor(a:lnum, l:lineLen + 1)
		execute 'normal! i' . a:separator . "\<Esc>"
	    endif
	endif
    else
	execute a:lnum
	normal! J
	if ! empty(a:separator)
	    execute 'normal! "_ciw' . a:separator . "\<Esc>"
	endif
    endif
endfunction

function! ingo#join#Ranges( isKeepSpace, startLnum, endLnum, separator, ranges )
"******************************************************************************
"* PURPOSE:
"   Join each range of lines in a:ranges.
"* ASSUMPTIONS / PRECONDITIONS:
"   The 'formatoptions' option may affect the join, especially M, B, j.
"* EFFECTS / POSTCONDITIONS:
"   Joins lines.
"* INPUTS:
"   a:isKeepSpace   Flag whether to keep whitespace (i.e. trailing in a:lnum,
"		    indent in a:lnum + 1) or remove it altogether. The joining
"		    itself does not add whitespace.
"   a:startLnum     Ignored.
"   a:endLnum       Ignored.
"   a:separator     String to be put in between the lines (also when one of them
"		    is completely empty).
"   a:ranges        List of [startLnum, endLnum] pairs.
"* RETURN VALUES:
"   [ number of ranges, number of joined lines ]
"******************************************************************************
    if empty(a:ranges)
	return [0, 0]
    endif

    let l:joinCnt = 0
    let l:save_foldenable = &foldenable
    set nofoldenable
    try
	for [l:rangeStartLnum, l:rangeEndLnum] in reverse(a:ranges)
	    let l:cnt = l:rangeEndLnum - l:rangeStartLnum
	    for l:i in range(l:cnt)
		call ingo#join#Lines(l:rangeStartLnum, a:isKeepSpace, a:separator)
	    endfor
	    let l:joinCnt += l:cnt
	endfor
    finally
	let &foldenable = l:save_foldenable
    endtry
    return [len(a:ranges), l:joinCnt]
endfunction

function! ingo#join#FoldedLines( isKeepSpace, startLnum, endLnum, separator )
"******************************************************************************
"* PURPOSE:
"   Join all folded lines.
"* ASSUMPTIONS / PRECONDITIONS:
"   The 'formatoptions' option may affect the join, especially M, B, j.
"* EFFECTS / POSTCONDITIONS:
"   Joins lines.
"* INPUTS:
"   a:isKeepSpace   Flag whether to keep whitespace (i.e. trailing in a:lnum,
"		    indent in a:lnum + 1) or remove it altogether. The joining
"		    itself does not add whitespace.
"   a:startLnum     First line number to be considered.
"   a:endLnum       last line number to be considered.
"   a:separator     String to be put in between the lines (also when one of them
"		    is completely empty).
"* RETURN VALUES:
"   [ number of folds, number of joined lines ]
"******************************************************************************
    let l:folds = ingo#folds#GetClosedFolds(a:startLnum, a:endLnum)
    return ingo#join#Ranges(a:isKeepSpace, a:startLnum, a:endLnum, a:separator, l:folds)
endfunction

" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
