ZDOTDIR=${ZDOTDIR:-$HOME/.config/zsh}

[[ -f $ZDOTDIR/.zshrc ]] && mv $ZDOTDIR/.zshrc $ZDOTDIR/.zshrc.old
[[ -f $ZDOTDIR/.zshenv ]] && mv $ZDOTDIR/.zshenv $ZDOTDIR/.zshenv.old

cp -r zsh/. $HOME

# 创建历史文件
source $HOME/.zshenv
if [[ $HISTFILE && ! -f $HISTFILE ]]; then
    touch $HISTFILE
fi

