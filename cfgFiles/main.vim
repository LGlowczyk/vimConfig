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
Plugin 'Valloric/YouCompleteMe'
Plugin 'lyuts/vim-rtags'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'tomtom/tcomment_vim'
Plugin 'scrooloose/nerdtree'
Plugin 'morhetz/gruvbox'
Plugin 'wincent/command-t'
Plugin 'vim-scripts/a.vim'
Plugin 'rking/ag.vim'

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

" Run post startup part 
" TODO -> start vim agent in one terminal/console
" TODO -> start in this terminal rdm server

" FIXME list 
" closing not the last one buffer with bd close vim -> most probably it is problem wit nerdtreetabs

" TODO finding file (command T ?) (r tags has similar functionality)
" TODO UltiSnips for code templates (automatic fields)
" TODO implement method would be nice
