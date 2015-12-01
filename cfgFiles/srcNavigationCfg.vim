" Configuration of navigation in source code, tracking dependecy etc.

" PLUGIN NAME : ctrlp
" Purpose : opening and navigation betwean buffers
" TODO configure ctrl-P

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

