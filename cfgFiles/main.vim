" VIM configuration
let maplocalleader = "\<Space>"

" PLUGIN NAME : pathogen
" Purpose : easy installation of additional plugins in vim 
execute pathogen#infect()
set runtimepath+=~/.vim

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
