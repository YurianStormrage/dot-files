cp -r vim/. ${HOME}
# if [[ -z ${ZDOTDIR} ]]; then
#     echo 'export VIMINIT='\''source $MYVIMRC'\' >> ${HOME}/.zshrc
#     echo 'export MYVIMRC='\''~/.vim/vimrc'\' >> ${HOME}/.zshrc
# else
#     echo 'export VIMINIT='\''source $MYVIMRC'\' >> ${ZDOTDIR}/.zshrc
#     echo 'export MYVIMRC='\''~/.vim/vimrc'\' >> ${ZDOTDIR}/.zshrc
# fi
ZDOTDIR=${XDG_CONFIG_HOME:-$HOME/.config}/zsh/
echo '' >> $ZDOTDIR/.zshenv
echo '# +-----+' >> $ZDOTDIR/.zshenv
echo '# | Vim |' >> $ZDOTDIR/.zshenv
echo '# +-----+' >> $ZDOTDIR/.zshenv
echo '' >> $ZDOTDIR/.zshenv
echo 'export VIMINIT='\''source $MYVIMRC'\' >> ${ZDOTDIR}/.zshenv
echo 'export MYVIMRC='\''${XDG_CONFIG_HOME:-$HOME/.config}/vim/.vimrc'\' >> ${ZDOTDIR}/.zshenv
echo '' >> $ZDOTDIR/.zshenv

mkdir -p ${XDG_STATE_HOME:-$HOME/.local/state}/vim/.backup/
mkdir -p ${XDG_STATE_HOME:-$HOME/.local/state}/vim/.swp/
mkdir -p ${XDG_STATE_HOME:-$HOME/.local/state}/vim/.undo/