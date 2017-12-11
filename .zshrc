export PATH="/Users/sysmanj/bin:/Users/sysmanj/.cargo/bin:/usr/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin:/usr/local/MacGPG2/bin:$PATH"
export TERM="xterm-256color"
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export PATH="/Users/sysmanj/local/bin:/usr/local/sbin:$PATH"
export WORKON_HOME="/Users/sysmanj/Crystal/.env"
export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/src
export OPENSSL_INCLUDE_DIR=`brew --prefix openssl`/include
export OPENSSL_LIB_DIR=`brew --prefix openssl`/lib
export SNAPPY_LIB_DIR=/usr/local/lib
export ROCKSDB_LIB_DIR=/usr/local/lib
export PYTHONPATH="/Users/sysmanj/Crystal/cb-backend"

export PATH="/Users/sysmanj/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

#export DEP_OPENSSL_INCLUDE=$(brew --prefix openssl)/include
# MacPorts Installer addition on 2017-03-10_at_13:32:17: adding an appropriate PATH variable for use with MacPorts.
# Finished adapting your PATH environment variable for use with MacPorts.

# GIT_PROMPT_ONLY_IN_REPO=1
# source ~/.bash-git-prompt/gitprompt.sh

eval $(gdircolors -b $HOME/.dircolors)
alias emacsclient="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient"
alias vim=nvim

function mypushd {
	pushd "${@}" >/dev/null;
	dirs -v;
}

function mypopd {
	popd "${@}" >/dev/null;
	dirs -v;
}

alias d='dirs -v'
alias c='mypushd'
alias o='mypopd'

alias ls='/usr/local/bin/gls --color -h --group-directories-first'

export EDITOR="vim"

export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
mypushd ~/Crystal/cb-backend
mypushd ~/.config/nvim
mypushd ~/.emacs.d/local-configs
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v

autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line
PS1='%m %1d$ '
