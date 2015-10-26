# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

#### 環境変数設定 ####

#### エイリアス設定 ####
alias ll='ls -lah'
alias lll='ll | less'
alias sc='screen'

#### オプション設定 ####
# 補完時に大文字小文字の違いを無視
set completion-ignore-case on

# C-wで「/」を削除しないようにする
# stty werase undef
# bind '"\C-w": unix-filename-rubout'
