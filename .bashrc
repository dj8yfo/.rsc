export PATH="$(pyenv root)/shims:/Library/Frameworks/Python.framework/Versions/2.7/bin/:/System/Library/Frameworks/Python.framework/Versions/2.7/bin:/Users/sysmanj/.cargo/bin:/usr/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin:/usr/local/MacGPG2/bin:$PATH"
export TERM="tmux-256color"
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export PATH="/Users/sysmanj/local/bin:/usr/local/sbin:$PATH"
export WORKON_HOME="/Users/sysmanj/Crystal/.env"
export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/src
export OPENSSL_INCLUDE_DIR=`brew --prefix openssl`/include
export OPENSSL_LIB_DIR=`brew --prefix openssl`/lib
export SNAPPY_LIB_DIR=/usr/local/lib
export ROCKSDB_LIB_DIR=/usr/local/lib
#export DEP_OPENSSL_INCLUDE=$(brew --prefix openssl)/include

##
# Your previous /Users/sysmanj/.bash_profile file was backed up as /Users/sysmanj/.bash_profile.macports-saved_2017-03-10_at_13:32:17
##

# MacPorts Installer addition on 2017-03-10_at_13:32:17: adding an appropriate PATH variable for use with MacPorts.
# Finished adapting your PATH environment variable for use with MacPorts.

# GIT_PROMPT_ONLY_IN_REPO=1
# source ~/.bash-git-prompt/gitprompt.sh

eval $(gdircolors -b $HOME/.dircolors)
alias emacsclient="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient"
alias vim=nvim
alias ls='/usr/local/bin/gls --color -h --group-directories-first'

export EDITOR="ec"

export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
