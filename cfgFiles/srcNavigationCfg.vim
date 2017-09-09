" Configuration of navigation in source code, tracking dependecy etc.

" PLUGIN NAME : grepper
" Req : ag (aka silver searcher)
" Purpose : Ench. async grep for vim
" Initialize g:grepper with empty directory
let g:grepper = {}
" conf -> highlight searched pattern
let g:grepper.highlight = 1
" conf -> don't switch focus automatically
let g:grepper.switch = 0
" search for current word and populate side buffer 
" with result with small context
nnoremap <localleader>ws :Grepper -cword -noprompt -side<cr>
" find word under the cursor in files from cd
nnoremap <localleader>w :Grepper -cword -noprompt<cr>

" PLUGIN NAME : ctrlp
" Purpose : opening and navigation betwean buffers
" conf -> set star of search directory to nearest .git/.svn/cwd direcotry
let g:ctrlp_working_path_mode = 'rw'
" conf -> search only by file name, not by file path
let g:ctrlp_by_filename = 1
" conf -> quicker startup achieved by preserving caches between vim sessions
let g:ctrlp_clear_cache_on_exit = 0
" conf -> custom matching function (FelikZ/ctrlp-py-matcher) to speed up
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
" Mappings :
" quick access to all currently opened buffers/files
nnoremap <localleader>b :CtrlPBuffer<cr>
vnoremap <localleader>b <esc>:CtrlPBuffer<cr>

" PLUGIN NAME : A
" Purpose : switch cpp <-> h
" conf -> disable creating missing file
let g:alternateNoDefaultAlternate = 1
" Mapings :
" switch cpp <-> h in same window
nnoremap <localleader>s :A<CR>
" switch cpp <-> h in split window
nnoremap <localleader>sv :AV<CR>

" PLUGIN NAME : vim-rtags + rtags
" Purpose find reference, change name
" conf -> disable default mappings they use leader
let g:rtagsUseDefaultMappings = 0
" Mapings :
" show information about symbol under cursor
nnoremap <localleader>fi :call rtags#SymbolInfo()<CR>
" jump to definition of symbol under cursor
nnoremap <localleader>fd :call rtags#JumpTo(g:SAME_WINDOW)<CR>
" jump to definition in vertical window
nnoremap <localleader>fdv :call rtags#JumpTo(g:V_SPLIT)<CR>
" jump to definition in horizontal window
nnoremap <localleader>fds :call rtags#JumpTo(g:H_SPLIT)<CR>
" TODO test this maping on class which hass parent class
nnoremap <localleader>fp :call rtags#JumpToParent()<CR>
" hmm find reference? :) 
nnoremap <localleader>fr :call rtags#FindRefs()<CR> 
" TODO what this is doing
" nnoremap <localleader>fn :call rtags#FindRefsByName(input("Pattern? ")<CR>
" search for parent and derived classes
nnoremap <localleader>fS :call rtags#FindSuperClasses()<CR>
nnoremap <localleader>fs :call rtags#FindSubClasses()<CR>
" typical refresh this should probably moved into more general function 
" not only for r-tags
nnoremap <F5> :call rtags#ReindexFile()<CR>
" TODO convert it into vim function or even better for vim menu
" nnoremap <localleader>fl :call rtags#ProjectList()<CR>
nnoremap <localleader>rn :call rtags#RenameSymbolUnderCursor()<CR>
nnoremap <localleader>fv :call rtags#FindVirtuals()<CR>
" TODO automatic refresh load
" TODO auto start of rdm -> posible new feature in rtags
" TODO it would be nice if reference would be highlited in current buffers -> check some for locList

" TODO where this mapping should be stored? Here or projectViewCfg?
" focus file in project explorer
nnoremap <localleader>ff :NERDTreeFind<cr>
vnoremap <localleader>ff <esc>:NERDTreeFind<cr>

" Core vim options configuration
set showmatch " jump to matching bracket to show it
set ignorecase " improve search

" moving mappings
noremap <C-up> {
noremap <C-down> }

