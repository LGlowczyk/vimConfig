" Configuration file for features connected with displaying and managing project files

" TODO install project recognision plugin if needed

" PLUGIN NAME : NerdTree + NerdTreeTabs
" Purpose : file system navigation
" conf -> show bookmarks on startup
let g:NERDTreeShowBookmarks = 1

" build current project
" TODO now you need to store build data in build directory
" TODO now my IDE :) will not ask nor save your files before build
nnoremap <F6> :!make --directory=build<CR>
vnoremap <F6> <Esc>:!make --directory=build<CR>
inoremap <F6> <Esc>:!make --directory=build<CR>

" open/close NerdTree
nnoremap <C-F12> :NERDTreeToggle<CR>
vnoremap <C-F12> <Esc>:NERDTreeToggle<CR>v
inoremap <C-F12> <Esc>:NERDTreeToggle<CR>a
