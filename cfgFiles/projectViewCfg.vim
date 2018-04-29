" Configuration file for features connected with displaying and managing project files

" variables connected with project mng
let PROJECT_FILE_NAME = ".vimrc"
let YCM_CONF_FILE_NAME = ".ycm_extra_conf.py"

" PLUGIN NAME : NerdTree + NerdTreeTabs
" Purpose : file system navigation
" conf -> show bookmarks on startup
let g:NERDTreeShowBookmarks = 1

function! CPeek()
  " Store the original window number
  let l:winnr = winnr()

  " Open a window to show the current list of erros
  copen
  " small qf window during compilation
  resize 4

  " If focus changed jump to the last window
  if l:winnr !=# winnr()
    wincmd p
  endif
endfunction

function! ShowErrorOrClose()
  let l:numOfErrors = len(filter(getqflist(), 'v:val.valid'))
  if l:numOfErrors == 0
    cclose
  else
    cn
  endif
endfunction

let g:asyncrun_exit = "call ShowErrorOrClose()"

" build current project
" TODO now my IDE :) will not ask nor save your files before build
nnoremap <F6> :call CPeek()<CR>:AsyncRun -program=make<CR>
vnoremap <F6> <Esc>:call CPeek()<CR>:AsyncRun -program=make<CR>
inoremap <F6> <Esc>:call CPeek()<CR>:AsyncRun -program=make<CR>

" open/close NerdTree
nnoremap <C-F12> :NERDTreeToggle<CR>
vnoremap <C-F12> <Esc>:NERDTreeToggle<CR>v
inoremap <C-F12> <Esc>:NERDTreeToggle<CR>a

" TODO make it async (req vim 8)
" Generate configuration files for fresh projects.
" Supported conf. files :
" .ycm_extra_conf.py
function! GenerateProjectFiles()
  if exists("g:PROJECT_ROOT_DIR") && exists("g:BUILD_FOLDER")
    let s:projectFilePath = g:PROJECT_ROOT_DIR . "/" . g:PROJECT_FILE_NAME
    let s:ycmConfFilePath = g:PROJECT_ROOT_DIR . "/" . g:YCM_CONF_FILE_NAME

    " if .vimrc exist an .ycm doesn't exist
    if filereadable(s:projectFilePath) && !filereadable(s:ycmConfFilePath)
      echom "Generating project conf. files"
      let s:cmd = "YcmGenerateConfig -f ".g:BUILD_FOLDER
      silent exe s:cmd 
      " move config file to PROJECT_ROOT_DIR
      if g:PROJECT_ROOT_DIR != g:BUILD_FOLDER
        echom "Transferring ycm conf file to project root"
        let s:mvCmd = "!mv ".g:BUILD_FOLDER."/.ycm_extra_conf.py ".g:PROJECT_ROOT_DIR
        silent exe s:mvCmd
      endif

      if filereadable(s:ycmConfFilePath)
        echom "Files generated"
      else
        echom "Error during generation of project conf. files"
      endif
    endif
  endif
endfunction

augroup projRegenAtStartup
  autocmd!
  autocmd VimEnter * :call GenerateProjectFiles()
augroup END

command! -nargs=1 CreateProject :call CreateProject(<f-args>)

function! CreateProject(projectName)
  pyfile  ~/.vim/vimConfig/scripts/projectMng.py

  " if project was created without errors source it and configure 
  let s:projectFilePath = "./" . g:PROJECT_FILE_NAME
  if filereadable(s:projectFilePath)
    source ./.vimrc
    call GenerateProjectFiles()
  endif
endfunction
