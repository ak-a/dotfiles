" virtu_LogViewer.vim: Define the timestamp pattern for the LogViewer.vim plugin.
"
" DEPENDENCIES:
"
" Copyright: (C) 2011-2014 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS
"   1.00.001	23-Aug-2011	file creation

let b:logTimestampExpr = '^\d\+:\d\+\.\d\+' " %d

" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
