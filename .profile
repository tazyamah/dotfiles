export CLICOLOR=1
export EDITOR=vim
export HOMEBREW_PATH=$HOME/homebrew


# for mac
if [ `uname` = "Darwin" ]; then
    export PATH=$HOMEBREW_PATH/bin:$PATH
    export HOMEBREW_NO_EMOJI=i_hate_emoji

    # bash completion
    BASH_COMPLETION=`brew --prefix`/etc/bash_completion
    BASH_COMPLETION_DIR=`brew --prefix`/etc/bash_completion.d
    BASH_COMPLETION_COMPAT_DIR=`brew --prefix`/etc/bash_completion.d
    if [ -f `brew --prefix`/etc/bash_completion ]; then
        . `brew --prefix`/etc/bash_completion
    fi

    # enable z command
    [[ -r `brew --prefix`/etc/profile.d/z.sh ]] && . `brew --prefix`/etc/profile.d/z.sh

    alias scalc='/Applications/LibreOffice.app/Contents/MacOS/scalc'
    alias titanium="$HOME/Library/Application\ Support/Titanium/mobilesdk/osx/3.0.0.v20121105141612/titanium.py"

    export CC=gcc-4.2
    #export LDFLAGS=-L/Users/tazyamah/homebrew/opt/sqlite/lib
    #export CPPFLAGS-I/Users/tazyamah/homebrew/opt/sqlite/include

    # for postgresql
    export ARCHFLAGS="-arch x86_64"
    alias pgserver_start='pg_ctl -D $HOME/homebrew/var/postgres -l $HOME/homebrew/var/postgres/server.log start'
    alias pgserver_stop='pg_ctl -D $HOME/homebrew/var/postgres stop -s -m fast'

# for linux(vm)
elif [`uname` = "Linux"]; then
    if [ -f ~/.phpenv/bin/phpenv ]; then
        . /etc/bash_completion.d/git
    fi
fi



# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"    # This loads RVM into a shell session.
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion # rvm shell completion

# sharing history
function share_history {        # 以下の内容を関数として定義
    history -a                  # .bash_historyに前回コマンドを1行追記
    history -c                  # 端末ローカルの履歴を一旦消去
    history -r                  # .bash_historyから履歴を読み込み直す
}
PROMPT_COMMAND='share_history'  # 上記関数をプロンプト毎に自動実施
shopt -u histappend             # .bash_history追記モードは不要なのでOFFに
export HISTSIZE=9999            # 履歴のMAX保存数を指定

# phpenv
if [ -f ~/.phpenv/bin/phpenv ]; then
    export PATH="$PATH:~/.phpenv/bin"
    eval "$(phpenv init -)"
fi


# other aliases
alias :e=vim

# prompt
#RPROMPT_CONTENTS="$(~/.rvm/bin/rvm-prompt)"
#RPROMPT='\[\e[$[COLUMNS-$(echo ${RPROMPT_CONTENTS} | wc -c)]C\e[1;35m${RPROMPT_CONTENTS}\e[0m\e[$[COLUMNS]D\]'
PS1=\\u:\\W\$

function a()
{
  fullpath=`pwd`
  paths=( `echo $fullpath | tr -s '/', ' '` )
  hist=
  for dir in ${paths[@]};do
    hist="$hist/$dir"
    if [ -f $hist/.env ]; then
      echo $hist/.env
      source $hist/.env
    else
      echo $hist/.env
    fi
  done
}
