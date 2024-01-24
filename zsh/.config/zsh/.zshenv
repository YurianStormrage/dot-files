# +-------------+
# | XDG Desktop |
# +-------------+

export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

# +-----+
# | zsh |
# +-----+

# 历史纪录条目数量
export HISTSIZE=10000
# 注销后保存的历史纪录条目数量
export SAVEHIST=10000
# 历史纪录文件
export HISTFILE=${ZDOTDIR:-$HOME}/.zhistory
