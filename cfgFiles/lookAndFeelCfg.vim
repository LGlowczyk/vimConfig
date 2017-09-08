" Configuration file which contain all configuration connected only with the way vim looks, vim "windows" etc.

" PLUGIN NAME : gruvbox
" Purpose : color theme
" conf -> enable theme
colorscheme gruvbox
" conf -> choose dark theme
set background=dark
" conf -> set highest contrast of gruvebox theme
let g:gruvbox_contrast_dark = "hard"

" Full screen for IDE (hide side windows)
nnoremap <F12> :call FullScreenToggle()<cr>

" Core vim options
syntax enable " syntax coloring
set number " enable line numbering
set ruler  " show line numbers and columns for current cursor position
if has("gui_running") "Maximize gvim window
  set lines=999 columns=999
endif
" Hide unused gui tools
set guioptions-=m " remove menu bar
set guioptions-=T " remove toolbar
set guioptions-=r " remove right-hand scroll bar
set guioptions-=L " remove left-hand scroll bar

" highlight letter which are on the code line limit
if !exists("g:codeLineMaxWidth")
    " if user didn't define max line width use default 80 chars    
    let g:codeLineMaxWidth = 80
endif
highlight ColorColumn guibg=purple
let borderColumnPattern = '\%'.string(g:codeLineMaxWidth + 1).'v'
call matchadd('ColorColumn', borderColumnPattern, 100)

" Functions
" Hide and restore side panels, split will be preserved
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

" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <C-S-x> :ZoomToggle<CR>
