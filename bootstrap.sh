#!/usr/env/bash

# From https://brew.sh/
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# To add cask into brew
brew cask

brew install iterm2
brew install alfred
brew install fish
brew install starship
# nerd font required by starship
brew install homebrew/cask-fonts/font-jetbrains-mono-nerd-font

brew install visual-studio-code
brew install jetbrains-toolbox
# App store install moom

brew install maven
# [Optionally]
# sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk