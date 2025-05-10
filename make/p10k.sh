[ -d ${HOME}/.local/share ] || mkdir -p ${HOME}/.local/share
git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${XDG_DATA_HOME:-$HOME/.local/share}/powerlevel10k
# if [ -z ${ZDOTDIR} ]; then
#     echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ${HOME}/.zshrc
# else
#     echo 'source ${HOME}/.local/share/powerlevel10k/powerlevel10k.zsh-theme' >> ${ZDOTDIR}/.zshrc
# fi
ZDOTDIR=${XDG_CONFIG_HOME:-$HOME/.config}/zsh/
echo '' >> $ZDOTDIR/.zshrc
echo '# +------+' >> $ZDOTDIR/.zshrc
echo '# | p10k |' >> $ZDOTDIR/.zshrc
echo '# +------+' >> $ZDOTDIR/.zshrc
echo '' >> $ZDOTDIR/.zshrc
echo 'source ${XDG_DATA_HOME:-$HOME/.local/share}/powerlevel10k/powerlevel10k.zsh-theme' >> ${ZDOTDIR}/.zshrc
echo '' >> $ZDOTDIR/.zshrc

