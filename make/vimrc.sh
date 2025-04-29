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
#echo 'export VIMINIT='\''source $MYVIMRC'\' >> ${ZDOTDIR}/.zshenv
#echo 'export MYVIMRC='\"'${XDG_CONFIG_HOME:-$HOME/.config}/vim/.vimrc'\" >> ${ZDOTDIR}/.zshenv
echo '# vim初始化命令' >> ${ZDOTDIR}/.zshenv
echo '# NOTE: [G]VIMINIT environment variable will also affect Neovim.' >> ${ZDOTDIR}/.zshenv
echo '#       If separate configs for Vim and Neovim are desired then the following will be a better choice:' >> ${ZDOTDIR}/.zshenv
echo 'export GVIMINIT='\''let $MYGVIMRC = !has("nvim") ? "$XDG_CONFIG_HOME/vim/gvimrc" : "$XDG_CONFIG_HOME/nvim/init.gvim" | so $MYGVIMRC'\' >> ${ZDOTDIR}/.zshenv
echo 'export VIMINIT='\''let $MYVIMRC = !has("nvim") ? "$XDG_CONFIG_HOME/vim/vimrc" : "$XDG_CONFIG_HOME/nvim/init.vim" | so $MYVIMRC'\' >> ${ZDOTDIR}/.zshenv
echo '' >> $ZDOTDIR/.zshenv

mkdir -p ${XDG_STATE_HOME:-$HOME/.local/state}/vim/.backup/
mkdir -p ${XDG_STATE_HOME:-$HOME/.local/state}/vim/.swp/
mkdir -p ${XDG_STATE_HOME:-$HOME/.local/state}/vim/.undo/
