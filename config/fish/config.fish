# function fish_prompt
#   powerline-shell --shell bare $status
# end

starship init fish | source

function fish_right_prompt
#intentionally left blank
end

# pyenv shim and auto completion
if command -v pyenv 1>/dev/null 2>&1
  pyenv init - | source
end

set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

# Compass specific
set -g fish_user_paths "/Users/guanghao.ding/development/urbancompass/build-support/go/bin" $fish_user_paths