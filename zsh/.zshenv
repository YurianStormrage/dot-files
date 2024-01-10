if [[ -d $HOME/.config/zsh ]]; then
        ZDOTDIR=$HOME/.config/zsh
        if [[ -f $ZDOTDIR/.zshenv ]]; then
                . $ZDOTDIR/.zshenv
        fi
fi