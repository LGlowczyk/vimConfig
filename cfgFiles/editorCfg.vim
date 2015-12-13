" File witch contains all confguration connected with code editing 

" PLUGIN NAME : tcomment
" Purpose : handle comment/uncomment text
" conf -> TODO

" Code formating
map <C-K> :pyf ~/.vim/configuration/formater/clang-format.py<cr>
imap <C-K> <c-o>:pyf ~/.vim/configuration/formater/clang-format.py<cr>

" Core vim options configuration
" conf -> tabulation
set tabstop=4 " four spaces
set expandtab " change tabulation to spaces
" conf -> indent (for src file cindent will be used, it is enabled by 
"         filetype command in main.vim , req. by vundle)
"         TODO maybe this filetype command should be moved here?
set autoindent " copy indent from previous line
               " this is default indention policy 
               " will be used with non source code files
set shiftwidth=0 " automatic indent will use indent values from tabstop
" TODO check cindent and cinoptions description
" conf -> rest
set hlsearch incsearch " configure searching
set cursorline " highlight line which contain cursor

" save shortcuts
nnoremap <c-s> :w<CR>
inoremap <c-s> <Esc>:w<CR>

" move current line one up/down
noremap <C-S-up> :call feedkeys( line(',')==1 ? '' : 'ddkP' )<CR>
noremap <C-S-down> ddp 

" highlight all acourence of current word
nnoremap <F4> *
inoremap <F4> <Esc>*

