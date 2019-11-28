#=======================================
# zshrc CONFIGURATION
#=======================================
# Maintainer
# 	- beankuu@gmail.com

# vim as default editor
export EDITOR=vim
export VISUAL=vim

# pyenv
#export PATH="$PATH:$HOME/.pyenv/bin"
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"

# local golang
GOPATH="${HOME}/go"
export PATH="${GOPATH}/bin:$PATH"
# local ruby
export PATH="${HOME}/.gem/ruby/2.6.0/bin:$PATH"
# local npm
NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$NPM_PACKAGES/bin:$PATH"
unset MANPATH
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
# other local paths
export PATH="${HOME}/.local/bin:$PATH"


# ranger
# alias ranger = ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"

# zprezto
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# lock alias
alias lock="i3lock -c 000000"

