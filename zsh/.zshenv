if [[ -d $HOME/.config/zsh ]]; then
        export ZDOTDIR=${XDG_CONFIG_HOME:-$HOME/.config}/zsh
        if [[ -f $ZDOTDIR/.zshenv ]]; then
                . $ZDOTDIR/.zshenv
        fi
fi
