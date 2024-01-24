.PHONY: zshrc zsh-plugins vimrc p10k font-hack font-jbm fonts all

all: zshrc zsh-plugins vimrc p10k fonts

zshrc:
	cp -r zsh/. ${HOME}
	. ${HOME}/.zshenv

zsh-plugins: autojump zsh-autosuggestions zsh-completions zsh-colored-man-pages

autojump: zshrc
	. make/zsh/plugin/autojump.sh

zsh-autosuggestions: zshrc
	. make/zsh/plugin/zsh-autosuggestions.sh

zsh-completions: zshrc
	. make/zsh/plugin/zsh-completions.sh

zsh-colored-man-pages: zshrc
	. make/zsh/plugin/zsh-colored-man-pages.sh

p10k: zshrc
	. make/p10k.sh

vimrc: zshrc
	. make/vimrc.sh

font-hack:
	. make/font-hack.sh

font-jbm:
	. make/font-jbm.sh

fonts: font-hack font-jbm
