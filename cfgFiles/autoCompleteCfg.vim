" Configuration file witch contains all vim configuration connected with code autocompletion

" PLUGIN NAME : YouCompleteMe
" Purpose : autocompletition
" conf -> auto close preview window after leaving insertion mode
let g:ycm_autoclose_preview_window_after_insertion = 1
" conf -> postpone triggering of identifier base help until more info about
"         context is available, default value 2 provide a lot of inaccurate
"         options
let g:ycm_min_num_of_chars_for_completion = 4

" Mapings :
" show type of symbol under cursor
nnoremap <localleader>st :YcmCompleter GetType<CR>
" fix error in current line
nnoremap <localleader>ce :YcmCompleter FixIt<CR>
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

" show current unfinished vim command in the corner
set showcmd
