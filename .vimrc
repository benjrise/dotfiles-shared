imap jj <Esc>
nmap j gj 
nmap k gk

" set iskeyword-=_
set expandtab
set shiftwidth=4
set tabstop=4

augroup ShellScripts
    autocmd!
    autocmd BufRead,BufNewFile *.sh set filetype=sh
    " Add additional autocommands for .sh files below this line.
    " For example, you can set specific options, like enabling syntax highlighting or setting indentation:
    autocmd FileType sh setlocal expandtab
    autocmd FileType sh setlocal shiftwidth=2
    autocmd FileType sh setlocal softtabstop=2
augroup END

let mapleader = " " 
nnoremap <SPACE> <Nop>
nnoremap <CR> :noh<CR>

" Move up and down by half page
noremap <s-j> <c-d>zz
noremap <s-k> <c-u>zz

" Add the below line to current line
nnoremap <s-u> <s-j>

" Change increment bindings not working
nnoremap <A-a> <c-a>
nnoremap <A-x> <s-x>

" Add save to <C-s>
vnoremap <C-s> :w<CR>
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>i<right>

" Rehighlight after indentation
vnoremap > >gv
" Quickly add ne line don't leave normal mode
nnoremap <Leader>o o<Esc>0"_D
nnoremap <Leader>O O<Esc>0"_D

nnoremap 0 ^
nnoremap ^ 0

" H and L for moving to beginning and end of line
nmap H g^
nmap L g$
vmap H g^
vmap L g$

nmap Y y$

vnoremap p "_dP

" Escape special characters in a string for exact matching.
" This is useful to copying strings from the file to the search tool
" Based on this - http://peterodding.com/code/vim/profile/autoload/xolox/escape.vim
function! EscapeString (string)
  let string=a:string
  " Escape regex characters
  let string = escape(string, '^$.*\/~[]')
  " Escape the line endings
  let string = substitute(string, '\n', '\\n', 'g')
  return string
endfunction

" Get the current visual block for search and replaces
" This function passed the visual block through a string escape function
" Based on this - https://stackoverflow.com/questions/676600/vim-replace-selected-text/677918#677918
function! GetVisual() range
  " Save the current register and clipboard
  let reg_save = getreg('"')
  let regtype_save = getregtype('"')
  let cb_save = &clipboard
  set clipboard&

  " Put the current visual selection in the " register
  normal! ""gvy
  let selection = getreg('"')

  " Put the saved registers and clipboards back
  call setreg('"', reg_save, regtype_save)
  let &clipboard = cb_save

  "Escape any special characters in the selection
  let escaped_selection = EscapeString(selection)

  return escaped_selection
endfunction

" Start the find and replace command across the entire file
vnoremap <C-r> "hy:%s/<C-r>=GetVisual()<cr>//g<left><left>
" Change redo to <C-u>
nnoremap <C-u> <C-r>

" nnoremap ^[j 10j
" nnoremap <M-j> :m .+1<CR>==
" nnoremap <A-k> :m .-2<CR>==
" inoremap <A-j> <Esc>:m .+1<CR>==gi
" inoremap <A-k> <Esc>:m .-2<CR>==gi
" vnoremap <A-j> :m '>+1<CR>gv=gv
" vnoremap <A-k> :m '<-2<CR>gv=gv

