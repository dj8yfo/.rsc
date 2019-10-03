source ~/.xinitrc
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/Downloads/firefox:$PATH
export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_211
autoload -U edit-command-line
PS1='%m %1d$ '
#NETKIT_HOME Path to your oh-my-zsh installation.

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME=half-life

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
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


# GIT_PROMPT_ONLY_IN_REPO=1
# source ~/.bash-git-prompt/gitprompt.sh

alias vim=nvim

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
export CMUS_SOCKET=$HOME/.config/cmus/socket
export LSCOLORS=
alias zmus='tmux attach-session -t cmus || tmux new-session -A -D -s cmus "$(which cmus) --listen $CMUS_SOCKET"'
alias pause='cmus-remote --server $HOME/.config/cmus/socket -u'
unset TMUX
alias mutt='neomutt'
alias notes='firefox $HOME/Documents/code/tasking/notes-html/notes.html'
alias push_notes='cd $HOME/Documents/code/tasking && ./script.sh'
alias pull_notes='cd $HOME/Documents/code/tasking && ./pullscript.sh'
alias go='xdg-open'
alias histe='et $HISTFILE'
alias ra='ranger'

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


$HOME/.pyenv/versions/3.6.4/bin/powerline-daemon -q
export POWERLINE_CONFIG_COMMAND=$(pyenv which powerline-config)
source $HOME/.pyenv/versions/3.6.4/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh
plugins=(colored-man-pages colorize fasd git vi-mode dircycle zsh-completions)
autoload -U compinit && compinit

eval "$(fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install)"

export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
bindkey '^R' history-incremental-search-backward

export NETKIT_HOME=$HOME/Documents/code/netkit
export MANPATH=:$NETKIT_HOME/man
export PATH="$NETKIT_HOME/bin:$PATH"
export PATH=~/bin:$PATH
export PATH=/usr/local/texlive/2019/bin/x86_64-linux:$PATH

export ANDROID_SDK_ROOT=$HOME/Android/Sdk
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
zsh $HOME/Documents/.conf/stat.sh

eval $(dircolors -b $HOME/.dircolors)
# wget https://raw.github.com/trapd00r/LS_COLORS/master/LS_COLORS -O $HOME/.dircolors
# echo 'eval $(dircolors -b $HOME/.dircolors)' >> $HOME/.bashrc

bindkey '^[[1;2D' insert-cycledleft
bindkey '^[[1;2C' insert-cycledright
#dircycle bindings for urxvt
