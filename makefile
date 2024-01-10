.PHONY: zshrc vimrc p10k font-hack font-jbm fonts all

zshrc:
	cp -r zsh/. ${HOME}
	. ${HOME}/.zshenv

p10k: zshrc
	. make/p10k.sh

vimrc: zshrc
	. make/vimrc.sh

font-hack:
	. make/font-hack.sh

font-jbm:
	. make/font-jbm.sh

fonts: font-hack font-jbm


all: zshrc vimrc p10k fonts