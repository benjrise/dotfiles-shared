
set clipboard=unnamed
imap jj <Esc>

" Move up and down at start of each line
nmap <C-k> -
nnoremap <C-J> <C-M>

" Move up and down by half page
nnoremap <s-J> <C-D>zz
nnoremap <s-k> <C-U>zz

" Add the below line to current line
nnoremap <s-U> <s-J>

" Change increment bindings not working
:nnoremap <A-a> <C-a>
:nnoremap <A-x> <C-x>

" H and L for moving to beginning and end of line
nmap H ^
nmap L $
vmap H ^
vmap L $

" Not working as expected atm
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
vnoremap <leader>p "_dP
