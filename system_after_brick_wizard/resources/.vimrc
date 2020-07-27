function! ClipboardYank()
"https://github.com/neovim/neovim/issues/583#issuecomment-40942281
  call system('xclip -sel clip -i', @@)
endfunction
function! ClipboardPaste()
  let @@ = system('xclip -sel clip -o')
endfunction
vn   <silent> y y:call ClipboardYank()<cr>
vn   <silent> d d:call ClipboardYank()<cr>
nn   <silent> <leader>p :call ClipboardPaste()<cr>p
