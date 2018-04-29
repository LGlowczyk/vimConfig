" Configuration of code and methods which helps with outlinig function and variables from the code

" PLUGIN NAME : Tagbar
" Purpose : outline function and symbols
" conf -> set window width
let g:tagbar_width = 55 
" conf -> path to mandatory ctags
let g:tagbar_ctags_bin = '/usr/bin/ctags'

" Mapings :
" open tagbar
nnoremap <S-F12> :call VimIDETagbarToggle()<CR>
vnoremap <S-F12> <Esc>:call VimIDETagbarToggle()<CR>v
inoremap <S-F12> <Esc>:call VimIDETagbarToggle()<CR>a

" Wrapper for TagbarToggle which sets global flag outline_closed_by_user
function! VimIDETagbarToggle()
    let outline_window = bufwinnr("__Tagbar__")
    " window is present so this is explisite close of outline by user
    if outline_window != -1
        let g:outline_closed_by_user = 1
    endif
    TagbarToggle
endfunction
