" VIM configuration
let maplocalleader = "\<Space>"

" PLUGIN NAME : pathogen
" Purpose : easy installation of additional plugins in vim 
execute pathogen#infect()
set runtimepath+=~/.vim

" source file which conteins configuration of diffrent modules
source ~/.vim/cfgFiles/dbgCfg.vim
source ~/.vim/cfgFiles/lookAndFeelCfg.vim
source ~/.vim/cfgFiles/autoCompleteCfg.vim
source ~/.vim/cfgFiles/projectViewCfg.vim
source ~/.vim/cfgFiles/outlineCfg.vim
source ~/.vim/cfgFiles/srcNavigationCfg.vim
source ~/.vim/cfgFiles/toolBarsCfg.vim
source ~/.vim/cfgFiles/editorCfg.vim

" Run post startup part 
" TODO -> start vim agent in one terminal/console
" TODO -> start in this terminal rdm server

" FIXME list 
" closing not the last one buffer with bd close vim -> most probably it is problem wit nerdtreetabs

" TODO finding file (command T ?) (r tags has similar functionality)
" TODO UltiSnips for code templates (automatic fields)
" TODO implement method would be nice
