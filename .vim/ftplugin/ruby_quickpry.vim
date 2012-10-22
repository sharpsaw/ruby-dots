" Add the pry debug line with \bp (or <Space>bp, if you did: map <Space> <Leader> )
map <Leader>bp orequire'pry';binding.pry<esc>:w<cr>
" Alias for one-handed operation:
map <Leader><Leader>p <Leader>bp
" …also, Insert Mode as bpry<space>
iabbr bpry require'pry';binding.pry

" Nab lines from ~/.pry_history (respects "count")
nmap <Leader>pry :<C-U>read !tail -<C-R>=(v:count1 ? v:count1 : 1)<CR> ~/.pry_history<CR>
" ↑ thanks to Houl, ZyX-i, and paradigm of #vim for all dogpiling on this one.
