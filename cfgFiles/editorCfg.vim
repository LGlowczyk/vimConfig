" File witch contains all confguration connected with code editing 

" PLUGIN NAME : tcomment
" Purpose : handle comment/uncomment text
" conf -> TODO

" PLUGIN NAME : easymotion
" Purpose : quick jumping with cursor between locations 
" conf -> Disable default mappings
let g:EasyMotion_do_mapping = 0 
" conf -> Jump to anywhere you want with minimal keystrokes, with just one key binding.
" <loacalleader>g{char}{char}{label}`
nmap <localleader>g <Plug>(easymotion-overwin-f2)
" conf -> Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
" conf -> JK motions: Line motions
map <localleader>j <Plug>(easymotion-j)
map <localleader>k <Plug>(easymotion-k)

" quick way to norrow down content of current buffer
" TODO currently this modifies buffer, it's unsafe, it would be better 
"      to use some smart folding
" remove lines which contains selected pattern or pattern under cursor
nnoremap <localleader>ea yiw:g/<c-r>"/d<CR><c-o>
vnoremap <localleader>ea y<esc>:g/<c-r>"/d<CR><c-o>
" filter only lines which contains selected pattern or pattern under cursor
nnoremap <localleader>sa yiw:v/<c-r>"/d<CR><c-o>
vnoremap <localleader>sa y<esc>:v/<c-r>"/d<CR><c-o>
" erase all empty lines
nnoremap <localleader>ee :g/^$/d<CR><c-o>
vnoremap <localleader>ee <esc>:g/^$/d<CR><c-o>

" close the curent buffer and switch to the next one. DON'T close the vim
nnoremap <localleader>q :bp<bar>sp<bar>bn<bar>bd<CR>
vnoremap <localleader>q <esc>:bp<bar>sp<bar>bn<bar>bd<CR>

" Code formating
nnoremap <localleader>i va{:pyf /usr/share/clang/clang-format.py<cr>
vnoremap <localleader>i :pyf /usr/share/clang/clang-format.py<cr>

" Core vim options configuration
" conf -> tabulation
set tabstop=2 " four spaces
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
" conf -> enable usual deleting in insert mode
set backspace=indent,eol,start

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

" copy text to and from system buffer
vnoremap <localleader>y "+y 
nnoremap <localleader>p "+p
