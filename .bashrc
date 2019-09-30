export TERM="xterm-256color"

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

set -o vi

HISTSIZE=100000
SAVEHIST=1000
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

alias ls='ls -lah --color  --group-directories-first'
alias et='emacsclient -nw  -c -a ""'
alias ec='emacsclient -c -a ""'
alias sudo='sudo '
alias ls='ls --color -h --group-directories-first'
alias histe='et $HISTFILE'

export EDITOR='emacsclient -nw  -c -a ""'
eval $(dircolors -b $HOME/.dircolors)
# wget https://raw.github.com/trapd00r/LS_COLORS/master/LS_COLORS -O $HOME/.dircolors
# echo 'eval $(dircolors -b $HOME/.dircolors)' >> $HOME/.bashrc
