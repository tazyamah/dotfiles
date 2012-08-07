export CLICOLOR=1
export EDITOR=vim
export PATH=/usr/local/bin:$PATH
PS1=\\u:\\W$


# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.


# for postgresql
export ARCHFLAGS="-arch x86_64"
alias pgserver_start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgserver_stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

# sharing history
function share_history {        # 以下の内容を関数として定義
    history -a                  # .bash_historyに前回コマンドを1行追記
    history -c                  # 端末ローカルの履歴を一旦消去
    history -r                  # .bash_historyから履歴を読み込み直す
}
PROMPT_COMMAND='share_history'  # 上記関数をプロンプト毎に自動実施
shopt -u histappend             # .bash_history追記モードは不要なのでOFFに
export HISTSIZE=9999            # 履歴のMAX保存数を指定

# other aliases
alias :e=vim
alias scalc='/Applications/LibreOffice.app/Contents/MacOS/scalc'

