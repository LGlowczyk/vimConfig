" Configuration of code and methods which helps with outlinig function and variables from the code

" PLUGIN NAME : Tagbar
" Purpose : outline function and symbols
" conf -> set window width
let g:tagbar_width = 55 
" conf -> path to mandatory ctags
let g:tagbar_ctags_bin = '/usr/bin/ctags'
" conf -> auto open tagbar when supported buffer is open but only if user didn't expl. close it 
autocmd BufRead * nested : if g:outline_closed_by_user == 0 | call tagbar#autoopen(0) | endif

" Mapings :
" open tagbar
nnoremap <S-F12> :call VimIDETagbarToggle()<CR>
vnoremap <S-F12> <Esc>:call VimIDETagbarToggle()<CR>v
inoremap <S-F12> <Esc>:call VimIDETagbarToggle()<CR>a

" open tagbar/outline for search, auto close window after usage
nnoremap <localleader>o :TagbarOpenAutoClose<CR>/\c
vnoremap <localleader>o <Esc>:TagbarOpenAutoClose<CR>/\c

" Wrapper for TagbarToggle which sets global flag outline_closed_by_user
function! VimIDETagbarToggle()
    let outline_window = bufwinnr("__Tagbar__")
    " window is present so this is explisite close of outline by user
    if outline_window != -1
        let g:outline_closed_by_user = 1
    endif
    TagbarToggle
endfunction
