# bash header placeholder
# #************************************************#
# #                .zshrc                          #
# #               written by dj8yfo                #
# #                Month 11, 2384                  #
# #                                                #
# #           private bathtub babe .               #
# #************************************************#
source ~/.xinitrc
# If you come from bash you might have to change your $PATH.
export KEYTIMEOUT=20
export PATH=$HOME/bin:/usr/local/bin:$HOME/Downloads/firefox:$PATH
export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_211
autoload -U edit-command-line
PS1='%m %1d$ '
#NETKIT_HOME Path to your oh-my-zsh installation.

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME=re5et

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hypen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export TERM="xterm-256color"

export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PIPENV_VENV_IN_PROJECT=1


# GIT_PROMPT_ONLY_IN_REPO=1
# source ~/.bash-git-prompt/gitprompt.sh

alias vim=nvim
export MANPAGER="/bin/sh -c \"unset MANPAGER;col -b -x | nvim -c 'set ft=man nomod nolist'\""

function mypushd {
	pushd "${@}" >/dev/null;
	dirs -v;
}

function mypopd {
	popd "${@}" >/dev/null;
	dirs -v;
}

# alias d='dirs -v'
# alias c='mypushd'
# alias o='mypopd'
alias ls='ls -ah --color  --group-directories-first'
alias et='emacsclient -nw  -c -a ""'
alias ec='emacsclient -c -a ""'
alias sudo='sudo '
alias ff='f -e fe'
alias notes='ff notes.org'
alias webnotes='firefox $HOME/Documents/code/tasking/notes-html/notes.html'
export CMUS_SOCKET=$HOME/.config/cmus/socket
export LSCOLORS=
alias zmus='tmux attach-session -t cmus || tmux new-session -A -D -s cmus "$(which cmus) --listen $CMUS_SOCKET"'
alias pause='cmus-remote --server $HOME/.config/cmus/socket -u'
alias next='cmus-remote --server $HOME/.config/cmus/socket -n'
alias prev='cmus-remote --server $HOME/.config/cmus/socket -r'
unset TMUX
alias mutt='neomutt'
alias pull_notes='cd $HOME/Documents/code/tasking && ./pullscript.sh'
alias go='xdg-open'
alias histe='nvim $HISTFILE'
alias ra='ranger'
alias atq='atq | sort'
alias t='task'
alias to='taskopen -A'
alias ta='task attach'
alias active='task +ACTIVE'
book=4e09bbe4-eff4-4ae2-bd1e-2c82394be509
alias buzz='task +alarm'
alias abst='task context abstract'
alias phony='task context background'
alias real='task context none'
alias tsum='timew summary'
alias kiss='cvlc $HOME/Documents/code/KissFM.m3u'
alias xi='xclip -sel clip -i'
alias xo='xclip -sel clip -o'
function launch ()
{
	cd $HOME/Documents/code/tasking
	find .tasknotes.d/snippets -type f -exec chmod 400 {} \;
	gitpush
	
}
function te ()
{
	task "$*" edit
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

#export EDITOR='emacsclient -nw  -c -a ""'
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
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
zsh $HOME/Documents/.conf/var-scripts/stat.sh
export SCR_SAVE_FILE=$HOME/.scripts-run
eval $(dircolors -b $HOME/.dircolors)
# wget https://raw.github.com/trapd00r/LS_COLORS/master/LS_COLORS -O $HOME/.dircolors
# echo 'eval $(dircolors -b $HOME/.dircolors)' >> $HOME/.bashrc

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
			zle-line-init() { zle -K vicmd; } 
			;;

		"emacs" )

			echo -e "\n---------"
			echo "emacs bindings"
			bindkey -e
			zle-line-init() { zle -K viins; } 
			;;

		* )
			echo "no valid variant chosen"
			return $EX_USAGE
			;;
	esac 
	zle -N zle-line-init
	zle send-break
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
function dance(){
	bf=/home/hypen9/Documents/code/tasking/.tasknotes.d/2896ed34-be60-4650-84b8-f7240ad6e871.txt
	logf=$HOME/.dance-log
	ue=$(sed '1q;d' $bf)
	na=$(sed '2q;d' $bf)
	de=$(sed '3q;d' $bf)
	sp=$(sed '4q;d' $bf)
	ra=$(sed '5q;d' $bf)

	tot=$(echo "scale=3; $ue*$ra+$na-$de" | bc)
	echo "----------" | tee -a $logf | cat -
	echo "totals: $tot" | tee -a $logf | cat -
	le=$(echo "scale=3; $tot/$sp*30" | bc)
	echo "days: $le" | tee -a $logf | cat -
	cu=$(date -u '+%F %T')
	cur=$(date -u '+%F %T.%N %Z')
	echo $cu | tee -a $logf | cat -
	ro=$(echo "($le+0.5)/1" | bc)
	ne=$(date -d"$cur +$ro days" '+%F %T');
	echo | tee -a $logf | cat -
	echo "eow: $ne" | tee -a $logf | cat -
	echo -e "----------\n" | tee -a $logf | cat -

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

multi_bind_str "\er" 'rip\n'

function hs() { fc -lim "*$@*" 1 }

multi_bind_str "\en" 'f -e nvim '
multi_bind_str "\C-t" 'hs '
bindkey -s -M vicmd "1" 'i!'
bindkey -M vicmd "s" vi-history-search-backward 
multi_bind_str "\el" '$()\C-b'


function addTextFromFile () {
	text_to_add=$(cat "$1")
	RBUFFER=${text_to_add}${RBUFFER}
}
funciton addtt () {
	addTextFromFile /home/hypen9/Documents/code/tasking/.tasknotes.d/snippets/tt.snip
}
zle -N addtt
multi_bind '\et' addtt
