# .zshrc

# User specific aliases and functions
alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -lah'
alias vi=vim
alias lll='ll | less'
alias sc='screen'
alias grep='grep --color=auto'

HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=100000
HISTTIMEFORMAT='%Y/%m/%d %H:%M:%S '
setopt share_history

# 「Ctrl+s」の画面出力の停止を無効化
stty stop undef

export HISTCONTROL=ignoredups 

# rbenvを有効化
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export LD_LIBRARY_PATH="/usr/local/lib"

# Postgres9.3のパス指定
export PATH=${PATH}:/usr/pgsql-9.3/bin

# gitのブランチをプロンプトにカラー表示
source ~/.zsh_branchcolor

export PATH=$PATH:/home/developer/bin

export PATH=$PATH:/home/developer/download/jdk1.8.0/bin
export JAVA_HOME=/home/developer/download/jdk1.8.0

export RHINO_HOME=/home/developer/download/rhino1_7R2
export PATH=$PATH:/home/developer/download/rhino1_7R2

export PGDATA=/var/lib/pgsql/9.3/data

# 単語区切り文字を再設定(「/」を削除)
export WORDCHARS='*?_.[]~-=&;!#$%^(){}<>' 

alias cdretio="cd /home/developer/work/retio_v3_src/Project/DEV/Ru/C/UNIX"
