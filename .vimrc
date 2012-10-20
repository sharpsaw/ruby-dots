" Depends on the Vim Addon Manager (which comes with sharpsaw/loop-dots )
let s:want = [
      \'github:tpope/vim-rails',
      \'github:tpope/vim-bundler',
      \'textobj-user',
      \'textobj-rubyblock',
      \]
call vam#ActivateAddons(s:want, {'auto_install' : 1})
