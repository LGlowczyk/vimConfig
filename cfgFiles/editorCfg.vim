" File witch contains all confguration connected with code editing 

" PLUGIN NAME : tcomment
" Purpose : handle comment/uncomment text
" conf -> TODO

" Code formating
nnoremap <localleader>i va{:pyf /usr/share/clang/clang-format.py<cr>
vnoremap <localleader>i :pyf /usr/share/clang/clang-format.py<cr>

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
set shiftwidth=0  " automatic indent will use indent values from tabstop
set cinoptions=:0l1h0(0 " align case with switch (they will be in one line)
                    " align case content
                    " don't indent public, private, protected
                    " inside of if bool expr align to the opening (
" TODO check cindent and cinoptions description
" conf -> rest
set hlsearch incsearch " configure searching
set cursorline " highlight line which contain cursor
hi CursorLine guibg=black " increase visibility of current line

" save shortcuts
nnoremap <c-s> :w<CR>
inoremap <c-s> <Esc>:w<CR>

" move current lines one up/down
nnoremap <C-S-up> :call feedkeys( line(',')==1 ? '' : 'ddkP' )<CR>
nnoremap <C-S-down> ddp 
inoremap <C-S-up> :call feedkeys( line(',')==1 ? '' : 'ddkP' )<CR>
inoremap <C-S-down> ddp 
vnoremap <C-S-up> :m '<-2<CR>gv=gv
vnoremap <C-S-down> :m '>+1<CR>gv=gv

" highlight all acourence of current word
" TODO this isn't ideal solution because it's changing jumplist
nnoremap <F4> *``
inoremap <F4> <Esc>*``

