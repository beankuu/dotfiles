#=======================================
# zshrc CONFIGURATION
#=======================================
# Maintainer
# 	- beankuu@gmail.com

# vim as default editor
export EDITOR=vim
export VISUAL=vim

# pyenv
export PATH="$PATH:$HOME/.pyenv/bin"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
# golang
export GOPATH=$HOME/go
export PATH="$PATH:$GOPATH/bin"
# ruby
export PATH="$PATH:$HOME/.gem/ruby/2.6.0/bin"
# local paths
export PATH="$PATH:$HOME/.local/bin"


# ranger
# alias ranger = ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"

# zprezto
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
