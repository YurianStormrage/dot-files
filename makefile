.PHONY: zshrc vimrc p10k font-hack font-jbm fonts all

zshrc:
	cp -r zsh/* $HOME

p10k: zshrc
	[[ -d $HOME/.local/share ]] || mkdir -p $HOME/.local/share
	git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git $HOME/.local/share/powerlevel10k
	if [[ -z $ZDOTDIR ]]; then
		echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> $HOME/.zshrc
	else
		echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> $ZDOTDIR/.zshrc
	fi

vimrc: zshrc
	cp -r vim/* $HOME
	if [[ -z $ZDOTDIR ]]; then
		echo 'export VIMINIT=\'source $MYVIMRC\'' >> $HOME/.zshrc
		echo 'export MYVIMRC=\'~/.vim/vimrc\'' >> $HOME/.zshrc
	else
		echo 'export VIMINIT=\'source $MYVIMRC\'' >> $ZDOTDIR/.zshrc
		echo 'export MYVIMRC=\'~/.vim/vimrc\'' >> $ZDOTDIR/.zshrc
	fi

font-hack:
	if [[ -z `fc-list | grep "HackNerdFont"` ]]; then
		wget -P $HOME/.cache/font-hack-nerd-font/ https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Hack.tar.xz
		[[ -d $HOME/.local/share/fonts ]] || mkdir -p $HOME/.local/share/fonts
		tar xf $HOME/.cache/font-hack-nerd-font/Hack.tar.xz --directory=$HOME/.local/share/fonts
		fc-cache -f -v
	fi

font-jbm:
	if [[ -z `fc-list | grep "JetBrainsMono"` ]]; then
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"
	fi

fonts: font-hack font-jbm


all: zshrc vimrc p10k fonts