# Source global definitions
if [ -f /etc/zshrc ]; then
	. /etc/zshrc
fi

export LANG=ja_JP.UTF-8
export LESS=-q

# プロンプトを設定
autoload -Uz vcs_info colors
colors

COLOR_DEF=$'%f'            # デフォルト (色リセット)
COLOR_MACHINE=$'%F{243}'
COLOR_USER=$'%F{243}'      # ユーザー名とグループ名
COLOR_DIR=$'%F{197}'       # ホスト名とカレントディレクトリ
COLOR_GIT=$'%F{39}'        # Gitブランチ情報

setopt PROMPT_SUBST
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '!'                  # 未ステージの変更
zstyle ':vcs_info:*' stagedstr '+'                    # ステージ済みの変更
zstyle ':vcs_info:git:*' formats "%b%u%c"             # 表示フォーマット
zstyle ':vcs_info:git:*' actionformats '%b|%a%u%c'
precmd_functions+=(vcs_info)

# 1行目: [ホスト名]:カレントディレクトリ
# 2行目: [Gitブランチ情報|ユーザー名(グループ名)]
LINE1="%U${COLOR_MACHINE}[%M]:%b%u %B${COLOR_DIR}%~%b"
LINE2="${COLOR_GIT}\${vcs_info_msg_0_}%b|%B${COLOR_USER}%n(%g)%b"
PROMPT="${LINE1}${COLOR_DEF}"$'\n'"${LINE2}${COLOR_DEF}%# "

source ~/.bash.d/history
source ~/.bash.d/alias
source ~/.bash.d/functions

# vim:filetype=sh
