#==============================================================================
# Customize to local environment
#==============================================================================
###### cd Hacks ######
#export CDPATH=/YOUR_1ST_DIR:/YOUR_2ND_DIR
export PATH="~/home/bin:$PATH"


#==============================================================================
# Global Settings
#==============================================================================

case $(uname -s) in
  Darwin)
    # MAC OS X specific setting
    export PATH=/usr/local/opt/ruby/bin:/usr/local/bin:$PATH:~/home/bin
  ;;
esac

# ROR
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

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

###### other settings ######
setopt autocd                      # avoid typing of cd
setopt extendedglob                # extended globbing like cp ^*.(tar|bz2|gz)
setopt autopushd                   # auto pushd

###### correction ######
setopt correctall

###### Aliases #####
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

###### Functions ######

#up alias
u () {
   set -A ud
   ud[1+${1-1}]=
   cd ${(j:..:/)ud}
}

# Quick way to navigate between commonly used directories
export MARKPATH=$HOME/.marks
function jump { 
    cd -P "$MARKPATH/$1" 2>/dev/null || echo "no such mark: $1"
}
function mark { 
    if (( $# == 0 )); then
        MARK=$(basename "$(pwd)")
    else
        MARK="$1"
    fi
    if read -q \?"mark $(pwd) as ${MARK}? (y/n) "; then
        mkdir -p "$MARKPATH"; ln –s "$(pwd)" "$MARKPATH/$MARK"
    fi
}
function unmark { 
    rm -i "$MARKPATH/$1"
}
function marks {
    ls -l "$MARKPATH" | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
}

function copyScript {
  find -name "*.R" | tar -cT - -f - | tar -C "$2" -xf -
}

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/fmaj7/.gvm/bin/gvm-init.sh" ]] && source "/Users/fmaj7/.gvm/bin/gvm-init.sh"
