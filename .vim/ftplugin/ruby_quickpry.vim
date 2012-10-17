" Add the pry debug line with \\p (or <Space><Space>p, if you mapped it)
map <Leader><Leader>p orequire 'pry';binding.pry<esc>:w<cr>
" …also, allow bpry<space> (or bpry<C-]>) from Insert Mode:
iabbr bpry require 'pry';binding.pry

" Nab the last line from ~/.pry_history.
map <leader>pry1 o<esc>:.!tail -1 ~/.pry_history<cr>==
