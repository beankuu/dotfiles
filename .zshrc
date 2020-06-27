#=======================================
# zshrc CONFIGURATION
#=======================================
# Maintainer
# 	- beankuu@gmail.com [https://github.com/beankuu/dotfiles]
# Inspired by
#   - 
#---------------------------------------
# Content
# 1. alias
# 2. exports
# 3. extra
#=======================================

# --------------------
# 1. Alias
# --------------------

# lock alias
alias lock="i3lock -c 000000"
# ranger
# alias ranger = ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"


# --------------------
# 2. exports
# --------------------

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
#ruby
export PATH="${HOME}/.gem/ruby/2.7.0/bin:$PATH"

# other local paths
export PATH="${HOME}/.local/bin:$PATH"


# --------------------
# 3. extra
# -------------------

# zprezto
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

