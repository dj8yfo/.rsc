# #************************************************#
# #                .zshrc                          #
# #               written by dj8yfo                #
# #                Month 11, 2384                  #
# #                                                #
# #           private bathtub babe .               #
# #************************************************#

source ~/.cargo/env
source /etc/profile.d/apps-bin-path.sh # https://askubuntu.com/questions/1006916/snaps-suddenly-missing-from-launcher-and-path
DISABLE_MAGIC_FUNCTIONS=true
export DISABLE_MAGIC_FUNCTIONS=true
# exports ---------------------------------------------- {{{
export DISABLE_AUTO_TITLE="true"
export KEYTIMEOUT=10
export PATH=$HOME/bin:/usr/local/bin:$HOME/Downloads/firefox:$PATH
export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_211
export TERM="xterm-256color"
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PIPENV_VENV_IN_PROJECT=1
export MANPAGER='nvim +Man!'
export CMUS_SOCKET=$HOME/.config/cmus/socket
export LSCOLORS=
export EDITOR='vim'
export GTAGSCONF=/usr/local/share/gtags/gtags.conf
export GTAGSLABEL=pygments
export POWERLINE_CONFIG_COMMAND=$(pyenv which powerline-config)
export MYPYPATH=$HOME/python/stubs
export ZSH_COLORIZE_STYLE='stata-dark'
export SCR_SAVE_FILE=$HOME/.scripts-run
export NETKIT_HOME=$HOME/Documents/code/netkit
export MANPATH=$MANPATH:$NETKIT_HOME/man
export PATH="$NETKIT_HOME/bin:$PATH"
export PATH=~/bin:$PATH
export PATH=/usr/local/texlive/2019/bin/x86_64-linux:$PATH
export TERMCMD=alacritty
# }}}


# pyenv && pipenv ---------------------------------- {{{
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
$HOME/.pyenv/versions/3.8.5/bin/powerline-daemon -q
source $HOME/.pyenv/versions/3.8.5/lib/python3.8/site-packages/powerline/bindings/zsh/powerline.zsh

eval "$(pipenv --completion)"
# }}}

# var functions --------------------------------- {{{
# Supports bold/underline/etc
# See https://stackoverflow.com/a/4233818/9782020
function man {
    eval "unbuffer man -P cat \"$@\" | $MANPAGER"
}

# No bold/underline/etc
function mann {
    eval "command man \"$@\" | $MANPAGER"
}

function echo_jupyter {
        echo /home/hypen9/.local/share/jupyter/runtime/ | xclip -sel clip -i
}

function mypushd {
	pushd "${@}" >/dev/null;
	dirs -v;
}

function mypopd {
	popd "${@}" >/dev/null;
	dirs -v;
}

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
		echo "example: prg 6301 3; prg 6301"
		return 2
	fi

	if [ -z "$2" ];
	then
		context=3
	else
		context="$2"
	fi
        echo ruser,sid,pgid,pid,tty,comm
	ps afx -o ruser,sid,pgid,pid,tty,comm| grep --color=always -C $context "$1"
}

function eman ()
{
	emacsclient -nw  -c -a "" -e "(progn (switch-to-buffer (man \"$1\")) (delete-other-windows))";
}

function rip {
	tempfile="$(mktemp -t tmp.XXXXXX)"
	ranger --choosedir="$tempfile" "${@:-$(pwd)}"
	test -f "$tempfile" &&
		if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
			cd -- "$(cat "$tempfile")"
		fi
		rm -f -- "$tempfile"
	}



function hs() { fc -lim "*$@*" 1 }

function addTextFromFile () {
	text_to_add=$(cat "$1")
	RBUFFER=${text_to_add}${RBUFFER}
}

funciton tmux_move_pane () {
	addTextFromFile $HOME/Documents/code/tasking/.tasknotes.d/snippets/move_curent_pane_jaunt.snip

}

function tmux_rename_pane () {
        pane_name=""
        vared pane_name
        tmux select-pane -T "${pane_name}"
}

