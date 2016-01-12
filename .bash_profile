# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

#### 環境変数設定 ####
# プロンプト表示
export PS1="\[\e[0;36m\][\u@\h \W]\[\e[m\]\$ "
export PATH=$HOME/.nodebrew/current/bin:$PATH

# 「Ctrl+s」の画面出力の停止を無効化
stty stop undef

# rbenv
eval "$(rbenv init -)"
