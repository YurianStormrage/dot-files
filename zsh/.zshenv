XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
if [[ -d $XDG_CONFIG_HOME/zsh ]]; then
        ZDOTDIR=$XDG_CONFIG_HOME/zsh
        if [[ -f $ZDOTDIR/.zshenv ]]; then
                source $ZDOTDIR/.zshenv
        fi
fi