function update_gtags () {
    local EXT
    if [ -n "$1" ];
    then
        EXT="$1"
    else
        EXT="py"
    fi
    find . -name "*.${EXT}" -type f -print > /tmp/list && gtags --accept-dotfiles -i -f /tmp/list
}

function edivim () {
    export EDITOR='vim'
}

function edinvim () {
    export EDITOR='nvim'
}

function edimacs () {
    export EDITOR='emacsclient -nw  -c -a ""'
}


zle -N tmux_move_pane
zsh $HOME/Documents/.conf/system_after_brick_wizard/resources/var-scripts/stat.sh
. $HOME/Documents/code/tasking/.tasknotes.d/snippets/turn_off_laptop_keyboard.sh
# turn_on_laptop_key
# turn_off_laptop_key
# }}}



# aliases ------------------------------------------ {{{
alias c='mypushd'
alias po='mypopd'
alias nv=neovide
alias ls='ls -ah --color  --group-directories-first'
alias et='emacsclient -nw  -c -a ""'
alias ec='emacsclient -c -a ""'
alias sudo='sudo '
alias ff='f -e fe'
alias notes='ff notes.org'
alias zmus='tmux attach-session -t cmus || tmux new-session -A -D -s cmus "$(which cmus) --listen $CMUS_SOCKET"'
alias scr='tmux source $HOME/Documents/.conf/tmux_project.conf'
alias pause='cmus-remote --server $HOME/.config/cmus/socket -u'
alias next='cmus-remote --server $HOME/.config/cmus/socket -n'
alias prev='cmus-remote --server $HOME/.config/cmus/socket -r'
unset TMUX
alias mutt='neomutt'
alias go='xdg-open'
alias histe='et $HISTFILE'
alias ra='ranger'
alias atq='atq | sort'
alias kiss='cvlc $HOME/Documents/code/KissFM.m3u'
alias xi='xclip -sel clip -i'
alias xo='xclip -sel clip -o'
alias sdcv='sdcv --color'
alias fired='$HOME/Documents/code/firefox-73.0b4/firefox/firefox'
alias vst="vim -c Gstatus -c 'let g:semshi#filetypes = []'"
alias wst="neovide -c Gstatus -c 'let g:semshi#filetypes = []'"
alias pya='. $(pipenv --venv)/bin/activate'
alias rmlogs='rm **/*.log'
alias nuke='tmux kill-session'
alias pyscopeupd='find "$PWD/" -name "*.py" -o -iname "*.cfg" > \
     cscope.files && cscope -bv -i cscope.files -f cscope.out'
alias ms='bash /usr/local/bin/menu-surfraw'
# }}}

# ZSH init ------------------------------------------------------------ {{{
ZSH_THEME=re5et
DISABLE_LS_COLORS="true"
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=1000


autoload -U edit-command-line
plugins=(colored-man-pages colorize fasd git vi-mode dircycle dirhistory zsh-completions colorize)
autoload -U compinit && compinit

eval "$(fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install)"
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# }}}


# prompt and colors ------------------------------------------- {{{
eval $(dircolors -b $HOME/.dircolors)
# wget https://raw.github.com/trapd00r/LS_COLORS/master/LS_COLORS -O $HOME/.dircolors
# echo 'eval $(dircolors -b $HOME/.dircolors)' >> $HOME/.bashrc

terminfo_down_sc=$terminfo[cud1]$terminfo[cuu1]$terminfo[sc]$terminfo[cud1]
source $HOME/Documents/.conf/system_after_brick_wizard/resources/var-scripts/spectrum.zsh
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

zle -N zle-keymap-select

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

# }}}


# fzf configuration ----------------------------- {{{
export FZF_DEFAULT_COMMAND='rg --files --follow --hidden --no-ignore'
export FZF_DEFAULT_OPTS='
  --color hl:#ffffff,hl+:#ff00ff,bg+:#333333
