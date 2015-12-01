" Configuration file which contain all configuration connected only with the way vim looks, vim "windows" etc.

" PLUGIN NAME : gruvbox
" Purpose : color theme
" conf -> enable theme
colorscheme gruvbox
" conf -> choose dark theme
set background=dark

" Full screen for IDE (hide side windows)
nnoremap <F12> :call FullScreenToggle()<cr>

" Core vim options
syntax enable " syntax coloring
set number " enable line numbering
set ruler  " show line numbers and columns for current cursor position

" Functions
let g:outline_closed_by_user = 0
let g:side_widows_are_open = 1
function! FullScreenToggle()
    if g:side_widows_are_open
        NERDTreeClose
        TagbarClose
        let g:side_widows_are_open = 0
        let g:outline_closed_by_user = 1
    else
        NERDTree
        TagbarOpen
        let g:side_widows_are_open = 1
    endif
endfunction
