cp -r vim/. ${HOME}
# if [[ -z ${ZDOTDIR} ]]; then
#     echo 'export VIMINIT='\''source $MYVIMRC'\' >> ${HOME}/.zshrc
#     echo 'export MYVIMRC='\''~/.vim/vimrc'\' >> ${HOME}/.zshrc
# else
#     echo 'export VIMINIT='\''source $MYVIMRC'\' >> ${ZDOTDIR}/.zshrc
#     echo 'export MYVIMRC='\''~/.vim/vimrc'\' >> ${ZDOTDIR}/.zshrc
# fi
ZDOTDIR=${XDG_CONFIG_HOME:-$HOME/.config}/zsh/
echo 'export VIMINIT='\''source $MYVIMRC'\' >> ${ZDOTDIR}/.zshrc
echo 'export MYVIMRC='\''~/.vim/vimrc'\' >> ${ZDOTDIR}/.zshrc