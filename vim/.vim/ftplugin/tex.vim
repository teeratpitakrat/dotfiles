function! Tex_ForwardSearchLaTeX()
	let cmd = 'evince_forward_search ' . fnamemodify(Tex_GetMainFileName(), ":p:r") .  '.pdf ' . line(".") . ' ' . expand("%:p")
	let output = system(cmd)
endfunction

function! SyncTexForward()
	let s:syncfile = fnamemodify(fnameescape(Tex_GetMainFileName()), ":r").".pdf"
	let execstr = "silent !okular --unique ".s:syncfile."\\#src:".line(".").expand("%\:p").' &'
	exec execstr
endfunction
nnoremap <Leader>f :call SyncTexForward()<CR>

let g:Tex_SmartKeyQuote=0
