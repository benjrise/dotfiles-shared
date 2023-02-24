set clipboard=unnamed
imap jj <Esc>
nmap gj j 
nmap gk k

let mapleader = " " 
nnoremap <SPACE> <Nop>
nnoremap <leader>f /

" Move up and down by half page
nnoremap <s-J> <C-D>zz
nnoremap <s-k> <C-U>zz

" Add the below line to current line
nnoremap <s-U> <s-J>

" Change increment bindings not working
nnoremap <A-a> <C-a>
nnoremap <A-x> <C-x>

" Add save to <C-s>
vnoremap <C-s> :w<CR>
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>i<right>

" H and L for moving to beginning and end of line
nmap H g^
nmap L g$
vmap H g^
vmap L g$

" Not working as expected atm
:vnoremap <C-r> "hy:%s/<C-r>h//g<left><left>
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
vmap <C-r> "hy:%s/<C-r>=GetVisual()<cr>//g<left><left>

nnoremap ^[j 10j
nnoremap <M-j> :m .+1<CR>==
" nnoremap <A-k> :m .-2<CR>==
" inoremap <A-j> <Esc>:m .+1<CR>==gi
" inoremap <A-k> <Esc>:m .-2<CR>==gi
" vnoremap <A-j> :m '>+1<CR>gv=gv
" vnoremap <A-k> :m '<-2<CR>gv=gv