'
[ -f ~/.fzf.zsh ] && source $HOME/.fzf.zsh
source "$HOME/.fzf/shell/key-bindings.zsh"

export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
export FZF_CTRL_R_OPTS="--sort --exact --preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
export FZF_CTRL_T_OPTS="--preview '(bat --style=numbers --color=always {} || tree -C {}) 2> /dev/null | head -200'"

export FZF_CTRL_T_COMMAND='rg --files --follow --hidden --no-ignore '
function zapfzf_gui() {
        var=$(rg --files --follow --hidden --no-ignore | fzf --preview 'bat --style=numbers --color=always {} | head -200')
        if [ -n "$var" ]
        then
                if [ -n "$1" ]
                then
                        ec "$var" -c "$1" &
                else
                        ec "$var" &
                fi
        fi
}
function zapfzf() {
        var=$(rg --files --follow --hidden --no-ignore | fzf --preview 'bat --style=numbers --color=always {} | head -200')
        if [ -n "$var" ]
        then
                if [ -n "$1" ]
                then
			eval "$EDITOR \"$var\" -c \"$1\""
                else
                        eval "$EDITOR \"$var\""
                fi
        fi
}
function zapfzf_no_hidden() {
        var=$(rg --files --follow --no-ignore| fzf --preview 'bat --style=numbers --color=always {} | head -200')
        if [ -n "$var" ]
        then
                if [ -n "$1" ]
                then
                        vim "$var" -c "$1"
                else
                        vim "$var"
                fi
        fi
}

function zapfzf_git_modified() {
        var=$(git status --porcelain=v2 | awk '{print $9}' | fzf --preview 'bat --style=numbers --color=always {} | head -200')
        if [ -n "$var" ]
        then
                if [ -n "$1" ]
                then
                        vim "$var" -c "$1"
                else
                        vim "$var"
                fi
        fi
}
function rgv() {
        vim -q <(rg --hidden --vimgrep $*) -c 'copen' -c 'res 20'
}

# }}}

# bindings --------------------------------------- {{{
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
# multi_bind "\C-u" vi-kill-line - superseded by fzf history widget
multi_bind "\C-y" yank
multi_bind "\C-G" send-break
multi_bind "\ey" yank-pop
multi_bind "\ev" visual-mode
multi_bind "\ew" copy-region-as-kill
multi_bind '^[[1;6D' insert-cycledleft
multi_bind '^[[1;6C' insert-cycledright
multi_bind_str '\e!' 'nuke\C-j'
multi_bind_str '\e0' 'tmux\C-j'
multi_bind_str "\e;" '$()\C-b'
multi_bind_str "\er" 'rip\n'
multi_bind_str "\en" 'f -e vim '
#multi_bind_str "\C-t" 'hs '
multi_bind "\e." tmux_move_pane
bindkey -M vicmd "s" history-incremental-pattern-search-backward
multi_bind  '\C-r' history-incremental-pattern-search-backward
multi_bind  '\C-s' history-incremental-pattern-search-forward
bindkey -s -M vicmd "1" 'i!'
bindkey -r "^[h"

multi_bind '^T' fzf-file-widget
multi_bind '\ec' fzf-cd-widget
multi_bind '^U' fzf-history-widget

multi_bind_str "\ej" 'zapfzf \C-j'
multi_bind_str "\ew" 'zapfzf_gui \C-j'
multi_bind_str "\ez" 'zapfzf_no_hidden \C-j'
multi_bind_str "\e," 'zapfzf_git_modified Gdiffsplit\C-j'
multi_bind_str "\em" 'zapfzf_git_modified\C-j'
multi_bind_str "\ei" 'tsup \C-j'
multi_bind_str "\es" 'tmux_rename_pane\C-j'

toggle_bindings emacs

# }}}

. $HOME/Documents/.conf/tasking_funcs.zsh

[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export SDKMAN_DIR="$HOME/.sdkman"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# vim: foldmethod=marker
