" Configuration of navigation in source code, tracking dependecy etc.

" PLUGIN NAME : ag.vim
" Reg : ag (aka silver searcher)
" Purpose : Integration of 'ag' with vim. (ag == very fast grep)
" conf -> set ag command used by this plugin with all default params
" conf -> '-t' search 'text' files
" conf -> '-f' fallow symlinks
" conf -> '-depth' fallow almost all dirs
let g:ag_prg="ag --column --nogroup --noheading -t -f --depth 100"
" conf -> higlight searched pattern in result window
let g:ag_highlight=1

" PLUGIN NAME : command-t (need to be compiled -> see help)
" Purpose : opening and navigation between buffers
" conf -> set start of search directory to pwd 
let g:CommandTTraverseSCM = "pwd"
" conf -> using find utility should be faster than default ruby
let g:CommandTFileScanner = "find"
" conf -> 100 should be fine for reverse domain notation and it is almost all
let g:CommandTMaxDepth = 100
" conf -> very large project should fit in 100k limit of files
let g:CommandTMaxFiles = 100000
" Mappings :
" use the same mapping for start searching as ctrl-p
nnoremap <C-p> :CommandT<cr>
inoremap <C-p> <esc>:CommandT<cr>
vnoremap <C-p> <esc>:CommandT<cr>
" quick access to all currently opened buffers/files
nnoremap <C-S-e> :CommandTBuffer<cr>
inoremap <C-S-e> <esc>:CommandTBuffer<cr>
vnoremap <C-S-e> <esc>:CommandTBuffer<cr>

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
nnoremap <localleader>fd :call rtags#JumpTo()<CR>
" jump to definition in vertical window
nnoremap <localleader>fdv :call rtags#JumpTo("vert")<CR>
" TODO test this maping on class which hass parent class
nnoremap <localleader>fp :call rtags#JumpToParent()<CR>
" hmm find reference? :) 
nnoremap <localleader>fr :call rtags#FindRefs()<CR> 
" TODO what this is doing
" nnoremap <localleader>fn :call rtags#FindRefsByName(input("Pattern? ")<CR>
" search for symbols in current file (support some regex)
nnoremap <localleader>fs :call rtags#FindSymbols(input("Pattern? "))<CR>
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

" Core vim options configuration
set showmatch " jump to matching bracket to show it

" moving mappings
noremap <C-up> {
noremap <C-down> }

