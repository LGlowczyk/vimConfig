" Configuration file witch contains all vim configuration connected with code autocompletion

" PLUGIN NAME : YouCompleteMe
" Purpose : autocompletition
" conf -> set fallback ycm with default C++ flags
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/fallbackFlags/.ycm_extra_conf.py'
" conf -> auto close preview window after leaving insertion mode
let g:ycm_autoclose_preview_window_after_insertion = 1
" Mapings :
" show type of symbol under cursor
nnoremap <localleader>st :YcmCompleter GetType<CR>
" TODO enable reading data from tag files, disabled by default
" TODO show/hide diagnostic window
" TODO change color of warings to blue
" TODO automatic generation of configuration data per project
" TODO proper default fallback flags
" TODO handle problem of relative path for default .ycm 
" TODO handle problem of folders src and include and error for includes 

" vim internal futures
" TODO configure auto completition in vim command line with wildmenu and wildmode
set wildmenu
