# #************************************************#
# #                .zshrc                          #
# #               written by dj8yfo                #
# #                Month 11, 2384                  #
# #                                                #
# #           private bathtub babe .               #
# #************************************************#
source ~/.xinitrc
export KEYTIMEOUT=20
export PATH=$HOME/bin:/usr/local/bin:$HOME/Downloads/firefox:$PATH
export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_211
autoload -U edit-command-line
PS1='%m %1d$ '
ZSH_THEME=re5et

DISABLE_LS_COLORS="true"

export TERM="xterm-256color"

export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PIPENV_VENV_IN_PROJECT=1


# GIT_PROMPT_ONLY_IN_REPO=1
# source ~/.bash-git-prompt/gitprompt.sh

alias vim=nvim
export MANPAGER='nvim +Man!'

# Supports bold/underline/etc
# See https://stackoverflow.com/a/4233818/9782020
function man {
    eval "unbuffer man -P cat \"$@\" | $MANPAGER"
}

# No bold/underline/etc
function mann {
    eval "command man \"$@\" | $MANPAGER"
}

function mypushd {
	pushd "${@}" >/dev/null;
	dirs -v;
}

function mypopd {
	popd "${@}" >/dev/null;
	dirs -v;
}

alias ls='ls -ah --color  --group-directories-first'
alias et='emacsclient -nw  -c -a ""'
alias ec='emacsclient -c -a ""'
alias sudo='sudo '
alias ff='f -e fe'
alias notes='ff notes.org'
export CMUS_SOCKET=$HOME/.config/cmus/socket
export LSCOLORS=
alias zmus='tmux attach-session -t cmus || tmux new-session -A -D -s cmus "$(which cmus) --listen $CMUS_SOCKET"'
alias pause='cmus-remote --server $HOME/.config/cmus/socket -u'
alias next='cmus-remote --server $HOME/.config/cmus/socket -n'
alias prev='cmus-remote --server $HOME/.config/cmus/socket -r'
unset TMUX
alias mutt='neomutt'
alias go='xdg-open'
alias histe='nvim $HISTFILE'
alias ra='ranger'
alias atq='atq | sort'
alias kiss='cvlc $HOME/Documents/code/KissFM.m3u'
alias xi='xclip -sel clip -i'
alias xo='xclip -sel clip -o'
alias sdcv='sdcv --color'

function poptask ()
{
	atrm $(atq | sort -k1 -rn | sed -n 1p | awk '{print $1}')
}

function prip ()
{
	if [ -z "$1" ]; then
		echo "example: prip 6301 3; prip 6301"
		return 2
	fi

	if [ -z "$2" ];
	then
		context=3
	else
		context="$2"
	fi
	ps afux | grep --color=always -C $context "$1"
}

function prg ()
{
	if [ -z "$1" ]; then
		echo "example: prip 6301 3; prip 6301"
		return 2
	fi

	if [ -z "$2" ];
	then
		context=3
	else
		context="$2"
	fi
	ps afx -o ruser,pid,comm | grep --color=always -C $context "$1"
}

export EDITOR='nvim'
function eman ()
{
	emacsclient -nw  -c -a "" -e "(progn (switch-to-buffer (man \"$1\")) (delete-other-windows))";
}

export GTAGSCONF=/usr/local/share/gtags/gtags.conf
export GTAGSLABEL=pygments

HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=1000


$HOME/.pyenv/versions/3.8.0b4/bin/powerline-daemon -q
export POWERLINE_CONFIG_COMMAND=$(pyenv which powerline-config)
source $HOME/.pyenv/versions/3.8.0b4/lib/python3.8/site-packages/powerline/bindings/zsh/powerline.zsh
export MYPYPATH=$HOME/python/stubs
export ZSH_COLORIZE_STYLE='stata-dark'
plugins=(colored-man-pages colorize fasd git vi-mode dircycle zsh-completions colorize)
autoload -U compinit && compinit
eval "$(pipenv --completion)"

eval "$(fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install)"

export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

export NETKIT_HOME=$HOME/Documents/code/netkit
export MANPATH=:$NETKIT_HOME/man
export PATH="$NETKIT_HOME/bin:$PATH"
export PATH=~/bin:$PATH
export PATH=/usr/local/texlive/2019/bin/x86_64-linux:$PATH

export ANDROID_SDK_ROOT=$HOME/Android/Sdk
eval $(dircolors -b $HOME/.dircolors)
# wget https://raw.github.com/trapd00r/LS_COLORS/master/LS_COLORS -O $HOME/.dircolors
# echo 'eval $(dircolors -b $HOME/.dircolors)' >> $HOME/.bashrc

terminfo_down_sc=$terminfo[cud1]$terminfo[cuu1]$terminfo[sc]$terminfo[cud1]
source $HOME/Documents/.conf/var-scripts/spectrum.zsh
function insert-mode () { echo -e "%{$FG[196]%}-- INSERT --%{$reset_color%}" }
function normal-mode () { echo -e "%{$FG[118]%}-- NORMAL --%{$reset_color%}" }

precmd () {
    print -rP "
[%D{%F %T}] %n %{$fg[blue]%}%m%{$reset_color%}"

    PS1="%{$terminfo_down_sc$(normal-mode)$terminfo[rc]%}%~ $ "
}

