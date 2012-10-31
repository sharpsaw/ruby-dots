" These are in functions to prevent messing up your /-history. (:h search-undo)
function! Ruby19Hashify()
  silent! s/:\(\S\+\)\s*=>\s*/\1: /g
endfunction
map <Leader>9 :call Ruby19Hashify()<cr>

function! SingleQuotify()
  silent! s/"/'/g
endfunction
map <Leader>' :call SingleQuotify()<cr>

function! DoubleQuotify()
  silent! s/'/"/g
endfunction
map <Leader>" :call DoubleQuotify()<cr>

function! WeHateSuperfluousParens()
  silent! s/(/ /g
  silent! s/)//g
endfunction
map <Leader>0 :call WeHateSuperfluousParens()<cr>

function! FlipOneLinerBlockToWordyOne()
  s/{\(\s*|[^|]\+|\)/do\1\r/
  call feedkeys("/\s*}\<cr>bbeelcf}\<cr>end\<esc>=%j$")
endfu
map <leader>{ :call FlipOneLinerBlockToWordyOne()<cr>
" TODO map <leader>} 