" This .vimrc file should be placed in your home directory
" The Terminal app supports (at least) 16 colors
" So you can have the eight dark colors and the eight light colors
" the plain colors, using these settings, are the same as the light ones
" NOTE: You will need to replace ^[ with a raw Escape character, which you
" can type by typing Ctrl-V and then (after releaseing Ctrl-V) the Escape key.

if has("terminfo")
  set t_Co=16
  set t_AB=[%?%p1%{8}%<%t%p1%{40}%+%e%p1%{92}%+%;%dm
  set t_AF=[%?%p1%{8}%<%t%p1%{30}%+%e%p1%{82}%+%;%dm
else
  set t_Co=16
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

colorscheme wombat
