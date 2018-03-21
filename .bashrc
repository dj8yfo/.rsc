export TERM="xterm-256color"

export PATH="/home/sysmanj/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

set -o vi

#eval $(gdircolors -b $HOME/.dircolors)
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

alias ls='ls --color -h --group-directories-first'

export EDITOR="nvim"