function set-prompt () {
    case ${KEYMAP} in
      (vicmd)      VI_MODE="$(normal-mode)" ;;
      (main|viins) VI_MODE="$(insert-mode)" ;;
      (*)          VI_MODE="$(insert-mode)" ;;
    esac
    PS1="%{$terminfo_down_sc$VI_MODE$terminfo[rc]%}%{$FG[051]%}%~%{$reset_color%} $ "
}

function zle-keymap-select {
    set-prompt
    zle reset-prompt
}
function toggle_bindings()
{

	EX_USAGE=64
	local target_mode
	if [ -n "$1" ];
	then
		target_mode="$1"
	else
		if bindkey -lL main | grep emacs >& /dev/null;
		then
			target_mode="vi"
		else
			target_mode="emacs"
		fi
	fi
	echo $target_mode
	case "$target_mode" in
		"vi" )
			echo -e "\n---------"
			echo "vim bindings (emacs like in insert mode) with command mode default "
			bindkey -v
			# https://unix.stackexchange.com/questions/438307/zsh-start-new-prompt-in-command-mode-vi-mode
			zle-line-init() {
				zle -K vicmd;
				set-prompt
				zle reset-prompt
			}
			;;

		"emacs" )

			echo -e "\n---------"
			echo "emacs bindings"
			bindkey -e
			zle-line-init() {
				zle -K viins;
				set-prompt
				zle reset-prompt
			}
			;;

		* )
			echo "no valid variant chosen"
			return $EX_USAGE
			;;
	esac
	zle -N zle-line-init
	if [ -z "$1" ];
	then
		zle send-break
	fi
}

zle -N toggle_bindings
zle -N zle-keymap-select


function multi_bind()
{
	bindkey -M emacs $*
	bindkey -M viins $*
	bindkey -M vicmd $*
}
function multi_bind_str()
{
	bindkey -s -M emacs "$1" "$2"
	bindkey -s -M viins "$1" "$2"
	bindkey -s -M vicmd "$1" "i$2"
}
multi_bind "\e'" toggle_bindings

multi_bind  '\C-r' history-incremental-pattern-search-backward
multi_bind  '\C-s' history-incremental-pattern-search-forward

multi_bind "\e/" where-is
bindkey -M viins "\C-p" history-beginning-search-backward
bindkey -M vicmd "\C-p" history-beginning-search-backward
bindkey -M viins "\C-n" history-beginning-search-forward
bindkey -M vicmd "\C-n" history-beginning-search-forward
multi_bind "\eb" backward-word
multi_bind "\ef" forward-word
multi_bind "\ed" kill-word
multi_bind "\C-w" backward-kill-word
multi_bind "\C-_" undo
multi_bind "\C-h" backward-delete-char
multi_bind "\C-d" delete-char-or-list
multi_bind "\C-b" backward-char
multi_bind "\C-f" forward-char
multi_bind "\C-a" beginning-of-line
multi_bind "\C-e" end-of-line
multi_bind "\C-k" kill-line
multi_bind "\C-u" vi-kill-line
multi_bind "\C-y" yank
multi_bind "\C-G" send-break
multi_bind "\ey" yank-pop
multi_bind "\ev" visual-mode
multi_bind "\ew" copy-region-as-kill
multi_bind '^[[1;6D' insert-cycledleft
multi_bind '^[[1;6C' insert-cycledright
#dircycle bindings for urxvt

toggle_bindings vi

function rip {
	tempfile="$(mktemp -t tmp.XXXXXX)"
	ranger --choosedir="$tempfile" "${@:-$(pwd)}"
	test -f "$tempfile" &&
		if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
			cd -- "$(cat "$tempfile")"
		fi
		rm -f -- "$tempfile"
	}

multi_bind_str "\er" 'rip\n'

function hs() { fc -lim "*$@*" 1 }

multi_bind_str "\en" 'f -e nvim '
multi_bind_str "\C-t" 'hs '
bindkey -s -M vicmd "1" 'i!'
bindkey -M vicmd "s" history-incremental-pattern-search-backward
multi_bind_str "\e;" '$()\C-b'

function addTextFromFile () {
	text_to_add=$(cat "$1")
	RBUFFER=${text_to_add}${RBUFFER}
}
funciton tmux_move_pane () {
	addTextFromFile $HOME/Documents/code/tasking/.tasknotes.d/snippets/move_curent_pane_jaunt.snip

}
zle -N tmux_move_pane 
multi_bind "\e." tmux_move_pane 

zsh $HOME/Documents/.conf/var-scripts/stat.sh
export SCR_SAVE_FILE=$HOME/.scripts-run
alias pya='source ./.venv/bin/activate'
. $HOME/Documents/code/tasking/.tasknotes.d/snippets/turn_off_laptop_keyboard.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
multi_bind_str "\ej" 'vim **\C-i' # zap sh** by needlecast
 

function multicolor () {
	local cmd_str=''
	multicfg="$1"
	linesmax="$(wc -l $multicfg | awk '{print $1}')"
	i=1
	while read color_co word_match;
	do
		local template_str="GREP_COLORS=\"$color_co\" grep -E --color=always -e \"^\" -e \"$word_match\""
		cmd_str="$cmd_str$template_str"
		if [[ $i != $linesmax ]];
		then
			cmd_str="$cmd_str | "
		fi
		((i++))

	done < $multicfg
	echo $cmd_str 1>&2 
	eval "$cmd_str"
}
. $HOME/Documents/.conf/tasking_funcs.zsh
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export SDKMAN_DIR="$HOME/.sdkman"
