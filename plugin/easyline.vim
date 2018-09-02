" ========================== Status line =====================================
let g:stmode_normal  = '  NORMAL'
let g:stmode_insert  = '  INSERT'
let g:stmode_visual  = '  VISUAL'
let g:stmode_vline   = '  V-LINE'
let g:stmode_replace = '  REPLACE'
let g:stmode_command = '  COMMAND'
let g:stmode_unknown = '  UNKNOWN'
let g:stft_unknown   = 'noft'

function StatusLineMode()
    let value = mode()
    if value == 'n'
        execute 'hi StMode ctermbg=4 ctermfg=8'
        return g:stmode_normal
    elseif value == 'v'
        execute 'hi StMode ctermbg=5 ctermfg=8'
        return g:stmode_visual
    elseif value == 'V'
        execute 'hi StMode ctermbg=5 ctermfg=8'
        return g:stmode_vline
    elseif value == 'R'
        execute 'hi StMode ctermbg=4 ctermfg=8'
        return g:stmode_replace
    elseif value == 'i'
        execute 'hi StMode ctermbg=2 ctermfg=8'
        return g:stmode_insert
    elseif value == 'c'
        execute 'hi StMode ctermbg=3 ctermfg=8'
        return g:stmode_command
    else
        return g:stmode_unknown
    endif
endfunction

function StatusLineFileType()
    let value = &filetype
    if value == ''
        return g:stft_unknown
    else
        return value
    endif
endfunction

set statusline=
set statusline+=\%#StMode#\%{StatusLineMode()}
set statusline+=\ %#StDefault#
set statusline+=\%#StFile#\ %f
set statusline+=\ %#StDefault#
set statusline+=\ \%m\ %r\ %h
set statusline+=%=
set statusline+=%v,\ %l/%L
set statusline+=\ [\ %{&fileencoding}\ ]
set statusline+=\ [\ %{&fileformat}\ ]
set statusline+=\ [\ %{StatusLineFileType()}\ ]
set statusline+=\ [%n]

hi StatusLine ctermbg=11 ctermfg=Black
hi StFile ctermbg=10 ctermfg=Black
