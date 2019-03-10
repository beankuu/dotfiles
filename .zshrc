# ZSHRC CONFIGURATION
# Maintainer
# 	- beankuu@gmail.com

# zprezto
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# golang
export GOPATH=$HOME/go
export PATH="$GOPATH/bin:$PATH"

# ruby
export PATH="$HOME/.gem/ruby/2.6.0/bin:$PATH"

# some local paths
export PATH=$PATH:$HOME/.local/bin


# ranger
# alias ranger = ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"



