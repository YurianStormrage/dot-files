ZDOTDIR=${ZDOTDIR:-$HOME/.config/zsh}
[[ -f $ZDOTDIR/.zshrc ]] && mv $ZDOTDIR/.zshrc $ZDOTDIR/.zshrc.old
[[ -f $ZDOTDIR/.zshenv ]] && mv $ZDOTDIR/.zshenv $ZDOTDIR/.zshenv.old
cp zsh/. $HOME