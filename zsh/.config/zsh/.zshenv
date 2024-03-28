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
#export HISTFILE=${ZDOTDIR:-$HOME}/.zhistory
export HISTFILE="$XDG_STATE_HOME"/zsh/history

# vim初始化命令
# NOTE: [G]VIMINIT environment variable will also affect Neovim.
#       If separate configs for Vim and Neovim are desired then the following will be a better choice:
export GVIMINIT='let $MYGVIMRC = !has("nvim") ? "$XDG_CONFIG_HOME/vim/gvimrc" : "$XDG_CONFIG_HOME/nvim/init.gvim" | so $MYGVIMRC'
export VIMINIT='let $MYVIMRC = !has("nvim") ? "$XDG_CONFIG_HOME/vim/vimrc" : "$XDG_CONFIG_HOME/nvim/init.vim" | so $MYVIMRC'

