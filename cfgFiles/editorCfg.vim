" File witch contains all confguration connected with code editing 

" PLUGIN NAME : tcomment
" Purpose : handle comment/uncomment text
" conf -> TODO

" Code formating
map <C-K> :pyf ~/.vim/configuration/formater/clang-format.py<cr>
imap <C-K> <c-o>:pyf ~/.vim/configuration/formater/clang-format.py<cr>

" Core vim options configuration
set tabstop=4 " four spaces
set expandtab " change tabulation to spaces
set autoindent " copy indent from previous line
set hlsearch incsearch "configure searching

" save shortcuts
nnoremap <c-s> :w<CR>
inoremap <c-s> <Esc>:w<CR>

" move current line one up/down
noremap <C-S-up> :call feedkeys( line(',')==1 ? '' : 'ddkP' )<CR>
noremap <C-S-down> ddp 

