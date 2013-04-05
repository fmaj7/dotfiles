#==============================================================================
# Customize to local environment
#==============================================================================

###### cd Hacks ######
#export CDPATH=/YOUR_1ST_DIR:/YOUR_2ND_DIR

#==============================================================================
# Global Settings
#==============================================================================

case $(uname -s) in
  Darwin)
    # MAC OS X specific setting
    export PATH=/usr/local/bin:$PATH:~/home/bin
  ;;
esac

# PYTHON
## virtualenvwrapper
export WORKON_HOME=~/.virtualenvs
[ -e /usr/local/bin/virtualenvwrapper.sh ] && source /usr/local/bin/virtualenvwrapper.sh

###### Git ######
export GIT_SSH=/usr/bin/ssh # Added for a HACK to make eclipse work with github
export GIT_PAGER="less"

###### history ######
export HISTSIZE=2000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups        # ignoring of duplicate history entries

###### Coloring ######
autoload -U colors && colors
#export LSCOLORS="Gxfxcxdxbxegedabagacad"
#export LSCOLORS='gxcxcxdxbxgegdabaeacad'
export LSCOLORS='exfxcxdxbxegedabagacad'
#LSCOLORS='di=34:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90'
#export LSCOLORS

# Enable ls colors
if [ "$DISABLE_LS_COLORS" != "true" ]
then
    # Find the option for using colors in ls, depending on the version:
    # Linux or BSD
    ls --color -d . &>/dev/null 2>&1 && alias ls='ls --color=auto' || alias ls='ls -G'
fi

###### other settings ######
setopt autocd                      # avoid typing of cd
setopt extendedglob                # extended globbing like cp ^*.(tar|bz2|gz)
setopt autopushd                   # auto pushd

###### correction ######
setopt correctall

###### completion ######
autoload -U compinit               # initialize advanced completion
compinit
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' menu select=1 _complete _ignored _approximate
zstyle -e ':completion:*:approximate:*' max-errors \
'reply=( $(( ($#PREFIX+$#SUFFIX)/2 )) numeric )'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*:processes' command 'ps -axw'
zstyle ':completion:*:processes-names' command 'ps -awxho command'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate
zstyle -e ':completion:*:approximate:*' max-errors \
'reply=( $(( ($#PREFIX+$#SUFFIX)/2 )) numeric )'
zstyle ':completion:*:expand:*' tag-order all-expansions

###### prompt ######
autoload -U promptinit             # initialize advanced prompt support
promptinit
# prompt off                       # prompt theme
export PS1="%I >> "              # customized theme
export RPROMPT="%~"
# %n The username
# %m The computer's hostname(truncated to the first period)
# %M The computer's hostname
# %l The current tty
# %? The return code of the last-run application.
# %# The prompt based on user privileges (# for root and % for the rest)Times
# %T System time(HH:MM)
# %* System time(HH:MM:SS)
# %D System date(YY-MM-DD)Directories
# %~ The current working directory. If you are in you are in your $HOME, this will be replaced by "~".
# %d The current working directory. For the options mentioned above: You can prefix an integer to show only certain parts of your working path. If you entered %1d and found yourself in /usr/bin it would show bin. This can also be done with negative integers: %-1d using the same directory as above would show /.Formatting
# %c current working directory
# %U [...] %u Begin and end underlined print
# %B [...] %b Begin and end bold print
# %{ [...] %} Begin and enter area that will not be printed. Useful for setting colors.


###### Aliases #####
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

#up alias
u () {
   set -A ud
   ud[1+${1-1}]=
   cd ${(j:..:/)ud}
}

##### Key Bindings ######
bindkey "\e[1~" beginning-of-line # Home
bindkey "\e[4~" end-of-line # End
bindkey "\e[5~" beginning-of-history # PageUp
bindkey "\e[6~" end-of-history # PageDown
bindkey "\e[2~" quoted-insert # Ins
bindkey "\e[3~" delete-char # Del
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
bindkey "\e[Z" reverse-menu-complete # Shift+Tab
# for rxvt
bindkey "\e[7~" beginning-of-line # Home
bindkey "\e[8~" end-of-line # End
# for non RH/Debian xterm, can't hurt for RH/Debian xterm
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
# for freebsd console
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line


