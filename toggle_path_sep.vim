" 0: none
" 1: unix '/'
" 2: dos  '\'
" 3: dosQ '\\'
function! GetPathSepareterMode(line)
  " 3, 2, 1, 0
	let mode = 3
	let testers = ['\\\\', '\\', '/', ]
	for t in testers
		let res = matchstr(a:line, t)
		if res != ""
			break
		endif
		let mode = mode - 1
	endfor
	return mode
endfunction

function! TogglePathSeparator()
	let line = getline(".")
	let mode =  GetPathSepareterMode(line)
	if     mode == 1
		" :SubUtoD
		:s/\//\\/g
	elseif mode == 2
		" :SubDtoDD
		:s/\\/\\\\/g
	elseif mode == 3
		" :SubDDtoU
		:s/\\\\/\//g
	else
	endif
endfunction

nnoremap <Leader>w :call TogglePathSeparator()<CR>

" test sample
" foo/bar/baz
