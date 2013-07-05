function! Tex_ForwardSearchLaTeX()
	let cmd = 'evince_forward_search ' . fnamemodify(Tex_GetMainFileName(), ":p:r") .  '.pdf ' . line(".") . ' ' . expand("%:p")
	let output = system(cmd)
endfunction
