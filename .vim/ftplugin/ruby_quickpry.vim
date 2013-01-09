" Add the pry debug line with \bp (or <Space>bp, if you did: map <Space> <Leader> )
map <Leader>bp orequire'pry';binding.pry<esc>:w<cr>
" Alias for one-handed operation:
map <Leader><Leader>p <Leader>bp
" …also, Insert Mode as bpry<space>
iabbr bpry require'pry';binding.pry

" Keep pry from annoyingly hanging around when using, e.g. pry-rescue/minitest
map <f3> :wa<cr>:call system('kill-pry-rescue')<cr>

" Nab lines from ~/.pry_history (respects "count")
nmap <Leader>pry :<c-u>let pc = (v:count1 ? v:count1 : 1)<cr>:read !tail -<c-r>=pc<cr> ~/.pry_history<cr>:.-<c-r>=pc-1<cr>:norm <c-r>=pc<cr>==<cr>
nmap <Leader>ph <Leader>pry
" ↑ thanks to Houl, ZyX-i, and paradigm of #vim for all dogpiling on this one.

nmap <Leader>rib of = File.open ENV['HOME']+'/ribson', 'w'; set_trace_func -> *args { f.puts [args, args[4].send(:local_variables) ].inspect }<esc>:w<cr>
