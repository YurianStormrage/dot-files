# +-------------+
# | XDG Desktop |
# +-------------+

# 在 HOME 目录下的 .zshenv 中设置配置目录
# NOTE: .zshenv设置的变量是临时变量，并未导出环境变量
export ZDOTDIR=$0
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

# +-----+
# | zsh |
# +-----+

# NOTE: 历史相关变量设置需要放在 .zshrc 中，
#       否则会被 /etc/zshrc 中的设置重置

# 历史纪录条目数量
#export HISTSIZE=10000
# 注销后保存的历史纪录条目数量
#export SAVEHIST=10000
# 历史纪录文件
#export HISTFILE="$XDG_STATE_HOME"/zsh/history

