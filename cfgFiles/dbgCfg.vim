" Configuration file which contains all vim setting for debuger

" Pyclewn -> gdb integration -> req netbeans_intg flag to be set (check :version)
" Pyclewn installed by tarball :(
" conf -> set place when pyclewn will start
let g:pyclewn_args = "-w right"
" start debug session
" TODO AL2 : adjust colors of breakpoint 
" TODO this should take foucus of main window
" TODO save gdb session with project-command
" step over and step into
nnoremap <F7> :Cnext<CR>
nnoremap <F8> :Cstep<CR>
" FIXME reverse commands does not work
" reverse version of step over and step into
nnoremap <S-F7> :C reverse-next<CR>
nnoremap <S-F8> :C reverse-step<CR>
" continue execution and continue in reverse direction
nnoremap <F9> :Ccontinue<CR>
nnoremap <S-F9> :C reverse-continue<CR>
" start/stop debug session
nnoremap <F10> :call DebugSessionToggle()<CR>
" TODO check .pyclewn_keys.gdb for howto configure following shortcuts
" TODO add <C-B> toggle breakpoint at current cursor location
" TODO add <C-P> print value of the variable defined by the mouse pointer position
" TODO add <C-X> print value of the variable pointed by element under cursor

" Helper functions

" FIXME only initial open close work almost correct
" Turn off or turn on debug session
let g:debuger_on = 0
function! DebugSessionToggle()
    if g:debuger_on
        Cexitclewn
        let g:debuger_on = 0
    else
        Pyclewn gdb
"        Cecho
        let g:debuger_on = 1
    endif
endfunction
