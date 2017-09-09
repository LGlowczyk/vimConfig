" Configuration of toolbars

" PLUGIN NAME : AirLine
" Purpose : status bar
" conf -> install power-fonts for power symbols
" conf -> choose proper font
set guifont=Liberation\ Mono\ for\ Powerline\ 11
" conf -> enable proper coding for power line symbols
"set encoding=utf-8
" conf -> create map for symbols if not created already
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" conf -> enable nice arrows > :> in status line
let g:airline_powerline_fonts = 1
" conf ->  Do not collapse the status line while having multiple windows
let g:airline_inactive_collapse = 0	
" conf -> show list of buffers it there is only one tab
let g:airline#extensions#tabline#enabled = 1
" cont -> show buffer number for easy switching
let g:airline#extensions#tabline#buffer_idx_mode = 1
" Mapings :
" switch buffer basing on displayed number
nmap <localleader>1 <Plug>AirlineSelectTab1
nmap <localleader>2 <Plug>AirlineSelectTab2
nmap <localleader>3 <Plug>AirlineSelectTab3
nmap <localleader>4 <Plug>AirlineSelectTab4
nmap <localleader>5 <Plug>AirlineSelectTab5
nmap <localleader>6 <Plug>AirlineSelectTab6
nmap <localleader>7 <Plug>AirlineSelectTab7
nmap <localleader>8 <Plug>AirlineSelectTab8
nmap <localleader>9 <Plug>AirlineSelectTab9

