" VIM configuration
let maplocalleader = "\<Space>"

" PLUGIN NAME : vundle 
" Purpose : easy installation of additional plugins in vim 
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" list of plugins installed by vundle
Plugin 'rdnetto/YCM-Generator'
Plugin 'Valloric/YouCompleteMe'
Plugin 'lyuts/vim-rtags'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'morhetz/gruvbox'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'vim-scripts/a.vim'
Plugin 'mhinz/vim-grepper'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'easymotion/vim-easymotion'
Plugin 'vimwiki/vimwiki'
Plugin 'tpope/vim-unimpaired'
Plugin 'crusoexia/vim-monokai'
Plugin 'romainl/vim-qf'
Plugin 'dominikduda/vim_current_word'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'pboettch/vim-cmake-syntax'
Plugin 'junegunn/fzf.vim'
Plugin 'martinda/Jenkinsfile-vim-syntax'

call vundle#end()            " required
filetype plugin indent on    " required
" end of vundle specific initialization

" source file which conteins configuration of diffrent modules
source ~/.vim/vimConfig/cfgFiles/dbgCfg.vim
source ~/.vim/vimConfig/cfgFiles/lookAndFeelCfg.vim
source ~/.vim/vimConfig/cfgFiles/autoCompleteCfg.vim
source ~/.vim/vimConfig/cfgFiles/projectViewCfg.vim
source ~/.vim/vimConfig/cfgFiles/outlineCfg.vim
source ~/.vim/vimConfig/cfgFiles/srcNavigationCfg.vim
source ~/.vim/vimConfig/cfgFiles/toolBarsCfg.vim
source ~/.vim/vimConfig/cfgFiles/editorCfg.vim

augroup refreshVimrc
  au!
  au BufWritePost .vimrc so %
augroup END

" disabled due to problem with async run
let g:gf_auto_open_quickfix = 0

" Run post startup part 
" TODO -> start vim agent in one terminal/console
" TODO -> start in this terminal rdm server

" FIXME list 
" closing not the last one buffer with bd close vim -> most probably it is problem wit nerdtreetabs

" TODO finding file (command T ?) (r tags has similar functionality)
" TODO UltiSnips for code templates (automatic fields)
" TODO implement method would be nice

" Finally enable project specific settings 
" read .vimrc from any dir
set exrc
set secure
