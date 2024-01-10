if [[ -z `fc-list | grep "HackNerdFont"` ]]; then
    wget -P ${HOME}/.cache/font-hack-nerd-font/ https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Hack.tar.xz
    [[ -d ${HOME}/.local/share/fonts ]] || mkdir -p ${HOME}/.local/share/fonts
    tar xf ${HOME}/.cache/font-hack-nerd-font/Hack.tar.xz --directory=${HOME}/.local/share/fonts
    fc-cache -f -v
fi