if [[ -d $HOME/.config/zsh ]]; then
        export ZDOTDIR=$HOME/.config/zsh
        if [[ -f $ZDOTDIR/.zshenv ]]; then
                . $ZDOTDIR/.zshenv
        fi
fi