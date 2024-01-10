[[ -d ${HOME}/.local/share ]] || mkdir -p ${HOME}/.local/share
git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${HOME}/.local/share/powerlevel10k
if [[ -z ${ZDOTDIR} ]]; then
    echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ${HOME}/.zshrc
else
    echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ${ZDOTDIR}/.zshrc
fi