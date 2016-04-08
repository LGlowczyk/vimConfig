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
