if [ -z `fc-list | grep "HackNerdFont"` ]; then
    wget -P ${XDG_CACHE_HOME:-$HOME/.cache}/font-hack-nerd-font/ https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Hack.tar.xz
    [ -d ${XDG_DATA_HOME:-$HOME/.local/share}/fonts ] || mkdir -p ${XDG_DATA_HOME:-$HOME/.local/share}/fonts
    tar xf ${XDG_CACHE_HOME:-$HOME/.cache}/font-hack-nerd-font/Hack.tar.xz --directory=${XDG_DATA_HOME:-$HOME/.local/share}/fonts
    fc-cache -f -v
fi
