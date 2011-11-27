"###### Coloring ######
" set term=xterm
set t_Co=256
syntax on 
colorscheme wombat

"###### Standard vim options ######
filetype on
set nocompatible            " Don't emulate vi's limitations

" Identation
set tabstop=2               " 4 spaces for tabs
set shiftwidth=2            " 4 spaces for indents
set smarttab                " Tab next line based on current line
set expandtab               " Spaces for indentation
set autoindent              " Automatically indent next line
if has('smartindent')
   set smartindent          " Indent next line based on current line
endif
autocmd FileType python set ts=4 | set shiftwidth=4 | set expandtab |
  \ set autoindent | set softtabstop=4
autocmd FileType make set noexpandtab | set tabstop=4 | set shiftwidth=4
autocmd FileType text set tw=78

" kill any trailing whitespace on save
autocmd FileType c,cabal,cpp,haskell,javascript,php,python,readme,text
  \ autocmd BufWritePre <buffer>
  \ :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

set number                  " Show line numbers
set ruler                   " ruler on the bottom
set nobackup                " don't keep backup file
set showcmd                 " show (partial) command in status line
set showmatch               " show matching brackets
set matchtime=10            " time to flash the brack with show match 
set ignorecase              " do case insentive matching
set textwidth=0             " don't wrap words by default 
set textwidth=80            " wraps a line with a break when you reach 80 chars
set nowrap

" wrap the cursor to the previous/next line when reaching the beginning/end
set whichwrap+=<,>,h,l,[,]

" tab indents selection
vmap <silent> <Tab> >gv

" shift-tab unindents
vmap <silent> <S-Tab> <gv

"###### Title ######
"if has('title')
"   set title
"endif
"let &titleold=getcwd()
set notitle

" Display a pretty statusline if possible
set laststatus=2
set shortmess=atI
if has('statusline')
   set statusline=%<%f%m%r%h%w\ %=\ Line\ %l\/%L\ Col:\ %v\ (%P)
endif

" :W and :Q are annoying
"if has('user_commands')
"    command! -nargs=0 -bang Q q<bang>
"    command! -nargs=0 -bang W w<bang>
"    command! -nargs=0 -bang WQ wq<bang>
"    command! -nargs=0 -bang Wq wq<bang>
"endif

" ---- Spelling ----
if (v:version >= 700)
   set spelllang=en_us        " US English Spelling please

   " Toggle spellchecking with F10
   nmap <silent> <F10> :silent set spell!<CR>
   imap <silent> <F10> <C-O>:silent set spell!<CR>
endif

" Show trailing whitespace visually
" Shamelessly stolen from Ciaran McCreesh <ciaranm@gentoo.org>
if (&termencoding == "utf-8") || has("gui_running")
    if v:version >= 700
        set list listchars=tab:»·,trail:·,extends:…,nbsp:‗
    else
        set list listchars=tab:»·,trail:·,extends:…
    endif
else
    if v:version >= 700
        set list listchars=tab:>-,trail:.,extends:>,nbsp:_
    else
        set list
        listchars=tab:>-,trail:.,extends:>
    endif
endif

if has('mouse')
    " Dont copy the listchars when copying
    set mouse=nvi
endif

"###### Plugins ######
""" NERD TREE
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p

